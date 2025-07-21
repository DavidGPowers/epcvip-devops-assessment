resource "aws_lb_listener" "shared_alb_listener_http" {
  count = var.http_enabled ? 1 : 0

  load_balancer_arn = aws_lb.shared_alb.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "No matching rule found. Default fixed-response triggered. ${local.http_listener_name} HTTP:${var.http_port}"
      status_code  = "200"
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name = local.http_listener_name
    }
  )
}

resource "aws_lb_listener" "shared_alb_listener_https" {
  count = var.https_enabled ? 1 : 0

  load_balancer_arn = aws_lb.shared_alb.arn
  port              = var.https_port
  protocol          = "HTTPS"
  certificate_arn   = var.https_tls_cert_arn

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "No matching rule found. Default fixed-response triggered. ${local.https_listener_name} HTTPS:${var.https_port}"
      status_code  = "200"
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name = local.https_listener_name
    }
  )
}
