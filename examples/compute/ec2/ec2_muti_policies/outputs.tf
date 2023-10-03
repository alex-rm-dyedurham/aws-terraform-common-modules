output "ec2_private_ip" {
  value       = module.ec2_muti_policies.ec2_private_ip
  description = "The public IP address of the web server"
}

output "ec2_private_dns" {
  value       = module.ec2_muti_policies.ec2_private_dns
  description = "The public IP address of the web server"
}

output "role_name" {
  value       = module.ec2_muti_policies.role_name
  description = "Role name"
}
