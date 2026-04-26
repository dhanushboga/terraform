locals {
  instance_condition = var.environment == "prod"? "t3.micro" : "t2.micro"
  ami_id_fetch = data.aws_ami.expense_ec2.id
  security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  created = var.created_owner
}
