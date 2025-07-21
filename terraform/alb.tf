module "shared_alb" {
  source = "./modules/application_load_balancer"

  alb_name           = "dp-webapp"
  target_environment = local.target_environment
  vpc_id             = module.basic_vpc.vpc_id
  subnet_ids         = module.basic_vpc.public_subnet_ids

  internal_alb = false # Set to false for an internet-facing ALB

  # HTTP Listener (optional)
  http_enabled       = true
  http_port          = 80
  http_ingress_cidrs = ["0.0.0.0/0"]

  # HTTPS Listener (optional)
  https_enabled = false

  # ALB Access Logging (optional)
  enable_access_logs                       = true
  access_logs_s3_bucket_name               = local.alb_log_bucket_name
  access_logs_s3_prefix                    = local.project_name
  access_logs_s3_bucket_versioning_enabled = true
  access_logs_s3_bucket_lifecycle_enabled  = true
  ### access_logs_s3_bucket_transition_days    = 30 # Transition logs to IA after 30 days
  access_logs_s3_bucket_expiration_days = 60 # Delete logs after 60 days

  tags = local.common_tags
}

output "alb_dns_name" {
  value = module.shared_alb.alb_dns_name
}

output "alb_security_group_id" {
  value = module.shared_alb.alb_security_group_id
}