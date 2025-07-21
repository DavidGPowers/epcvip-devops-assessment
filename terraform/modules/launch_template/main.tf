# versions.tf
# Defines the required Terraform and AWS provider versions.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Specify a compatible AWS provider version
    }
  }
  required_version = ">= 1.0" # Specify a compatible Terraform version
}

# main.tf
# Defines the AWS EC2 Launch Template resource.
resource "aws_launch_template" "main" {
  # A unique name prefix for the launch template, derived from ec2_template_prefix.
  # This helps in creating distinct names for different versions.
  name_prefix = var.ec2_template_prefix

  # The ID of the Amazon Machine Image (AMI) to use for the instances.
  # This is dynamically determined based on input variable or auto-provisioned.
  image_id = local.ami_id_for_launch_template

  # The instance type to use for the instances (e.g., "t2.micro", "m5.large").
  instance_type = var.instance_type

  # The name of the key pair to use for SSH access to the instances.
  # If key_name_suffix is provided, it uses the name of the newly created key pair.
  # Otherwise, it sets the key_name to null, meaning no key pair will be used.
  key_name = var.key_name_suffix != "" ? aws_key_pair.generated_key_pair[0].key_name : null

  # User data to provide when launching the instances.
  # This data is passed to the instance at launch time and can be used for bootstrapping.
  # It must be base64 encoded.
  # SECURITY NOTE: Avoid including sensitive information directly in user_data.
  # Consider using AWS Systems Manager (SSM Agent) to pull sensitive data from
  # SSM Parameter Store (SecureString) or Secrets Manager for production environments.
  user_data = var.user_data == "" ? null : base64encode(var.user_data)

  # Configuration for block device mappings (e.g., EBS volumes).
  # This example sets up a root volume with specified size and type.
  block_device_mappings {
    device_name = "/dev/sda1" # Standard device name for the root volume
    ebs {
      volume_size           = var.root_volume_size # Size of the root volume in GiB
      volume_type           = var.root_volume_type # Type of the root volume (e.g., "gp2", "gp3")
      delete_on_termination = true                 # Delete the volume when the instance is terminated
      encrypted             = true                 # Encrypt the EBS volume
    }
  }

  # Define network interface settings, including security groups and public IP association.
  network_interfaces {
    # A list of security group IDs to associate with the instance's primary network interface.
    # SECURITY NOTE: Ensure these security groups adhere to the principle of least privilege.
    # Open security groups are a common attack vector.
    security_groups = var.vpc_security_group_ids
    # Whether to associate a public IP address with the instance.
    associate_public_ip_address = var.associate_public_ip_address
    # Delete the network interface when the instance is terminated.
    delete_on_termination = true
  }

  # Optional: Attach an IAM instance profile to the EC2 instance.
  # This grants the instance permissions to interact with other AWS services.
  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile_arn != "" ? [1] : []
    content {
      arn = var.iam_instance_profile_arn
    }
  }

  # Optional: Enable detailed CloudWatch monitoring for the instance.
  # Detailed monitoring provides 1-minute data, which is crucial for operational visibility.
  monitoring {
    enabled = var.enable_detailed_monitoring
  }

  # Tag specifications for resources created from this launch template.
  # This allows tagging the instances, volumes, and network interfaces.
  tag_specifications {
    resource_type = "instance" # Apply tags to the EC2 instance
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-instance" # Example: Add a Name tag to instances
    })
  }

  tag_specifications {
    resource_type = "volume" # Apply tags to the EBS volume
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-volume" # Example: Add a Name tag to volumes
    })
  }

  tag_specifications {
    resource_type = "network-interface" # Apply tags to the network interface
    tags = merge(local.common_tags, {
      "Name" = "${var.ec2_template_prefix}-eni" # Example: Add a Name tag to network interfaces
    })
  }

  # Optional: Set the latest version of the launch template as the default.
  # This is useful when you update the launch template and want the new version to be used automatically.
  update_default_version = true

  # Enforce IMDSv2 for enhanced security.
  # http_tokens must be "required" for IMDSv2.
  # http_endpoint must be "enabled" for metadata service to be available.
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  # Tags for the launch template itself.
  tags = local.common_tags
}

