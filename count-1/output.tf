

output "aws_ami_info" {
  value = data.aws_ami.ec2.id
}

output "ec2-platform" {
  value = data.aws_ami.ec2.platform_details
}

output "ec2-expense-info" {
  value = aws_instance.ec2-expense
}