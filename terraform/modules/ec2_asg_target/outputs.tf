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
