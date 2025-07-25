data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# Data source to get the public IP of the machine running terraform.
# This is used to automatically set the SSH ingress rule.
# UPDATED: Changed URL to the suggested service, api.ipify.org.
data "http" "my_public_ip" {
  url = "https://api.ipify.org"
}

# in production it is likely that networking will exist and be discoverable via tags
# data "aws_vpc" "app_vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["*AppVPC"]
#   }
# }

# data "aws_subnets" "app_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.app_vpc.id]
#   }
#   filter {
#     name   = "availability-zone"
#     values = ["us-east-2a", "us-east-2b"] # Ensure subnets in different AZs
#   }
# }
