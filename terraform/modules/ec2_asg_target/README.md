# AWS Web Application Service Module

This Terraform module provisions the necessary AWS resources to deploy a web application service behind an existing Application Load Balancer (ALB), utilizing EC2 instances managed by an Auto Scaling Group (ASG) and an existing EC2 Launch Template.

## Features

* **ALB Target Group:** Creates a dedicated Target Group for your web application, configurable with various health check parameters.

* **Auto Scaling Group (ASG):** Manages the lifecycle of your EC2 instances, ensuring desired capacity and automatically replacing unhealthy instances.

* **Launch Template Integration:** Leverages an existing EC2 Launch Template for consistent instance configuration (AMI, instance type, security groups, user data, etc.).

* **Automatic Target Registration:** Instances launched by the ASG are automatically registered with the created Target Group.

* **Configurable Scaling:** Define minimum, maximum, and desired capacity for your application.

* **Comprehensive Tagging:** Supports consistent tagging for all created resources.

## Usage

To use this module, ensure you have an existing ALB (or use the ALB module provided previously) and an EC2 Launch Template.

```terraform
# Example usage in your root module or another calling module

# Assuming you have an existing ALB or are creating one with a separate module
# data "aws_lb" "existing_alb" {
#   name = "my-application-dev" # Replace with your ALB name
# }

# Or if using the previous ALB module:
# module "shared_alb" {
#   source = "./modules/alb"
#   # ... ALB module inputs ...
# }


# Example: Data source to retrieve an existing Launch Template
data "aws_launch_template" "my_app_launch_template" {
  name = "my-web-app-template-dev" # Replace with your Launch Template name
  # Or use id if you have it directly:
  # id = "lt-0abcdef1234567890"
}


module "web_app_service" {
  source = "./modules/web-app-service" # Adjust the path to this module

  app_name           = "my-web-app"
  target_environment = "dev"
  vpc_id             = "vpc-0123456789abcdef0" # Replace with your VPC ID
  subnet_ids         = ["subnet-0abcdef1234567890", "subnet-0fedcba9876543210"] # Replace with private subnet IDs

  # Link to your existing ALB
  alb_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/my-application-dev/abcdef1234567890" # Replace with your ALB ARN
  # Or if using the module output:
  # alb_arn = module.shared_alb.alb_arn

  # Target Group configuration
  target_group_port     = 80
  target_group_protocol = "HTTP"
  health_check_path     = "/health"
  health_check_matcher  = "200"

  # Auto Scaling Group configuration
  launch_template_id      = data.aws_launch_template.my_app_launch_template.id
  launch_template_version = data.aws_launch_template.my_app_launch_template.latest_version
  desired_capacity        = 2
  min_size                = 1
  max_size                = 3

  tags = {
    Project     = "WebAppDeployment"
    Environment = "Development"
    Service     = "WebApp"
  }
}

output "web_app_target_group_arn" {
  description = "The ARN of the web application's ALB Target Group."
  value       = module.web_app_service.target_group_arn
}

output "web_app_autoscaling_group_name" {
  description = "The name of the web application's Auto Scaling Group."
  value       = module.web_app_service.autoscaling_group_name
}
````

## Inputs

| Name | Description | Type | Default | Required |
| :---------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------- | :------------- | :------- |
| `app_name` | A unique name for the web application (e.g., 'my-webapp'). Used for naming resources. | `string` | n/a | yes |
| `target_environment` | The target environment (e.g., 'dev', 'test', 'prod') to append to resource names and for tagging. | `string` | n/a | yes |
| `vpc_id` | The ID of the VPC where the target group and ASG instances will be deployed. | `string` | n/a | yes |
| `subnet_ids` | A list of subnet IDs where the Auto Scaling Group instances will be launched. These should be private subnets. | `list(string)` | n/a | yes |
| `alb_arn` | The ARN of the existing Application Load Balancer to which this target group will be associated. | `string` | n/a | yes |
| `target_group_port` | The port on which the EC2 instances in the target group will receive traffic from the ALB. | `number` | `80` | no |
| `target_group_protocol` | The protocol for the target group (e.g., HTTP, HTTPS, TCP, TLS, UDP, TCP\_UDP, GENEVE). | `string` | `"HTTP"` | no |
| `health_check_path` | The destination for the health check request. For HTTP/HTTPS, this is a URL path. For TCP/SSL, it's ignored. | `string` | `"/"` | no |
| `health_check_port` | The port the load balancer uses when performing health checks on the targets. Default is traffic-port. | `string` | `"traffic-port"` | no |
| `health_check_protocol` | The protocol the load balancer uses when performing health checks. Default is the target group protocol. | `string` | `"HTTP"` | no |
| `health_check_interval` | The approximate amount of time, in seconds, between health checks of an individual target. Between 5 and 300 seconds. | `number` | `30` | no |
| `health_check_timeout` | The amount of time, in seconds, during which no response from a target means a failed health check. Between 2 and 120 seconds. | `number` | `5` | no |
| `healthy_threshold` | The number of consecutive health checks successes required before considering an unhealthy target healthy. Between 2 and 10. | `number` | `3` | no |
| `unhealthy_threshold` | The number of consecutive health check failures required before considering a target unhealthy. Between 2 and 10. | `number` | `3` | no |
| `health_check_matcher` | The HTTP codes to use when checking for a successful response from a target. For HTTP/HTTPS protocol only. You can specify a range of values (e.g., '200-299') or a comma-separated list of values (e.g., '200,202'). | `string` | `"200"` | no |
| `launch_template_id` | The ID of the EC2 Launch Template to use for the Auto Scaling Group instances. | `string` | n/a | yes |
| `launch_template_version` | The version of the Launch Template to use (e.g., '$Latest', '$Default', or a specific version number). | `string` | `"$Latest"` | no |
| `desired_capacity` | The desired number of EC2 instances in the Auto Scaling Group. | `number` | `1` | no |
| `min_size` | The minimum number of EC2 instances in the Auto Scaling Group. | `number` | `1` | no |
| `max_size` | The maximum number of EC2 instances in the Auto Scaling Group. | `number` | `2` | no |
| `tags` | A map of tags to assign to all resources created by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| :--------------------------- | :----------------------------------------------------- |
| `target_group_arn` | The ARN of the created ALB Target Group. |
| `target_group_name` | The name of the created ALB Target Group. |
| `autoscaling_group_name` | The name of the created Auto Scaling Group. |
| `autoscaling_group_arn` | The ARN of the created Auto Scaling Group. |

## Requirements

| Name | Version |
| :---------- | :------- |
| `terraform` | `>= 1.0` |
| `aws` | `~> 6.0` |

## Resources

| Name | Type |
| :---------------------------------- | :--------- |
| `aws_lb_target_group.app_target_group` | resource |
| `aws_autoscaling_group.app_asg` | resource |
| `aws_launch_template.my_app_launch_template` | data source |

