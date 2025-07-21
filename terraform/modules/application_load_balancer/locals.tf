locals {
  common_tags = var.tags

  shared_alb_name = "${var.alb_name}-${var.target_environment}"

  alb_sg_name = "${var.alb_name}-sg-${var.target_environment}"

  http_listener_name = "${var.alb_name}-listener-http-${var.target_environment}"

  https_listener_name = "${var.alb_name}-listener-https-${var.target_environment}"
}
