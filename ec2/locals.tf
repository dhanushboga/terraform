locals {
  vpc_security_group_ids = [aws_security_group.allow-alls.id]
  instance_type          = var.instance_type
  sg_aws_parameters_tags        = var.aws_parameter_tags
  ec2_parameters_tags        = var.aws_parameter_tags
  # ami = var.ami_id
}