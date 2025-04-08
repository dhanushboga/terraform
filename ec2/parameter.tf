resource "aws_ssm_parameter" "ec2-instance-id" {
  name        = "/practice/terraform/ec2-instance"
  description = "creation of ec2-instance using terraform"
  type        = "String"
  value       = aws_instance.ec2.id
  tags        = local.ec2_parameters_tags
}


resource "aws_ssm_parameter" "security_group_id" {
  name        = "/practice/terraform/security_group_id"
  description = "creation of security_group using terraform"
  type        = "String"
  value       = aws_security_group.allow-alls.id
  tags        = local.sg_aws_parameters_tags
}