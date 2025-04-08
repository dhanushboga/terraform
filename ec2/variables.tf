# variable "ami_id" {
#   default = "ami-09c813fb71547fc4f"
# }

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_tags" {
  type = map
  default = {
    project     = "expense"
    Name        = "aws-terraform"
    environment = "dev"
    component   = "backend"
  }
  description = "this is aws_tagging"

}

variable "aws_sg_tags" {
  default = {
    Name = "allow-alls"
  }
}






variable "ec2_parameter_tags" {
  default = {
    environment = "dev"
    resource    = "ec2_instance"
  }
}


variable "sg_aws_parameter_tags" {
  default = {
    environment = "dev"
    resource    = "ec2_instance-sg"
  }
}
