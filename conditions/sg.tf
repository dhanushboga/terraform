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

  tags = {
    Name = "allow-all-ports"
  }
}



resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.environment == "dev"? "t2.micro" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = "My_First_EC2_Instance"
  }
}