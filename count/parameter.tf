
resource "aws_ssm_parameter" "security_group_id" {
  name        = "/practice/terraform/security_group_id"
  description = "creation of security_group using terraform"
  type        = "String"
  value       = aws_security_group.allow-alls.id
  tags        = local.sg_aws_parameters_tags
}