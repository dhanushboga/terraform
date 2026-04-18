variable sg_name {
  type        = string
  default     = "allow_sshh"
  description = "Name of the security group"
}

variable sg_description {
  type        = string
  default     = "Allow TLS inbound traffic and all outbound traffic"
  
}

variable sg_from_port {
  
  default     = 22
  
}

variable sg_to_port {
  type        = string
  default     = 22
  
}

variable sg_protocol {
  type        = string
  default     = "tcp"
  
}

variable sg_cidr {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  
}

variable sg_ipv6_cidr {
  type        = list(string)
  default     = ["::/0"]
  
}

variable sg_tags {
  
  default  = {
    Name = "allow-all-ports"
  }
 
}

variable ec2_ami_id {
  default     = "ami-0220d79f3f480ecf5"
}

variable ec2_instance_type {
  default     = "t2.micro"
}


variable ec2_tags {
  
  default     = {
    Name = "My_First_EC2_Instance"
  }
  
}





