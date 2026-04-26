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
    protocol         = var.protocol
    cidr_blocks      = var.sg_cidr #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.common_tags,
  {
    Name = "allow-all-ports"
    created_by = local.created
  }
  )
  
  
}



resource "aws_instance" "terraform_ec2" {
  count = length(var.instance_names)
  ami           = local.ami_id_fetch
  instance_type = local.instance_condition
  vpc_security_group_ids = local.security_group_ids

  tags = merge(var.common_tags,
  
  {
    Name = var.instance_names[count.index]
    created_by = local.created
  }
  )
}