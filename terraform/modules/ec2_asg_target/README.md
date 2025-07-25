# Terraform Module: EC2 Auto Scaling Group Target

This module creates the necessary AWS resources to run a scalable web application behind an Application Load Balancer (ALB). It links an ALB Target Group with an Auto Scaling Group (ASG) of EC2 instances.

Key features include:
* An ALB Target Group with configurable health checks.
* A dedicated Security Group for the EC2 instances that allows traffic from the ALB and **SSH traffic from specified IPs**.
* An Auto Scaling Group that uses a specified EC2 Launch Template to launch instances across multiple subnets.
* Optional, configurable CPU-based step scaling policies and CloudWatch alarms to automatically scale the number of instances based on load.
* Optional creation of an ALB Listener Rule to route traffic to the target group based on conditions like host headers or path patterns.

## Usage

```hcl
module "ec2_asg_target" {
  source = "./modules/ec2_asg_target"

  app_name                     = "my-api"
  target_environment           = "dev"
  vpc_id                       = "vpc-0123456789abcdef0"
  subnet_ids                   = ["subnet-0123...", "subnet-4567..."] # Public subnets
  alb_source_security_group_id = "sg-0fedcba9876543210"
  launch_template_id           = "lt-0abcdef1234567890"
  ssh_ingress_cidr_blocks      = ["YOUR_IP/32"]

  desired_capacity = 2
  min_size         = 1
  max_size         = 10

  # Optionally enable auto scaling
  enable_cpu_scaling_policies = true
  
  tags = {
    Service = "user-api"
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

| Name                             | Description                                                                                                                      | Type           | Default       | Required |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------- | :------: |
| `app_name`                       | A unique name for the web application (e.g., 'my-webapp').                                                                       | `string`       | n/a           |   yes    |
| `target_environment`             | The target environment (e.g., 'dev', 'test', 'prod').                                                                            | `string`       | n/a           |   yes    |
| `vpc_id`                         | The ID of the VPC where resources will be deployed.                                                                              | `string`       | n/a           |   yes    |
| `subnet_ids`                     | A list of subnet IDs for the ASG. For direct SSH access, these should be **public** subnets.                                       | `list(string)` | n/a           |   yes    |
| `ssh_ingress_cidr_blocks`        | A list of CIDR blocks to allow SSH (port 22) ingress from. **SECURITY NOTE:** Restrict this to your IP.                            | `list(string)` | `[]`          |   yes    |
| `alb_source_security_group_id`   | The ID of the ALB's security group to allow traffic from.                                                                        | `string`       | n/a           |   yes    |
| `launch_template_id`             | The ID of the EC2 Launch Template to use for the ASG.                                                                            | `string`       | n/a           |   yes    |
| `launch_template_version`        | The version of the Launch Template to use.                                                                                       | `string`       | `"$Latest"`   |    no    |
| `desired_capacity`               | The desired number of instances in the ASG.                                                                                      | `number`       | `1`           |    no    |
| `min_size`                       | The minimum number of instances in the ASG.                                                                                      | `number`       | `1`           |    no    |
| `max_size`                       | The maximum number of instances in the ASG.                                                                                      | `number`       | `2`           |    no    |
| `target_group_port`              | The port on which instances receive traffic.                                                                                     | `number`       | `80`          |    no    |
| `health_check_path`              | The path for the health check request.                                                                                           | `string`       | `"/"`         |    no    |
| `enable_cpu_scaling_policies`    | Set to true to create CPU-based step scaling policies.                                                                           | `bool`         | `false`       |    no    |
| `tags`                           | A map of tags to assign to all resources.                                                                                        | `map(string)`  | `{}`          |    no    |

## Outputs

| Name                         | Description                                                        |
| ---------------------------- | ------------------------------------------------------------------ |
| `target_group_arn`           | The ARN of the created ALB Target Group.                           |
| `autoscaling_group_name`     | The name of the created Auto Scaling Group.                        |
| `ec2_target_security_group_id` | The ID of the security group created for the EC2 instances.        |
| `listener_rule_arn`          | The ARN of the created ALB Listener Rule, if created.              |
| `scale_up_policy_arn`        | The ARN of the scale-up Auto Scaling policy, if created.           |
| `scale_down_policy_arn`      | The ARN of the scale-down Auto Scaling policy, if created.         |
