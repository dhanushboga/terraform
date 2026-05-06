variable common_tags {
  type        = map
  default     = {
     Name = "expense"
     component = "backend"
     environment = "dev"
  }
}

variable instance_type {
  type        = map

  default     = {
    mysql = "t3.micro"
    backend = "t2.micro"
    frontend = "t2.micro"
  }
  
}

variable domain_name {
  default     = "daws84s.com"
}






