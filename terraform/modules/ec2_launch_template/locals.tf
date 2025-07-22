locals {
  # Determines the AMI ID to use. Prefers the user-provided 'image_id', otherwise falls back to the latest Amazon Linux 2023 AMI.
  ami_id_for_launch_template = var.image_id != "" ? var.image_id : data.aws_ssm_parameter.amazon_linux_2023_ami.value

  # Determines which IAM instance profile ARN to use for the launch template.
  # If 'create_ssm_instance_profile' is true, it uses the ARN of the module-created profile.
  # Otherwise, it uses the ARN provided in 'iam_instance_profile_arn'.
  # Validation rules in variables.tf prevent both from being configured simultaneously.
  instance_profile_arn_to_use = var.create_ssm_instance_profile ? aws_iam_instance_profile.ssm_instance_profile[0].arn : var.iam_instance_profile_arn

  # Merges user-provided tags with a common project tag for consistent tagging across all resources.
  common_tags = merge(var.tags, {
    "TerraformProject" = var.terraform_project_name
  })
}
