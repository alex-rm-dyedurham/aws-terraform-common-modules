variable "aws_account_id" {
  description = "AWS account id"
  type        = string
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string
}

variable "bucket_policy" {
  description = "AWS S3 bucket name"
  type        = any
}

variable "custom_tags" {
  description = "Custom Tags"
  type        = map(string)
  default     = {}
}
