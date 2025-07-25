# =================================================================================================
# IAM Resources for SSM Session Manager
# These resources are conditionally created if var.create_ssm_instance_profile is set to true.
# =================================================================================================

# IAM Role that EC2 instances will assume.
resource "aws_iam_role" "ssm_role" {
  count = var.create_ssm_instance_profile ? 1 : 0

  name_prefix = "${var.ec2_template_prefix}-ssm-role-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Sid    = "EC2AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = local.common_tags
}

# Attaches the AWS managed policy for SSM core functionality to the IAM role.
resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  count = var.create_ssm_instance_profile ? 1 : 0

  role       = aws_iam_role.ssm_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# The instance profile, which is a container for the IAM role.
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  count = var.create_ssm_instance_profile ? 1 : 0

  name_prefix = "${var.ec2_template_prefix}-ssm-profile-"
  role        = aws_iam_role.ssm_role[0].name
}


# =================================================================================================
# Core Launch Template and Related Resources
# =================================================================================================

resource "aws_launch_template" "main" {
  name_prefix   = var.ec2_template_prefix
  image_id      = local.ami_id_for_launch_template
  instance_type = var.instance_type
  # ADD: The key_name for SSH access. It's null if not provided.
  key_name  = var.key_name
  user_data = var.user_data == "" ? null : base64encode(var.user_data)

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = var.root_volume_size
      volume_type           = var.root_volume_type
      delete_on_termination = true
      encrypted             = true
    }
  }

  network_interfaces {
    security_groups             = var.vpc_security_group_ids
    associate_public_ip_address = var.associate_public_ip_address
    delete_on_termination       = true
  }

  # Conditionally attach an IAM instance profile.
  dynamic "iam_instance_profile" {
    for_each = local.instance_profile_arn_to_use != "" ? [1] : []
    content {
      arn = local.instance_profile_arn_to_use
    }
  }

  monitoring {
    enabled = var.enable_detailed_monitoring
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-instance"
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-volume"
    })
  }

  tag_specifications {
    resource_type = "network-interface"
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-eni"
    })
  }

  update_default_version = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = local.common_tags
}
