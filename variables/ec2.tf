resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name
  description = var.sg_description
  
  #usally we allow everything in egress
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = var.sg_protocol
    cidr_blocks      = var.sg_cidr #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tags
}



resource "aws_instance" "terraform_ec2" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_id
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = var.ec2_tags
}