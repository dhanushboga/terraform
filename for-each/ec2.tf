resource "aws_instance" "ec2" {

  for_each = var.instances

  ami                    = local.ami_id
  instance_type          = each.value
  vpc_security_group_ids = local.vpc_security_group_ids
  tags                   = {
        Name = each.key
        Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow-alls" {

  name        = "allow-alls"
  description = "Allow the traffic to ec2-instance"
  tags        = var.aws_sg_tags

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


output "ec2-info" {
  value = aws_instance.ec2
}


# git filter-branch --tree-filter 'rm -rf .terraform' HEAD
# git log --oneline