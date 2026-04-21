variable from_port {
  
  default     = 22
  
}

variable to_port {
  
  default     = 22
  
}

variable sg_protocol {
  
  default     = "tcp"
 
}

variable sg_cidr {
  type        = list(string)
  default     = ["0.0.0.0/0"] 
  
}

variable sg_ip6_cidr {
  type        = list(string)
  default     = ["::/0"]
  
}

variable common_tags {
  type        = map
  default     = {
    Project = "Expense"
    environment = "dev"
    resource_Creater = "dhanush_boga"
  }
  
}

variable sg_tags {
  default     = "allow-all-ports"
}

variable instance_names {
  type        = list(string)
  default     = ["mysql","backend","frontend"]
  
}


variable ec2_tags {
  
  default     = "My_ec2_instance"
  
}









