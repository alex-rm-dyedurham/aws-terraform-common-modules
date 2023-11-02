resource "aws_ecr_repository" "repos" {
  count = length(var.repo_names)
  name  = var.repo_names[count.index]
	image_tag_mutability = var.image_tag_mutability
	image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(
    var.tags,
    {
      "Name" : "${var.repo_names[count.index]}"
    }
  )
}
