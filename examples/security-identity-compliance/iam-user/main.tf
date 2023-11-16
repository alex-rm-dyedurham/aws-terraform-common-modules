terraform {
  required_version = ">= 1.4.4, < 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.24.0"
    }
  }
}

module "ecr" {
  source = "../../../modules/security-identity-compliance/iam-user"

  user_name = [
    "test-user-01",
    "test-user-02",
    "test-user-03",
  ]
  create_inline_policy = true
  inline_policy        = jsondecode(file("${path.module}/policy.json"))
}

output "iam_user_arn" {
  value       = module.ecr.iam_user_arn
  description = "The ARN of the created IAM user"
}

output "iam_user_name" {
  value       = module.ecr.iam_user_name
  description = "The IAM username"
}

output "user_attributes" {
  value       = module.ecr.user_attributes
  description = "All user attributes"
}
