# Terraform Module: EC2 Launch Template

This module creates a versionable EC2 Launch Template on AWS. It is designed to define the configuration for instances that will be launched by an Auto Scaling Group, promoting immutable infrastructure.

Key features include:
* Automatic lookup of the latest Amazon Linux 2023 AMI, or use of a custom AMI.
* **Support for an EC2 Key Pair to enable secure SSH access.**
* **Ability to associate a public IP address to make instances reachable from the internet.**
* Conditional creation of an IAM Role and Instance Profile for AWS Systems Manager (SSM), if needed.
* Configuration of network interfaces, block devices (with encryption by default), and detailed monitoring.

## Usage

```hcl
module "ec2_launch_template" {
  source = "./modules/ec2_launch_template"

  terraform_project_name      = "my-app"
  ec2_template_prefix         = "my-app-dev"
  key_name                    = "my-app-dev-key"
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")
  vpc_security_group_ids      = ["sg-0123456789abcdef0"]
  enable_detailed_monitoring  = true

  tags = {
    Application = "backend-api"
  }
}
```

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 1.0  |
| aws       | ~> 6.0  |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | ~> 6.0  |

## Inputs

| Name                          | Description                                                                                                                              | Type           | Default      | Required |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| `ec2_template_prefix`         | A unique prefix for the EC2 Launch Template and related resources.                                                                       | `string`       | n/a          |   yes    |
| `terraform_project_name`      | The name of the Terraform project to be used as a common tag.                                                                            | `string`       | n/a          |   yes    |
| `key_name`                    | The name of the EC2 Key Pair to associate with instances for SSH access.                                                                 | `string`       | `null`       |    no    |
| `image_id`                    | The ID of the AMI to use. If blank, defaults to the latest Amazon Linux 2023 AMI.                                                          | `string`       | `""`         |    no    |
| `instance_type`               | The instance type to use (e.g., t3.micro).                                                                                               | `string`       | `"t3.micro"` |    no    |
| `create_ssm_instance_profile` | If true, the module creates an IAM role and instance profile for SSM Session Manager.                                                      | `bool`         | `false`      |    no    |
| `iam_instance_profile_arn`    | The ARN of an existing IAM instance profile. Ignored if `create_ssm_instance_profile` is true.                                             | `string`       | `""`         |    no    |
| `vpc_security_group_ids`      | A list of security group IDs to associate with the instances. **SECURITY NOTE:** Ensure these groups follow the principle of least privilege. | `list(string)` | `[]`         |    no    |
| `user_data`                   | User data to provide at launch. **SECURITY NOTE:** Avoid including secrets. Use SSM Parameter Store or Secrets Manager.                    | `string`       | `""`         |    no    |
| `associate_public_ip_address` | Whether to associate a public IP address. **Required for direct SSH access from the internet.** | `bool`         | `false`      |    no    |
| `enable_detailed_monitoring`  | Enable detailed (1-minute) CloudWatch monitoring.                                                                                        | `bool`         | `false`      |    no    |
| `root_volume_size`            | The size of the root EBS volume in GiB.                                                                                                  | `number`       | `30`         |    no    |
| `root_volume_type`            | The type of the root EBS volume.                                                                                                         | `string`       | `"gp3"`      |    no    |
| `tags`                        | A map of additional tags to assign to resources.                                                                                         | `map(string)`  | `{}`         |    no    |

## Outputs

| Name                           | Description                                                              |
| ------------------------------ | ------------------------------------------------------------------------ |
| `launch_template_id`           | The ID of the created EC2 Launch Template.                               |
| `launch_template_arn`          | The ARN of the created EC2 Launch Template.                              |
| `launch_template_latest_version` | The latest version number of the EC2 Launch Template.                    |
| `used_ami_id`                  | The AMI ID actually used for the EC2 Launch Template.                      |
| `ssm_iam_role_arn`             | The ARN of the created IAM role for SSM, if created.                     |
| `ssm_instance_profile_arn`     | The ARN of the created IAM instance profile for SSM, if created.         |
