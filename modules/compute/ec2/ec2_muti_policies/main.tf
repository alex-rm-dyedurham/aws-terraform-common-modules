locals {
  policy_count = length(var.aws_policy_names)
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.instance_name}-role"
  assume_role_policy = jsonencode(
    {
      "Version" = "2012-10-17",
      "Statement" = [
        {
          "Effect" = "Allow",
          "Action" = [
            "sts:AssumeRole"
          ],
          "Principal" = {
            "Service" = [
              "ec2.amazonaws.com"
            ]
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "policy_attachments" {
  count      = local.policy_count
  role       = aws_iam_role.ec2_role.id
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::${var.aws_policy_names[count.index]}"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.instance_name}-instance_profile"
  role = aws_iam_role.ec2_role.name
  provisioner "local-exec" {
    command = "echo 'Sleeping for 30 seconds due to https://github.com/terraform-providers/terraform-provider-aws/issues/838)' && sleep 30"
  }
  tags = merge(
    { "Name" = "${var.instance_name}-instance_profile" },
  )
}

resource "aws_instance" "ec2_instance" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  subnet_id            = var.subnet_id
  user_data            = base64encode("${var.user_data}")

  tags = merge(
    var.custom_tags,
    {
      "Name" = "${var.instance_name}"
    }
  )

  depends_on = [aws_iam_instance_profile.ec2_instance_profile]
}
