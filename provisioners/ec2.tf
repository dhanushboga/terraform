resource "aws_instance" "ec2" {

  ami                    = local.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = local.vpc_security_group_ids
  tags                   = {
        Name = local.Name
        Purpose = "terraform-practice"
  }

  provisioner "local-exec" {
    command = "echo the server ip ${self.private_ip} > inventory"
  }
  
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"          #this will execute at the time of server creation only
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [  
    "sudo dnf install nginx -y",
    "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [  
    
    "sudo systemctl stop nginx"
    ]
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



# git filter-branch --tree-filter 'rm -rf .terraform' HEAD
# git log --oneline