# Resource for conditionally creating an EC2 Key Pair.
resource "aws_key_pair" "generated_key_pair" {
  # Create the key pair only if key_name_suffix is provided.
  count = var.key_name_suffix != "" ? 1 : 0

  # The name of the key pair, combining the template prefix and the provided suffix.
  key_name = "${var.ec2_template_prefix}-${var.key_name_suffix}"
  # The public key material for the key pair.
  public_key = var.public_key_material

  # Tags for the key pair.
  tags = local.common_tags
}

# Data source to retrieve the latest Amazon Linux 2023 AMI ID from AWS public SSM Parameter Store.
data "aws_ssm_parameter" "amazon_linux_2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Local values to determine the final AMI ID and common tags.
locals {
  # Determine the AMI ID to use for the launch template.
  # Precedence:
  # 1. User-provided `var.image_id` (if not empty).
  # 2. Latest Amazon Linux 2023 AMI (if `var.image_id` is empty).
  ami_id_for_launch_template = var.image_id != "" ? var.image_id : data.aws_ssm_parameter.amazon_linux_2023_ami.value

  # Define common tags by merging user-provided tags with the TerraformProject tag.
  common_tags = merge(var.tags, {
    "TerraformProject" = var.terraform_project_name
  })
}

# Resource for storing the AMI ID used by the launch template in SSM Parameter Store.
# This parameter will always reflect the AMI ID actually used, whether provided explicitly
# or auto-provisioned.
resource "aws_ssm_parameter" "project_ami_id" {
  name        = "/ec2/launch-templates/${var.ec2_template_prefix}/ami_id"
  type        = "String"
  value       = local.ami_id_for_launch_template # Always store the resolved AMI ID
  description = "AMI ID used for EC2 Launch Template ${var.ec2_template_prefix}"
  tags        = local.common_tags
}

# Resource for storing the Launch Template ID in SSM Parameter Store.
resource "aws_ssm_parameter" "launch_template_id" {
  name        = "/ec2/launch-templates/${var.ec2_template_prefix}/id"
  type        = "String"
  value       = aws_launch_template.main.id
  description = "ID of the EC2 Launch Template for ${var.ec2_template_prefix}"
  tags        = local.common_tags
}

# Resource for storing the Launch Template ARN in SSM Parameter Store.
resource "aws_ssm_parameter" "launch_template_arn" {
  name        = "/ec2/launch-templates/${var.ec2_template_prefix}/arn"
  type        = "String"
  value       = aws_launch_template.main.arn
  description = "ARN of the EC2 Launch Template for ${var.ec2_template_prefix}"
  tags        = local.common_tags
}

# Resource for storing the Launch Template Latest Version in SSM Parameter Store.
resource "aws_ssm_parameter" "launch_template_latest_version" {
  name        = "/ec2/launch-templates/${var.ec2_template_prefix}/latest_version"
  type        = "String"
  value       = aws_launch_template.main.latest_version
  description = "Latest version of the EC2 Launch Template for ${var.ec2_template_prefix}"
  tags        = local.common_tags
}

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
}

variable "key_name_suffix" {
  description = "An optional suffix for the EC2 Key Pair name. If provided, a new key pair will be created with the name '${ec2_template_prefix}-${key_name_suffix}'. If empty, no key pair will be created or associated with the launch template."
  type        = string
  default     = ""
}

variable "public_key_material" {
  description = <<EOT
The public key material for the EC2 Key Pair. Required if 'key_name_suffix' is provided.
SECURITY NOTE: Directly embedding sensitive data like public key material in version control
is generally discouraged. Consider retrieving this from a secure secrets manager (e.g., AWS Secrets Manager)
or ensuring it's handled securely in your CI/CD pipeline.
EOT
  type        = string
  default     = ""

  # Validation to ensure public_key_material is provided if key_name_suffix is not empty.
  validation {
    condition     = var.key_name_suffix == "" || var.public_key_material != ""
    error_message = "public_key_material must be provided if key_name_suffix is not empty."
  }
}

variable "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile to associate with the instance. Set to empty string if no profile is desired."
  type        = string
  default     = ""
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

# outputs.tf
# Defines output values from the launch template module.
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

output "generated_key_pair_name" {
  description = "The name of the generated EC2 Key Pair, if created."
  value       = var.key_name_suffix != "" ? aws_key_pair.generated_key_pair[0].key_name : "No key pair generated"
}

output "used_ami_id" {
  description = "The AMI ID actually used for the EC2 Launch Template."
  value       = local.ami_id_for_launch_template
}
