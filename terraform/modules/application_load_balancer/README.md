# AWS Application Load Balancer (ALB) Module

This Terraform module creates and configures an AWS Application Load Balancer (ALB) with optional HTTP/HTTPS listeners, security group rules, and access logging to S3. It provides a flexible way to deploy shared ALBs for different environments within your AWS infrastructure.

## Features

* **Configurable ALB Type:** Create internal or internet-facing ALBs.

* **Flexible Listener Setup:** Enable HTTP and/or HTTPS listeners with customizable ports and default fixed responses.

* **Security Group Management:** Automatically creates a security group for the ALB with configurable ingress rules (CIDRs and Security Group IDs) for both HTTP and HTTPS, and flexible egress rules.

* **Access Logging:** Optionally enable ALB access logs to a dedicated S3 bucket, with support for:

  * S3 Bucket Versioning

  * Server-Side Encryption (SSE-256)

  * Lifecycle rules (transition to `STANDARD_IA` and expiration)

* **SSM Parameter Store Integration:** Exports ALB ARN, DNS name, Zone ID, listener ARNs, and security group ID to AWS Systems Manager Parameter Store for easy discovery by other services or modules.

* **Tagging:** Supports comprehensive tagging for all created resources.

## Usage

To use this module, define it in your Terraform configuration and provide the required input variables.

```terraform
module "shared_alb" {
  source = "./modules/alb" # Adjust the path to your module

  alb_name         = "my-application"
  target_environment = "dev"
  vpc_id           = "vpc-0123456789abcdef0"
  subnet_ids       = ["subnet-0abcdef1234567890", "subnet-0fedcba9876543210"]
  internal_alb     = true # Set to false for an internet-facing ALB

  # HTTP Listener (optional)
  http_enabled       = true
  http_port          = 80
  http_ingress_cidrs = ["10.0.0.0/16"] # Allow HTTP from within a specific CIDR

  # HTTPS Listener (optional)
  https_enabled       = true
  https_port          = 443
  https_tls_cert_arn  = "arn:aws:acm:us-east-1:123456789012:certificate/abcdefgh-1234-5678-90ab-cdef12345678"
  https_ingress_cidrs = ["0.0.0.0/0"] # Allow HTTPS from anywhere (be cautious in production)

  # ALB Access Logging (optional)
  enable_access_logs                   = true
  access_logs_s3_bucket_name           = "my-app-alb-access-logs-dev"
  access_logs_s3_prefix                = "app-alb"
  access_logs_s3_bucket_versioning_enabled = true
  access_logs_s3_bucket_lifecycle_enabled = true
  access_logs_s3_bucket_transition_days = 30 # Transition logs to IA after 30 days
  access_logs_s3_bucket_expiration_days = 90 # Delete logs after 90 days

  tags = {
    Project     = "MyApplication"
    Environment = "Development"
  }
}

output "alb_dns_name" {
  value = module.shared_alb.alb_dns_name
}

output "alb_security_group_id" {
  value = module.shared_alb.alb_security_group_id
}
```

## Inputs

