# outputs.tf
# This file defines the output values for the ALB module.

output "alb_arn" {
  description = "The ARN of the created Application Load Balancer."
  value       = aws_lb.shared_alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the created Application Load Balancer."
  value       = aws_lb.shared_alb.dns_name
}

output "alb_zone_id" {
  description = "The Route 53 Hosted Zone ID of the created Application Load Balancer."
  value       = aws_lb.shared_alb.zone_id
}

output "alb_listener_http_arn" {
  description = "The ARN of the HTTP listener, if enabled."
  value       = var.http_enabled ? aws_lb_listener.shared_alb_listener_http[0].arn : null
}

output "alb_listener_https_arn" {
  description = "The ARN of the HTTPS listener, if enabled."
  value       = var.https_enabled ? aws_lb_listener.shared_alb_listener_https[0].arn : null
}

output "alb_security_group_id" {
  description = "The ID of the security group attached to the ALB."
  value       = aws_security_group.alb_sg.id
}

output "alb_access_logs_s3_bucket_arn" {
  description = "The ARN of the S3 bucket for ALB access logs, if enabled."
  value       = var.enable_access_logs ? aws_s3_bucket.alb_access_logs_bucket[0].arn : null
}
