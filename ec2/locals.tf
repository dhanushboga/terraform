locals {
  vpc_security_group_ids = [aws_security_group.allow-alls.id]
  instance_type          = var.instance_type
  # ami = var.ami_id
}