| Name | Description | Type | Default | Required |
| :---------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------ | :---------------------- | :------- |
| `alb_name` | A unique name for the Application Load Balancer. | `string` | n/a | yes |
| `target_environment` | The target environment (e.g., dev, test, prod) to append to resource names. | `string` | n/a | yes |
| `internal_alb` | Set to `true` to create an internal-facing ALB, `false` for internet-facing. | `bool` | `true` | no |
| `vpc_id` | The ID of the VPC where the ALB will be deployed. | `string` | n/a | yes |
| `subnet_ids` | A list of subnet IDs where the ALB will be deployed. At least two subnets in different AZs are recommended. | `list(string)` | n/a | yes |
| `http_enabled` | Set to `true` to enable an HTTP listener on the specified port with a fixed-response default action. | `bool` | `true` | no |
| `http_port` | The port for the HTTP listener. | `number` | `80` | no |
| `http_ingress_cidrs` | A list of CIDR blocks to allow HTTP ingress from. | `list(string)` | `[]` | no |
| `http_ingress_sg_ids` | A list of Security Group IDs to allow HTTP ingress from. | `list(string)` | `[]` | no |
| `http_egress_cidrs` | A list of CIDR blocks to allow HTTP egress to. These are *additional* to the default egress. | `list(string)` | `[]` | no |
| `http_egress_sg_ids` | A list of Security Group IDs to allow HTTP egress to. These are *additional* to the default egress. | `list(string)` | `[]` | no |
| `https_enabled` | Set to `true` to enable an HTTPS listener on the specified port with a fixed-response default action. | `bool` | `true` | no |
| `https_port` | The port for the HTTPS listener. | `number` | `443` | no |
| `https_ingress_cidrs` | A list of CIDR blocks to allow HTTPS ingress from. | `list(string)` | `[]` | no |
| `https_ingress_sg_ids` | A list of Security Group IDs to allow HTTPS ingress from. | `list(string)` | `[]` | no |
| `https_tls_cert_arn` | The ARN of the ACM certificate for the HTTPS listener. Required if `https_enabled` is `true`. | `string` | `null` | no |
| `https_egress_cidrs` | A list of CIDR blocks to allow HTTPS egress to. These are *additional* to the default egress. | `list(string)` | `[]` | no |
| `https_egress_sg_ids` | A list of Security Group IDs to allow HTTPS egress to. These are *additional* to the default egress. | `list(string)` | `[]` | no |
| `enable_access_logs` | Set to `true` to enable ALB access logging to an S3 bucket. | `bool` | `false` | no |
| `access_logs_s3_bucket_name` | The name of the S3 bucket where ALB access logs will be stored. Required if `enable_access_logs` is `true`. | `string` | `null` | no |
| `access_logs_s3_prefix` | The S3 bucket prefix for ALB access logs. Logs are stored in the root if not configured. | `string` | `"alb-logs"` | no |
| `access_logs_s3_bucket_versioning_enabled` | Set to `true` to enable versioning on the S3 bucket for ALB access logs. | `bool` | `false` | no |
| `access_logs_s3_bucket_lifecycle_enabled` | Set to `true` to enable lifecycle rules on the S3 bucket for ALB access logs. | `bool` | `false` | no |
| `access_logs_s3_bucket_transition_days` | Number of days after which to transition ALB logs to STANDARD_IA storage class. Only applicable if `access_logs_s3_bucket_lifecycle_enabled` is `true`. | `number` | `null` | no |
| `access_logs_s3_bucket_expiration_days` | Number of days after which to expire (delete) ALB logs. Only applicable if `access_logs_s3_bucket_lifecycle_enabled` is `true`. | `number` | `null` | no |
| `tags` | A map of tags to assign to all resources created by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| :---------------------------------- | :---------------------------------------------------------------------------- |
| `alb_arn` | The ARN of the created Application Load Balancer. |
| `alb_dns_name` | The DNS name of the created Application Load Balancer. |
| `alb_zone_id` | The Route 53 Hosted Zone ID of the created Application Load Balancer. |
| `alb_listener_http_arn` | The ARN of the HTTP listener, if enabled. |
| `alb_listener_https_arn` | The ARN of the HTTPS listener, if enabled. |
| `alb_security_group_id` | The ID of the security group attached to the ALB. |
| `alb_access_logs_s3_bucket_arn` | The ARN of the S3 bucket for ALB access logs, if enabled. |

## Requirements

| Name | Version |
| :-------- | :---------- |
| `terraform` | `>= 1.0` |
| `aws` | `~> 6.0` |

## Resources

| Name | Type |
| :-------------------------------------------- | :---------- |
| `aws_lb.shared_alb` | resource |
| `aws_lb_listener.shared_alb_listener_http` | resource |
| `aws_lb_listener.shared_alb_listener_https` | resource |
| `aws_s3_bucket.alb_access_logs_bucket` | resource |
| `aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle` | resource |
| `aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership` | resource |
| `aws_s3_bucket_policy.alb_access_logs_bucket_policy` | resource |
| `aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption` | resource |
| `aws_security_group.alb_sg` | resource |
| `aws_ssm_parameter.alb-access-logs-s3-bucket-arn` | resource |
| `aws_ssm_parameter.alb-arn` | resource |
| `aws_ssm_parameter.alb-dns-name` | resource |
| `aws_ssm_parameter.alb-listener-http-arn` | resource |
| `aws_ssm_parameter.alb-listener-https-arn` | resource |
| `aws_ssm_parameter.alb-security-group-id` | resource |
| `aws_ssm_parameter.alb-zone-id` | resource |
| `aws_caller_identity.current` | data source |
| `aws_elb_service_account.main` | data source |
| `aws_vpc.selected_vpc` | data source |
