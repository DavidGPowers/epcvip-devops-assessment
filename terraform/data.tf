data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ssm_parameters_by_path" "aft_custom_fields" {
  path = "/aft/account-request/custom-fields"
}
