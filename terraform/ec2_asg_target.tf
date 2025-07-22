
module "web_app_service" {
  source = "./modules/ec2_asg_target" # Adjust the path to this module

  app_name           = local.project_name
  target_environment = local.target_environment
  vpc_id             = module.basic_vpc.vpc_id
  subnet_ids         = module.basic_vpc.private_subnet_ids

  alb_arn = module.shared_alb.alb_arn

  # Target Group configuration
  target_group_port     = 80
  target_group_protocol = "HTTP"
  health_check_path     = "/"
  health_check_matcher  = "200"

  # Auto Scaling Group configuration
  launch_template_id      = module.ec2_launch_template.launch_template_id
  launch_template_version = module.ec2_launch_template.launch_template_latest_version
  desired_capacity        = 2
  min_size                = 1
  max_size                = 3

  tags = local.common_tags
}

output "web_app_target_group_arn" {
  description = "The ARN of the web application's ALB Target Group."
  value       = module.web_app_service.target_group_arn
}

output "web_app_autoscaling_group_name" {
  description = "The name of the web application's Auto Scaling Group."
  value       = module.web_app_service.autoscaling_group_name
}