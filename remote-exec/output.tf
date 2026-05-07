output "ec2_info" {
  value = aws_instance.ec2_local_exec.public_ip

}
