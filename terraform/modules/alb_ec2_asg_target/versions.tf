# versions.tf
# This file specifies the required Terraform and provider versions for the module.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Ensure compatibility with your root module's AWS provider
    }
  }
  required_version = ">= 1.0"
}
