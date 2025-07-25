# main.tf

# 1. AWS ALB Target Group
resource "aws_lb_target_group" "app_target_group" {
  name     = local.app_target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  deregistration_delay = 20

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
  tags = merge(local.common_tags, { Name = local.app_target_group_name })
}

# 2. AWS Security Group for EC2 Instances
resource "aws_security_group" "ec2_target_sg" {
  name_prefix = "${var.app_name}-ec2-sg-"
  description = "Allow traffic from ALB and SSH for ${var.app_name}"
  vpc_id      = var.vpc_id

  # ADD: New ingress rule to allow SSH access.
  ingress {
    description = "Allow SSH access from specified CIDR blocks"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }

  ingress {
    description     = "Allow traffic from the Application Load Balancer"
    from_port       = var.target_group_port
    to_port         = var.target_group_port
    protocol        = "tcp"
    security_groups = [var.alb_source_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = merge(local.common_tags, { Name = "${var.app_name}-ec2-sg-${var.target_environment}" })
}

# 3. AWS Auto Scaling Group (ASG)
resource "aws_autoscaling_group" "app_asg" {
  name                = local.app_asg_name
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }
  target_group_arns = [aws_lb_target_group.app_target_group.arn]

  dynamic "tag" {
    for_each = merge(local.common_tags, { Name = local.app_asg_name })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

# 4. AWS ALB Listener Rule
resource "aws_lb_listener_rule" "app_listener_rule" {
  count = local.should_create_listener_rule ? 1 : 0

  listener_arn = var.alb_listener_arn
  priority     = var.listener_rule_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }

  dynamic "condition" {
    for_each = length(var.listener_rule_host_headers) > 0 ? { "host_header" = var.listener_rule_host_headers } : {}
    content {
      host_header { values = condition.value }
    }
  }
  dynamic "condition" {
    for_each = length(var.listener_rule_path_patterns) > 0 ? { "path_pattern" = var.listener_rule_path_patterns } : {}
    content {
      path_pattern { values = condition.value }
    }
  }
  dynamic "condition" {
    for_each = length(var.listener_rule_http_methods) > 0 ? { "http_request_method" = var.listener_rule_http_methods } : {}
    content {
      http_request_method { values = condition.value }
    }
  }
  tags = merge(local.common_tags, { Name = "${var.app_name}-rule-${var.target_environment}" })

  lifecycle {
    precondition {
      condition     = local.is_listener_rule_config_valid
      error_message = local.listener_rule_config_error_message
    }
  }
}

# 5. Auto Scaling Policies and Alarms (Step Scaling)
resource "aws_autoscaling_policy" "scale_up" {
  count = var.enable_cpu_scaling_policies ? 1 : 0

  name                   = "${local.app_asg_name}-scale-up"
  policy_type            = "StepScaling"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  adjustment_type        = "ChangeInCapacity"

  step_adjustment {
    metric_interval_lower_bound = 0
    scaling_adjustment          = var.scale_up_adjustment
  }
}

resource "aws_autoscaling_policy" "scale_down" {
  count = var.enable_cpu_scaling_policies ? 1 : 0

  name                   = "${local.app_asg_name}-scale-down"
  policy_type            = "StepScaling"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  adjustment_type        = "ChangeInCapacity"

  step_adjustment {
    metric_interval_upper_bound = 0
    scaling_adjustment          = var.scale_down_adjustment
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  count = var.enable_cpu_scaling_policies ? 1 : 0

  alarm_name          = "${local.app_asg_name}-cpu-high-alarm"
  alarm_description   = "This alarm triggers a scale-up when CPU utilization is high."
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_threshold_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.scale_up_cpu_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up[0].arn]
  tags          = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  count = var.enable_cpu_scaling_policies ? 1 : 0

  alarm_name          = "${local.app_asg_name}-cpu-low-alarm"
  alarm_description   = "This alarm triggers a scale-down when CPU utilization is low."
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_threshold_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.scale_down_cpu_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down[0].arn]
  tags          = local.common_tags
}
