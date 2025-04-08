output "ec2-ID" {
  value = aws_instance.ec2.id
}

output "ec2-public_ip" {

  value = aws_instance.ec2.public_ip
}


output "aws_ami_info" {
  value = data.aws_ami.ec2.id
}

output "ec2-platform" {
  value = data.aws_ami.ec2.platform_details
}