variable instance_names {
  type        = list(string)
  default     = ["mysql","backend","frontend"]
  
}


variable common_tags {
  type        = map
  default     = {
    Project = "expense"
    Environment = "dev"
    component = "backend"
  }

}


variable domain_name {
 
  default     = "daws84s.com"
  
}
