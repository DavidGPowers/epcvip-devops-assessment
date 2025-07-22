# locals.tf
# This file defines local variables for the web application service module.

locals {
  common_tags = var.tags

  # Naming convention for the target group
  app_target_group_name = "${var.app_name}-tg-${var.target_environment}"

  # Naming convention for the Auto Scaling Group
  app_asg_name = "${var.app_name}-asg-${var.target_environment}"
}
