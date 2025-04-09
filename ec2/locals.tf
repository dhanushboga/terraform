locals {
  vpc_security_group_ids = [aws_security_group.allow-alls.id]
  instance_type          = var.instance_type
  sg_aws_parameters_tags = var.sg_aws_parameter_tags
  ec2_parameters_tags    = var.ec2_parameter_tags
  # aws_tags               = var.aws_tags
  ami_id                 = data.aws_ami.ec2.id
  name = "${var.project}-${var.component}-${var.environment}"   #expense-backend-dev
  # ami = var.ami_id
}


# locals are used to run and store the expressions or functions or keyvalue paires and save the results to variables
# locals we cannot override,where as variables can be override
# variables cannot store expressions 
# variables cannot refer other variables
