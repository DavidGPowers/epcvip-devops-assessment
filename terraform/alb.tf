module "shared_alb" {
  source = "./modules/application_load_balancer"

  alb_name           = "my-application"
  target_environment = "dev"
  vpc_id             = "vpc-0123456789abcdef0"
  subnet_ids         = ["subnet-0abcdef1234567890", "subnet-0fedcba9876543210"]
  internal_alb       = false # Set to false for an internet-facing ALB

  # HTTP Listener (optional)
  http_enabled = true
  http_port    = 80

  # HTTPS Listener (optional)
  https_enabled = false

  # ALB Access Logging (optional)
  enable_access_logs                       = true
  access_logs_s3_bucket_name               = "my-app-alb-access-logs-dev"
  access_logs_s3_prefix                    = "app-alb"
  access_logs_s3_bucket_versioning_enabled = true
  access_logs_s3_bucket_lifecycle_enabled  = true
  access_logs_s3_bucket_transition_days    = 10 # Transition logs to IA after 10 days
  access_logs_s3_bucket_expiration_days    = 30 # Delete logs after 30 days

  tags = {
    Project     = "MyApplication"
    Environment = "Development"
  }
}

output "alb_dns_name" {
  value = module.shared_alb.alb_dns_name
}

output "alb_security_group_id" {
  value = module.shared_alb.alb_security_group_id
}