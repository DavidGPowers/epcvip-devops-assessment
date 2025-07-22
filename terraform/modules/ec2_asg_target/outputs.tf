# outputs.tf
# This file defines the output values for the web application service module.

output "target_group_arn" {
  description = "The ARN of the created ALB Target Group."
  value       = aws_lb_target_group.app_target_group.arn
}

output "target_group_name" {
  description = "The name of the created ALB Target Group."
  value       = aws_lb_target_group.app_target_group.name
}

output "autoscaling_group_name" {
  description = "The name of the created Auto Scaling Group."
  value       = aws_autoscaling_group.app_asg.name
}

output "autoscaling_group_arn" {
  description = "The ARN of the created Auto Scaling Group."
  value       = aws_autoscaling_group.app_asg.arn
}

output "ec2_target_security_group_id" {
  description = "The ID of the security group created for the EC2 instances. This should be passed to the launch template module."
  value       = aws_security_group.ec2_target_sg.id
}

output "listener_rule_arn" {
  description = "The ARN of the created ALB Listener Rule, if created."
  value       = local.should_create_listener_rule ? aws_lb_listener_rule.app_listener_rule[0].arn : "Listener rule not created."
}

output "scale_up_policy_arn" {
  description = "The ARN of the scale-up Auto Scaling policy, if created."
  value       = var.enable_cpu_scaling_policies ? aws_autoscaling_policy.scale_up[0].arn : "CPU scaling not enabled."
}

output "scale_down_policy_arn" {
  description = "The ARN of the scale-down Auto Scaling policy, if created."
  value       = var.enable_cpu_scaling_policies ? aws_autoscaling_policy.scale_down[0].arn : "CPU scaling not enabled."
}

output "cpu_high_alarm_name" {
  description = "The name of the CloudWatch alarm for high CPU, if created."
  value       = var.enable_cpu_scaling_policies ? aws_cloudwatch_metric_alarm.cpu_high[0].alarm_name : "CPU scaling not enabled."
}

output "cpu_low_alarm_name" {
  description = "The name of the CloudWatch alarm for low CPU, if created."
  value       = var.enable_cpu_scaling_policies ? aws_cloudwatch_metric_alarm.cpu_low[0].alarm_name : "CPU scaling not enabled."
}
