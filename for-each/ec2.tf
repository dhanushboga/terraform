resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic and all outbound traffic via this security group"
  
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

  tags = {
    Name = "allow-all-ports"
  }
}



resource "aws_instance" "expense" {
  for_each = var.instance_type
  ami           = data.aws_ami.ec2.id
  instance_type = each.value
  vpc_security_group_ids = local.vpc_sg_group_id

  tags = merge(var.common_tags,
  
  {
    Name = each.key
  }
  
  )
}