data "aws_ami" "ec2" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "platform-details"
    values = ["Red Hat Enterprise Linux"]
  }

}


output "aws_ami_info" {
  value = data.aws_ami.ec2.id
}

output "ec2-platform" {
  value = data.aws_ami.ec2.platform_details
}
