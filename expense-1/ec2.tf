resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  #usally we allow everything in egress
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.common_tags,
  {
    Name = "allow-all-ports"
    Created_by = "dhanush_boga"
  }
  )
}
  



resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = data.aws_ami.expense_ec2.id
  instance_type = var.instance_names[count.index] == "mysql"? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = merge(var.common_tags,
  {
    Name = var.instance_names[count.index]
    Created_by = "dhanush_boga"
  }
 )
}
  
  
  
  