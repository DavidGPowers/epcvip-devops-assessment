# locals.tf
# This file defines local variables for the web application service module.

locals {
  common_tags = var.tags

  # Naming convention for the target group
  app_target_group_name = "${var.app_name}-tg-${var.target_environment}"

  # Naming convention for the Auto Scaling Group
  app_asg_name = "${var.app_name}-asg-${var.target_environment}"

  # Determine if a listener rule should be created based on whether any conditions are provided.
  should_create_listener_rule = length(var.listener_rule_host_headers) > 0 || length(var.listener_rule_path_patterns) > 0 || length(var.listener_rule_http_methods) > 0

  # Validation logic for listener rule configuration.
  is_listener_rule_config_valid = !local.should_create_listener_rule || (
    var.alb_listener_arn != null &&
    var.listener_rule_priority != null
  )
  listener_rule_config_error_message = "When providing listener rule conditions (host_headers, path_patterns, or http_methods), you must also specify alb_listener_arn and listener_rule_priority."
}
