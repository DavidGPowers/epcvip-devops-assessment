data "aws_vpc" "selected_vpc" {
  id = var.vpc_id
}

resource "aws_security_group" "alb_sg" {
  name        = local.alb_sg_name
  description = "Security group for ${local.shared_alb_name} ALB"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.http_enabled ? var.http_ingress_cidrs : []
    content {
      from_port   = var.http_port
      to_port     = var.http_port
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Allow HTTP from ${ingress.value}"
    }
  }

  dynamic "ingress" {
    for_each = var.http_enabled ? var.http_ingress_sg_ids : []
    content {
      from_port       = var.http_port
      to_port         = var.http_port
      protocol        = "tcp"
      security_groups = [ingress.value]
      description     = "Allow HTTP from SG ${ingress.value}"
    }
  }

  dynamic "ingress" {
    for_each = var.http_enabled ? [1] : []
    content {
      from_port   = var.http_port
      to_port     = var.http_port
      protocol    = "tcp"
      cidr_blocks = [data.aws_vpc.selected_vpc.cidr_block]
      description = "Allow HTTP from VPC CIDR"
    }
  }

  dynamic "ingress" {
    for_each = var.https_enabled ? var.https_ingress_cidrs : []
    content {
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Allow HTTPS from ${ingress.value}"
    }
  }

  dynamic "ingress" {
    for_each = var.https_enabled ? var.https_ingress_sg_ids : []
    content {
      from_port       = var.https_port
      to_port         = var.https_port
      protocol        = "tcp"
      security_groups = [ingress.value]
      description     = "Allow HTTPS from SG ${ingress.value}"
    }
  }

  dynamic "ingress" {
    for_each = var.https_enabled ? [1] : []
    content {
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      cidr_blocks = [data.aws_vpc.selected_vpc.cidr_block]
      description = "Allow HTTPS from VPC CIDR"
    }
  }

  # Default egress rule: Allow all outbound traffic on all ports.
  # This rule is applied only if the ALB is internet-facing and no specific egress rules are provided.
  dynamic "egress" {
    for_each = length(var.http_egress_cidrs) == 0 && length(var.http_egress_sg_ids) == 0 && length(var.https_egress_cidrs) == 0 && length(var.https_egress_sg_ids) == 0 ? [1] : []
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic by default with no explicit egress"
    }
  }

  # Optional: HTTP egress rules for specific outbound control
  # Allowing egress on all ports for flexibility to backend services
  dynamic "egress" {
    for_each = var.http_egress_cidrs
    content {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = [egress.value]
      description = "Allow HTTP egress to ${egress.value} on all ports"
    }
  }

  dynamic "egress" {
    for_each = var.http_egress_sg_ids
    content {
      from_port       = 0
      to_port         = 65535
      protocol        = "tcp"
      security_groups = [egress.value]
      description     = "Allow HTTP egress to SG ${egress.value} on all ports"
    }
  }

  # Optional: HTTPS egress rules for specific outbound control
  # Allowing egress on all ports for flexibility to backend services
  dynamic "egress" {
    for_each = var.https_egress_cidrs
    content {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = [egress.value]
      description = "Allow HTTPS egress to ${egress.value} on all ports"
    }
  }

  dynamic "egress" {
    for_each = var.https_egress_sg_ids
    content {
      from_port       = 0
      to_port         = 65535
      protocol        = "tcp"
      security_groups = [egress.value]
      description     = "Allow HTTPS egress to SG ${egress.value} on all ports"
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name = local.alb_sg_name
    }
  )
}
