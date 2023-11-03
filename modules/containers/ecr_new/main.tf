module "ecr" {
  count = length(var.repo_names)
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.repo_names[count.index]

  repository_read_write_access_arns = var.repository_read_write_access_arns[count.index]
  repository_read_access_arns       = var.prod_nodepool_arns
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      "Name" : "${var.repo_names[count.index]}"
    }
  )
}