
module "ec2_asg_target" {
  source = "./modules/ec2_asg_target" # Adjust the path to this module

  app_name                     = local.project_name
  target_environment           = local.target_environment
  vpc_id                       = module.basic_vpc.vpc_id
  subnet_ids                   = module.basic_vpc.private_subnet_ids
  alb_source_security_group_id = module.shared_alb.alb_security_group_id

  # Target Group configuration
  target_group_port     = 80
  target_group_protocol = "HTTP"
  health_check_path     = "/"
  health_check_matcher  = "200"

  # Auto Scaling Group configuration
  launch_template_id      = module.ec2_launch_template.launch_template_id
  launch_template_version = module.ec2_launch_template.launch_template_latest_version
  desired_capacity        = 2
  # min_size could be 1 but 2 yeilds multi-az resiliency
  min_size                = 2
  max_size                = 6

  # in prod with shared alb rules will likely include path and/or host headers
  alb_listener_arn           = module.shared_alb.alb_listener_http_arn
  listener_rule_priority     = 10
  listener_rule_http_methods = ["GET"]

  enable_cpu_scaling_policies = true
  scale_up_adjustment         = 2
  scale_down_adjustment       = -2

  tags = local.common_tags
}

output "ec2_asg_target_group_arn" {
  description = "The ARN of the web application's ALB Target Group."
  value       = module.ec2_asg_target.target_group_arn
}

output "ec2_asg_target_asg_name" {
  description = "The name of the web application's Auto Scaling Group."
  value       = module.ec2_asg_target.autoscaling_group_name
}