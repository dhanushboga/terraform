variable from_port {
  
  default     = 22
  
}

variable to_port {
  
  default     = 22
  
}

variable protocol {
  type        = string
  default     = "tcp"
  
}

variable  sg_cidr {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  
}

variable common_tags {

  type        = map
  default     = {
    Name = "robo-shop"
    Environment = "dev"
    Component = "backend"
  }
  
}

variable instance_names {
  type        = list(string)
  default     = ["mysql","backend","frontend"]
  
}

variable created_owner {
  type        = string
  default     = "dhanush_boga"
  
}

variable domain_name{
    default = "daws81s.com"
}

variable environment {
  
  default     = "prod"
  
}





