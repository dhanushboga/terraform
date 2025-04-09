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

output "default_vpc-ID" {
  value = data.aws_vpc.default.id
}

#output blocks are used to print the information.it will be used in the module developement.