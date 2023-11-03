output "ecr_repos_arn" {
  value = zipmap(var.repo_names, aws_ecr_repository.repos.*.arn)
}

output "ecr_repos_url" {
  value = zipmap(var.repo_names, aws_ecr_repository.repos.*.repository_url)
}
