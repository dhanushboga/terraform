resource "aws_security_group" "allow_ssh_terraform" {
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
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.sg_protocol
    cidr_blocks      = var.sg_cidr #allow from everyone
    ipv6_cidr_blocks = var.sg_ip6_cidr
  }

  tags = merge(
  var.common_tags,
  {
    Name = var.sg_tags
  }
  )
}



resource "aws_instance" "terraform_ec2" {
  count = length(var.instance_names)
  ami           = data.aws_ami.ec2.id
  instance_type = data.aws_ec2_instance_type.ec2_ins_type.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = merge(
    var.common_tags,
    {
        Name = var.instance_names[count.index]
        tags = var.ec2_tags
    }
  )
}