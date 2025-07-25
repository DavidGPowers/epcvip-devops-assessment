terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    # Provider for TLS key generation
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0"
    }
    # Provider to write local files (e.g., the private key)
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1"
    }
    # Provider to make HTTP requests (e.g., to get public IP)
    http = {
      source  = "hashicorp/http"
      version = ">= 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "epcvip-asg"
}
