# main.tf
# This file defines the core resources for the web application service:
# an ALB Target Group and an Auto Scaling Group.

# 1. AWS ALB Target Group
# This target group will be registered with the Application Load Balancer
# and will forward traffic to the EC2 instances launched by the Auto Scaling Group.
resource "aws_lb_target_group" "app_target_group" {
  name_prefix = "${local.app_target_group_name_prefix}-"
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id

  # Health check configuration
  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.health_check_matcher
  }

  tags = merge(
    local.common_tags,
    {
      Name = local.app_target_group_name
    }
  )
}

# 2. AWS Auto Scaling Group (ASG)
# This ASG will manage the lifecycle of EC2 instances for the web application,
# ensuring the desired capacity is maintained and instances are registered
# with the target group.
resource "aws_autoscaling_group" "app_asg" {
  name                = local.app_asg_name
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  # Reference the existing Launch Template for instance configuration
  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  # Attach the ASG instances to the newly created ALB Target Group
  target_group_arns = [aws_lb_target_group.app_target_group.arn]

  # Optional: Enable termination policies for more controlled scaling down
  # For example, "OldestInstance", "NewestInstance", "OldestLaunchConfiguration"
  # termination_policies = ["Default"]

  # Optional: Enable instance protection from scale-in
  # instance_refresh {
  #   strategy = "Rolling"
  #   preferences {
  #     min_healthy_percentage = 90
  #   }
  # }

  dynamic "tag" {
    for_each = merge(local.common_tags, { Name = local.app_asg_name })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
