# variable "ami_id" {
#   default = "ami-09c813fb71547fc4f"
# }

variable "instance_type" {
  default = "t3.micro"
}

# variable "aws_tags" {
#   type = map
#   default = {
#     project     = "expense"
#     Name        = "aws-terraform"
#     environment = "dev"
#     component   = "backend"
#   }
#   description = "this is aws_tagging"

# }


variable "project" {
  default = "expense"

}


variable "component" {
  default = "backend"

}


variable "environment" {
  default = "dev"

}

variable "aws_sg_tags" {
  default = {
    Name = "allow-alls"
  }
}


variable "Name" {
  default = "${var.project}-${var.component}-${var.environment}"
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


# variable preferences

# 1) command -line
# 2) tfvars
# 3) ENV (export TF_VAR_instance_type="t3.xlarge")
# 4) default
# 5) command prompt like "enter the instance type"