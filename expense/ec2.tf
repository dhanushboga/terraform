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
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.common_tags,
  {
    Name = "allow-all-ports"
  }
  )
}
  



resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = merge(var.common_tags,
  {
    Name = var.instance_names[count.index]
  }
 )
}
  
  
  
  