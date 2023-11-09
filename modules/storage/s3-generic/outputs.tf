output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "S3 bucket name"
}
