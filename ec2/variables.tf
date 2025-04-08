# variable "ami_id" {
#   default = "ami-09c813fb71547fc4f"
# }

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_tags" {
  default = {
    Name        = "aws-terraform"
    environment = "dev"
  }

}

variable "aws_parameter_tags" {
  default = {
    environment = "dev"
    resource    = "ec2_instance"
  }
}


variable "aws_sg_tags" {
  default = {
    Name = "allow-alls"
  }
}