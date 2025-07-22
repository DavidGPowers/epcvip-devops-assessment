output "launch_template_id" {
  description = "The ID of the created EC2 Launch Template."
  value       = aws_launch_template.main.id
}

output "launch_template_arn" {
  description = "The ARN of the created EC2 Launch Template."
  value       = aws_launch_template.main.arn
}

output "launch_template_latest_version" {
  description = "The latest version number of the EC2 Launch Template."
  value       = aws_launch_template.main.latest_version
}

output "used_ami_id" {
  description = "The AMI ID actually used for the EC2 Launch Template."
  value       = local.ami_id_for_launch_template
}

output "ssm_iam_role_arn" {
  description = "The ARN of the created IAM role for SSM, if created."
  value       = var.create_ssm_instance_profile ? aws_iam_role.ssm_role[0].arn : "Not created."
}

output "ssm_instance_profile_arn" {
  description = "The ARN of the created IAM instance profile for SSM, if created."
  value       = var.create_ssm_instance_profile ? aws_iam_instance_profile.ssm_instance_profile[0].arn : "Not created."
}
