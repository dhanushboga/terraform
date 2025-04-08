# variable "ami_id" {
#   default = "ami-09c813fb71547fc4f"
# }

variable "instance_type" {
  default = "t3.micro"
}

variable "instance_name" {
  default = ["mysql","backend","frontend"]
}

variable "aws_sg_tags" {
  default = {
    Name = "allow-alls"
  }
}

variable "environment" {
  default = "dev"
}

# terraform plan -var "instance_type=t3.large"
# export TF_VAR_instance_type="t3.xlarge"


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

variable "zone_id" {
  default = "Z0114644T1E9W6IGWPZI"
}

variable "domain_name" {
  default = "chenchudaws82s.online"
}

variable "common_tags" {
  default = {
    project = "expense"
    environment = "dev"
  }
}

# variable preferences

# 1) command -line
# 2) tfvars
# 3) ENV (export TF_VAR_instance_type="t3.xlarge")
# 4) default
# 5) command prompt like "enter the instance type"