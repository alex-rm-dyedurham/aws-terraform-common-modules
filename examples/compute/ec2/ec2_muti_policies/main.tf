terraform {
  required_version = ">= 1.4.4, < 1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.19.0"
    }
  }
}

data "aws_ami" "linux2023" {
  most_recent = true
  owners      = ["137112412989"] # Amazon official owner account id

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-*-x86_64"]
  }
}

variable "subnet_id" {
  type = string
  description = "subnet id where to deploy the ec2"
}

module "ec2_muti_policies" {
  source = "../../../../modules/compute/ec2/ec2_muti_policies"

  instance_name         = "Testing-EC2-Multi-Policies"
  ami_id                = data.aws_ami.linux2023.image_id
  instance_type         = "t2.micro"
  subnet_id             = var.subnet_id
  aws_policy_names      = ["AmazonSSMManagedInstanceCore"]
  custom_tags = {
    "Managedby" = "Terraform"
  }
}
