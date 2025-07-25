# insufficient privileges to create SSM Parameters in EPCVIP Sandbox
# AccessDeniedException: User: arn:aws:iam::711685268649:user/david.p is not authorized to perform: ssm:PutParameter


# resource "aws_ssm_parameter" "alb-arn" {
#   name        = "/shared-resources/${local.shared_alb_name}/alb-arn"
#   type        = "String"
#   value       = aws_lb.shared_alb.arn
#   description = "ARN of the shared Application Load Balancer for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-dns-name" {
#   name        = "/shared-resources/${local.shared_alb_name}/alb-dns-name"
#   type        = "String"
#   value       = aws_lb.shared_alb.dns_name
#   description = "DNS name of the shared Application Load Balancer for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-zone-id" {
#   name        = "/shared-resources/${local.shared_alb_name}/alb-zone-id"
#   type        = "String"
#   value       = aws_lb.shared_alb.zone_id
#   description = "Route 53 Hosted Zone ID of the shared Application Load Balancer for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-listener-http-arn" {
#   count = var.http_enabled ? 1 : 0

#   name        = "/shared-resources/${local.shared_alb_name}/alb-listener-http-arn"
#   type        = "String"
#   value       = aws_lb_listener.shared_alb_listener_http[0].arn
#   description = "ARN of the HTTP listener (port ${var.http_port}) for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-listener-https-arn" {
#   count = var.https_enabled ? 1 : 0

#   name        = "/shared-resources/${local.shared_alb_name}/alb-listener-https-arn"
#   type        = "String"
#   value       = aws_lb_listener.shared_alb_listener_https[0].arn
#   description = "ARN of the HTTPS listener (port ${var.https_port}) for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-security-group-id" {
#   name        = "/shared-resources/${local.shared_alb_name}/alb-security-group-id"
#   type        = "String"
#   value       = aws_security_group.alb_sg.id
#   description = "ID of the security group attached to the ALB for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }

# resource "aws_ssm_parameter" "alb-access-logs-s3-bucket-arn" {
#   count = var.enable_access_logs ? 1 : 0

#   name        = "/shared-resources/${local.shared_alb_name}/alb-access-logs-s3-bucket-arn"
#   type        = "String"
#   value       = aws_s3_bucket.alb_access_logs_bucket[0].arn
#   description = "ARN of the S3 bucket for ALB access logs for ${local.shared_alb_name}"
#   tags        = local.common_tags
# }
