terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "epcvip-asg"


  # cannot use default tags due to insufficient privileges in EPCVIP Sandbox
  # User: arn:aws:iam::711685268649:user/david.p is not authorized to perform: iam:TagInstanceProfile
  # default_tags {
  #   tags = local.common_tags
  # }
}
