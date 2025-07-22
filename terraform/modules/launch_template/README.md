# AWS EC2 Launch Template Module

This Terraform module creates and configures an EC2 Launch Template, which serves as a blueprint for launching EC2 instances. It supports dynamic AMI selection, SSH key pair management, user data for bootstrapping, EBS volume configuration, network interface settings, IAM instance profiles, and detailed monitoring.

## Features

* **Dynamic AMI Selection:** Automatically uses the latest Amazon Linux 2023 AMI or allows a custom AMI ID.

* **Instance Type Configuration:** Specify the desired EC2 instance type.

* **SSH Key Pair Management:** Optionally creates a new EC2 Key Pair or uses an existing one for SSH access.

* **User Data Support:** Provide a base64-encoded user data script for instance bootstrapping.

* **EBS Volume Customization:** Configure root volume size, type, encryption, and deletion behavior.

* **Network Interface Control:** Associate security groups and control public IP assignment.

* **IAM Instance Profile Integration:** Attach an IAM instance profile for granting permissions to EC2 instances.

* **CloudWatch Monitoring:** Enable detailed (1-minute) CloudWatch monitoring.

* **IMDSv2 Enforcement:** Configures instances to enforce IMDSv2 for enhanced security.

* **Tagging:** Apply consistent tags to the launch template, instances, volumes, and network interfaces.

* **SSM Parameter Store Integration:** Exports Launch Template ID, ARN, latest version, and used AMI ID to AWS Systems Manager Parameter Store for easy discovery.

## Usage

To use this module, define it in your Terraform configuration and provide the necessary input variables.

```terraform
module "ec2_launch_template" {
  source = "./modules/ec2-launch-template" # Adjust the path to your module

  ec2_template_prefix    = "my-webapp-instance"
  terraform_project_name = "MyApplication"
  # image_id             = "ami-0abcdef1234567890" # Optional: specify a custom AMI ID
  instance_type          = "t3.medium"
  key_name_suffix        = "dev-ssh-key" # Optional: creates a new key pair
  public_key_material    = "ssh-rsa AAAAB3NzaC..." # Required if key_name_suffix is provided

  # Example: IAM instance profile ARN (replace with your actual ARN)
  iam_instance_profile_arn = "arn:aws:iam::123456789012:instance-profile/my-ec2-instance-profile"

  # Example: Security Group IDs (replace with your actual IDs)
  vpc_security_group_ids = ["sg-0abcdef1234567890", "sg-0fedcba9876543210"]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Hello from EC2 Launch Template!</h1>" > /usr/share/nginx/html/index.html
  EOF

  associate_public_ip_address = false # Set to true if instances need public IPs
  enable_detailed_monitoring  = true
  root_volume_size            = 50
  root_volume_type            = "gp3"

  tags = {
    Environment = "Development"
    Service     = "WebApp"
  }
}

output "launch_template_id" {
  value = module.ec2_launch_template.launch_template_id
}

output "launch_template_latest_version" {
  value = module.ec2_launch_template.launch_template_latest_version
}
````

## Inputs

| Name | Description | Type | Default | Required |
| :---------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------- | :------------- | :------- |
| `ec2_template_prefix` | A unique prefix for the EC2 Launch Template and related resources (e.g., key name, SSM parameters). | `string` | n/a | yes |
| `terraform_project_name` | The name of the Terraform project to be used as a common tag for all resources created by this module. | `string` | n/a | yes |
| `image_id` | The ID of the Amazon Machine Image (AMI) to use for the instances. If blank, the module will auto-provision the latest Amazon Linux 2023 AMI. | `string` | `""` | no |
| `instance_type` | The instance type to use for the instances (e.g., t2.micro, m5.large). | `string` | `"t3.micro"` | no |
| `key_name_suffix` | An optional suffix for the EC2 Key Pair name. If provided, a new key pair will be created with the name '${ec2\_template\_prefix}-${key\_name\_suffix}'. If empty, no key pair will be created or associated with the launch template. | `string` | `""` | no |
| `public_key_material` | The public key material for the EC2 Key Pair. Required if 'key\_name\_suffix' is provided. | `string` | `""` | no |
| `iam_instance_profile_arn` | The ARN of the IAM instance profile to associate with the instance. Set to empty string if no profile is desired. | `string` | `""` | no |
| `vpc_security_group_ids` | A list of security group IDs to associate with the instances. | `list(string)` | `[]` | no |
| `user_data` | User data to provide when launching the instances. This data is passed to the instance at launch time and can be used for bootstrapping. It will be base64 encoded. | `string` | `""` | no |
| `associate_public_ip_address` | Whether to associate a public IP address with the instance's primary network interface. Defaults to false for security. | `bool` | `false` | no |
| `enable_detailed_monitoring` | Enable detailed CloudWatch monitoring (1-minute data) for the instance. Standard monitoring is free, detailed costs extra. | `bool` | `false` | no |
| `root_volume_size` | The size of the root EBS volume in GiB. | `number` | `30` | no |
| `root_volume_type` | The type of the root EBS volume (e.g., gp2, gp3). | `string` | `"gp3"` | no |
| `tags` | A map of additional tags to assign to the launch template and resources launched from it. These will be merged with the common 'TerraformProject' tag. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| :--------------------------- | :----------------------------------------------------- |
| `launch_template_id` | The ID of the created EC2 Launch Template. |
| `launch_template_arn` | The ARN of the created EC2 Launch Template. |
| `launch_template_latest_version` | The latest version number of the EC2 Launch Template. |
| `generated_key_pair_name` | The name of the generated EC2 Key Pair, if created. |
| `used_ami_id` | The AMI ID actually used for the EC2 Launch Template. |

## Requirements

| Name | Version |
| :---------- | :------- |
| `terraform` | `>= 1.0` |
| `aws` | `~> 6.0` |

## Resources

| Name | Type |
| :---------------------------------- | :--------- |
| `aws_ssm_parameter.amazon_linux_2023_ami` | data source |
| `aws_launch_template.main` | resource |
| `aws_key_pair.generated_key_pair` | resource |
| `aws_ssm_parameter.project_ami_id` | resource |
| `aws_ssm_parameter.launch_template_id` | resource |
| `aws_ssm_parameter.launch_template_arn` | resource |
| `aws_ssm_parameter.launch_template_latest_version` | resource |

