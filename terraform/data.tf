data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ssm_parameters_by_path" "aft_custom_fields" {
  path = "/aft/account-request/custom-fields"
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
