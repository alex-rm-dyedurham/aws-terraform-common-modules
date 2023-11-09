terraform {
  required_version = ">= 1.4.3, < 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.24.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "ca-central-1"
}

variable "aws_account_id" {
  type = string
}

module "s3-generic" {
  source = "../../../modules/storage/s3-generic"

  aws_account_id = var.aws_account_id
  bucket_name    = "from-example-module-x9y8z7"
  bucket_policy = jsondecode(
    templatefile(
      "${path.module}/policy.json", {
        bucket_name    = "from-example-module-x9y8z7"
        aws_account_id = var.aws_account_id
      }
    )
  )
  custom_tags = {
    "ManagedBy" = "Terraform"
    "Project"   = "Terraform Example Modules"
  }
}

output "s3_bucket_name" {
  value       = module.s3-generic.s3_bucket_name
  description = "S3 bucket name"
}
