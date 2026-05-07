output "ec2_info" {
  value = aws_instance.ec2_local_exec.private_ip

}
