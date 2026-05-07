resource "aws_instance" "ec2_local_exec" {
  ami           = data.aws_ami.ec2.id
  instance_type = data.aws_ec2_instance_type.ec2_ins_type.instance_type
  vpc_security_group_ids = local.security_id

  tags = merge(var.common_tags,
  {
    Name = var.ec2_tags
  }
  )

  provisioner "local-exec" {
    command = "echo The server's public IP address is ${self.public_ip} > public_ip.txt"

  }
}

resource "aws_security_group" "allow_all_ssh_terraform" {
  name        = "allow_sshh"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  #usally we allow everything in egress
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.common_tags,
  {
    Name = var.sg_tags
  }
  )
}