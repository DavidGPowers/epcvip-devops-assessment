# main.tf
# This file defines the core resources for the web application service:
# an ALB Target Group, a Security Group for the instances, and an Auto Scaling Group.

# 1. AWS ALB Target Group
# This target group will be registered with the Application Load Balancer
# and will forward traffic to the EC2 instances launched by the Auto Scaling Group.
resource "aws_lb_target_group" "app_target_group" {
  name     = local.app_target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

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

# 2. AWS Security Group for EC2 Instances
# This security group should be associated with the instances in the launch template.
# It allows inbound traffic from the Application Load Balancer.
resource "aws_security_group" "ec2_target_sg" {
  name_prefix = "${var.app_name}-ec2-sg-"
  description = "Allow traffic from ALB to EC2 instances for ${var.app_name}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from the Application Load Balancer"
    from_port       = var.target_group_port
    to_port         = var.target_group_port
    protocol        = "tcp"
    security_groups = [var.alb_source_security_group_id]
  }

  # in production environment managed repo mirror such as Atrifactory JFrog
  # might allow more restrictive egress for package installs via userdata
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.app_name}-ec2-sg-${var.target_environment}"
    }
  )
}

# 3. AWS Auto Scaling Group (ASG)
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

  dynamic "tag" {
    for_each = merge(local.common_tags, { Name = local.app_asg_name })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
