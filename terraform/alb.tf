module "shared_alb" {
  source = "./modules/application_load_balancer"

  alb_name           = "dp-webapp"
  target_environment = local.target_environment
  vpc_id             = data.aws_vpc.app_vpc.id
  subnet_ids         = data.aws_subnets.app_subnets.ids
  internal_alb       = false # Set to false for an internet-facing ALB

  # HTTP Listener (optional)
  http_enabled = true
  http_port    = 80

  # HTTPS Listener (optional)
  https_enabled = false

  # ALB Access Logging (optional)
  enable_access_logs                       = true
  access_logs_s3_bucket_name               = local.alb_log_bucket_name
  access_logs_s3_prefix                    = local.project_name
  access_logs_s3_bucket_versioning_enabled = true
  access_logs_s3_bucket_lifecycle_enabled  = true
  access_logs_s3_bucket_transition_days    = 10 # Transition logs to IA after 10 days
  access_logs_s3_bucket_expiration_days    = 30 # Delete logs after 30 days

  tags = local.common_tags
}

output "alb_dns_name" {
  value = module.shared_alb.alb_dns_name
}

output "alb_security_group_id" {
  value = module.shared_alb.alb_security_group_id
}