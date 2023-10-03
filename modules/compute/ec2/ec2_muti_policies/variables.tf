variable "instance_name" {
  type        = string
  description = "Name for the ec2 instance"
}

variable "ami_id" {
  type        = string
  description = "The AMI to run in the cluster"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only free tier is allowed: t2.micro | t3.micro."
  }
}

variable "subnet_id" {
  type        = string
  description = "VPC Subnet ID to launch in"
}

variable "aws_policy_names" {
  type = list(string)
}

variable "custom_tags" {
  description = "Tags to assign to the created resources"
  type        = map(string)
  default     = {}
}
