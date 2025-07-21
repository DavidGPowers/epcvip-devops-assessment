locals {
  project_name       = "dp-webapp"
  author             = "David Powers"
  author_email       = "david@powersemail.com"
  target_environment = var.target_environment


  alb_log_bucket_name = "${local.project_name}-${local.target_environment}-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.region}"

  common_tags = {
    TerraformProject = local.project_name
    Author           = local.author
    AuthorEmail      = local.author_email
  }

}