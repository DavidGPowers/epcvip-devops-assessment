resource "aws_lb" "shared_alb" {
  name               = local.shared_alb_name
  internal           = var.internal_alb
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnet_ids

  dynamic "access_logs" {
    for_each = var.enable_access_logs ? [1] : []
    content {
      bucket  = aws_s3_bucket.alb_access_logs_bucket[0].bucket
      prefix  = var.access_logs_s3_prefix
      enabled = true # This will always be true if the block is present due to for_each
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name = local.shared_alb_name
    }
  )
}
