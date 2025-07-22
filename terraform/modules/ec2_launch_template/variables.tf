# variables.tf
# Defines input variables for the launch template module.
variable "ec2_template_prefix" {
  description = "A unique prefix for the EC2 Launch Template and related resources (e.g., key name, SSM parameters)."
  type        = string
}

variable "terraform_project_name" {
  description = "The name of the Terraform project to be used as a common tag for all resources created by this module."
  type        = string
}

variable "image_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instances. If blank, the module will auto-provision the latest Amazon Linux 2023 AMI."
  type        = string
  default     = "" # Default to empty string to enable conditional logic
}

variable "instance_type" {
  description = "The instance type to use for the instances (e.g., t2.micro, m5.large)."
  type        = string
  default     = "t3.micro"
}

variable "create_ssm_instance_profile" {
  description = "If true, the module will create an IAM role and instance profile with permissions for SSM Session Manager. This cannot be true if 'iam_instance_profile_arn' is also set."
  type        = bool
  default     = false
}

variable "iam_instance_profile_arn" {
  description = "The ARN of an existing IAM instance profile to associate with the instance. This is ignored if 'create_ssm_instance_profile' is true."
  type        = string
  default     = ""

  validation {
    condition     = !(var.create_ssm_instance_profile && var.iam_instance_profile_arn != "")
    error_message = "Cannot set 'iam_instance_profile_arn' when 'create_ssm_instance_profile' is true, as the module will create its own profile."
  }
}

variable "vpc_security_group_ids" {
  description = <<EOT
A list of security group IDs to associate with the instances.
SECURITY NOTE: Ensure these security groups adhere to the principle of least privilege.
Open security groups are a common attack vector. Restrict inbound rules to specific ports and source IPs/SGs.
EOT
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = <<EOT
User data to provide when launching the instances. This data is passed to the instance at launch time and can be used for bootstrapping. It will be base64 encoded.
SECURITY NOTE: Avoid including sensitive information directly in user_data.
Consider using AWS Systems Manager (SSM Agent) to pull sensitive data from
SSM Parameter Store (SecureString) or Secrets Manager for production environments.
EOT
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance's primary network interface. Defaults to false for security."
  type        = bool
  default     = false # Secure default
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed CloudWatch monitoring (1-minute data) for the instance. Standard monitoring is free, detailed costs extra."
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "The size of the root EBS volume in GiB."
  type        = number
  default     = 30 # Default to 30 GiB
}

variable "root_volume_type" {
  description = "The type of the root EBS volume (e.g., gp2, gp3)."
  type        = string
  default     = "gp3" # Default to gp3 for better performance/cost
}

variable "tags" {
  description = "A map of additional tags to assign to the launch template and resources launched from it. These will be merged with the common 'TerraformProject' tag."
  type        = map(string)
  default     = {}
}
