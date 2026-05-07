
variable common_tags {
  type        = map
  default     = {
     Name = "local-exec"
     component = "local-exec-instance"
     Environment = "Prod"

  }
  
}


variable ec2_tags {
  type        = string
  default     = "My_First_EC2_Instance for local exec"
  
}


variable sg_tags {
  type        = string
  default     = "allow-all-ports"
  
}
