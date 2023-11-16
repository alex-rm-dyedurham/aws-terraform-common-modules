resource "aws_iam_user" "main" {
  count = length(var.user_name)
  name  = var.user_name[count.index]
  tags  = var.custom_tags
}

resource "aws_iam_user_policy" "inline_policy" {
  count = var.create_inline_policy ? length(var.user_name) : 0
  name  = "${var.user_name[count.index]}-inline-policy"
  user  = aws_iam_user.main[count.index].name

  policy = jsonencode(var.inline_policy)
}
