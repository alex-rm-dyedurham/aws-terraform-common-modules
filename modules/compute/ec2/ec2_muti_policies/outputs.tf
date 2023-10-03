output "ec2_private_ip" {
  value       = aws_instance.ec2_instance.private_ip
  description = "The public IP address of the web server"
}

output "ec2_private_dns" {
  value       = aws_instance.ec2_instance.private_dns
  description = "The public IP address of the web server"
}

output "role_name" {
  value       = aws_iam_role.ec2_role.name
  description = "Role name"
}
