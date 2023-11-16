output "iam_user_arn" {
  value       = aws_iam_user.main[*].arn
  description = "The ARN of the created IAM user"
}

output "iam_user_name" {
  value       = aws_iam_user.main[*].name
  description = "The IAM username"
}

output "user_attributes" {
  value       = aws_iam_user.main
  description = "All user attributes"
}
