variable "aws_account_id" {
  description = "AWS account id"
  type        = string
}

variable "aws_backend_name" {
  description = "Backend name"
  type        = string
}

variable "custom_tags" {
  description = "Custom Tags"
  type        = map(string)
  default     = {}
}
