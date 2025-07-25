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

  # insufficient privileges to tag instance profiles in EPCVIP sandbox
  # Error: creating IAM Instance Profile (dp-webapp-dev-ssm-profile-20250724220958955000000002): 
  # operation error IAM: CreateInstanceProfile, https response error StatusCode: 403, 
  # RequestID: 93bb7a7f-cfc3-49d4-b409-04fc39a2783a, api error AccessDenied: 
  # User: arn:aws:iam::711685268649:user/david.p is not authorized to perform: iam:TagInstanceProfile on 
  # resource: arn:aws:iam::711685268649:instance-profile/dp-webapp-dev-ssm-profile-20250724220958955000000002 
  # because no identity-based policy allows the iam:TagInstanceProfile action
  # tags = local.common_tags
}


# =================================================================================================
# Core Launch Template and Related Resources
# =================================================================================================

resource "aws_launch_template" "main" {
  name_prefix   = var.ec2_template_prefix
  image_id      = local.ami_id_for_launch_template
  instance_type = var.instance_type
  # key_name is no longer needed as access is managed by SSM Session Manager.
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
  # It uses the profile created by this module if enabled, otherwise uses the one specified in the variable.
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



# insufficient privileges to create SSM Parameters in EPCVIP Sandbox
# AccessDeniedException: User: arn:aws:iam::711685268649:user/david.p is not authorized to perform: ssm:PutParameter
# resource "aws_ssm_parameter" "project_ami_id" {
#   name        = "/ec2/launch-templates/${var.ec2_template_prefix}/ami_id"
#   type        = "String"
#   value       = local.ami_id_for_launch_template
#   description = "AMI ID used for EC2 Launch Template ${var.ec2_template_prefix}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "launch_template_id" {
#   name        = "/ec2/launch-templates/${var.ec2_template_prefix}/id"
#   type        = "String"
#   value       = aws_launch_template.main.id
#   description = "ID of the EC2 Launch Template for ${var.ec2_template_prefix}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "launch_template_arn" {
#   name        = "/ec2/launch-templates/${var.ec2_template_prefix}/arn"
#   type        = "String"
#   value       = aws_launch_template.main.arn
#   description = "ARN of the EC2 Launch Template for ${var.ec2_template_prefix}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "launch_template_latest_version" {
#   name        = "/ec2/launch-templates/${var.ec2_template_prefix}/latest_version"
#   type        = "String"
#   value       = aws_launch_template.main.latest_version
#   description = "Latest version of the EC2 Launch Template for ${var.ec2_template_prefix}"
#   tags        = local.common_tags
# }
