locals {
  vpc_security_group_ids = [aws_security_group.allow-alls.id]
  sg_aws_parameters_tags = var.sg_aws_parameter_tags
  ec2_parameters_tags    = var.ec2_parameter_tags
  instance_type          = var.instance_type
  # ami = var.ami_id
}