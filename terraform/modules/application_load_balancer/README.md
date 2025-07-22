# Terraform Module: Application Load Balancer (ALB)

This module deploys a highly configurable Application Load Balancer (ALB) on AWS. It is designed to be a shared, central entry point for web traffic, capable of serving multiple applications via listener rules.

Key features include:
* Creation of an internet-facing or internal ALB.
* Configurable HTTP and HTTPS listeners with default fixed-response actions.
* A dedicated, customizable security group for the ALB.
* Production-grade access logging to a dedicated S3 bucket, with support for versioning, encryption, and lifecycle policies.
* Systematic storage of key resource identifiers (ARNs, IDs) in AWS SSM Parameter Store for easy discovery by other services.

## Usage

```hcl
module "shared_alb" {
  source = "./modules/application_load_balancer"

  alb_name             = "shared-webapp"
  target_environment   = "dev"
  vpc_id               = "vpc-0123456789abcdef0"
  subnet_ids           = ["subnet-0123...", "subnet-4567..."]
  internal_alb         = false

  http_enabled         = true
  http_ingress_cidrs   = ["0.0.0.0/0"]

  https_enabled        = true
  https_tls_cert_arn   = "arn:aws:acm:us-east-2:123456789012:certificate/..."
  https_ingress_cidrs  = ["0.0.0.0/0"]

  enable_access_logs   = true
  access_logs_s3_bucket_name = "my-project-alb-logs-dev"
  access_logs_s3_bucket_lifecycle_enabled = true
  access_logs_s3_bucket_expiration_days   = 90

  tags = {
    CostCenter = "web-infra"
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

| Name                                    | Description                                                                                             | Type          | Default      | Required |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------- | ------------ | :------: |
| `alb_name`                              | A unique name for the Application Load Balancer.                                                        | `string`      | n/a          |   yes    |
| `target_environment`                    | The target environment (e.g., dev, uat, prd) to append to resource names.                               | `string`      | n/a          |   yes    |
| `internal_alb`                          | Set to true to create an internal-facing ALB, false for internet-facing.                                | `bool`        | `true`       |    no    |
| `vpc_id`                                | The ID of the VPC where the ALB will be deployed.                                                       | `string`      | n/a          |   yes    |
| `subnet_ids`                            | A list of subnet IDs where the ALB will be deployed. At least two are recommended.                      | `list(string)`| n/a          |   yes    |
| `http_enabled`                          | Set to true to enable an HTTP listener.                                                                 | `bool`        | `true`       |    no    |
| `http_port`                             | The port for the HTTP listener.                                                                         | `number`      | `80`         |    no    |
| `http_ingress_cidrs`                    | A list of CIDR blocks to allow HTTP ingress from.                                                       | `list(string)`| `[]`         |    no    |
| `https_enabled`                         | Set to true to enable an HTTPS listener.                                                                | `bool`        | `true`       |    no    |
| `https_port`                            | The port for the HTTPS listener.                                                                        | `number`      | `443`        |    no    |
| `https_ingress_cidrs`                   | A list of CIDR blocks to allow HTTPS ingress from.                                                      | `list(string)`| `[]`         |    no    |
| `https_tls_cert_arn`                    | The ARN of the ACM certificate for the HTTPS listener. Required if `https_enabled` is true.             | `string`      | `null`       |    no    |
| `enable_access_logs`                    | Set to true to enable ALB access logging to an S3 bucket.                                               | `bool`        | `false`      |    no    |
| `access_logs_s3_bucket_name`            | The name of the S3 bucket for logs. Required if `enable_access_logs` is true.                           | `string`      | `null`       |    no    |
| `access_logs_s3_prefix`                 | The S3 bucket prefix for ALB access logs.                                                               | `string`      | `"alb-logs"` |    no    |
| `access_logs_s3_bucket_versioning_enabled` | Set to true to enable versioning on the S3 bucket for logs.                                           | `bool`        | `false`      |    no    |
| `access_logs_s3_bucket_lifecycle_enabled`  | Set to true to enable lifecycle rules on the S3 bucket for logs.                                      | `bool`        | `false`      |    no    |
| `access_logs_s3_bucket_transition_days` | Number of days to transition logs to STANDARD_IA storage.                                               | `number`      | `null`       |    no    |
| `access_logs_s3_bucket_expiration_days` | Number of days after which to expire (delete) logs.                                                     | `number`      | `null`       |    no    |
| `tags`                                  | A map of tags to assign to all resources created by this module.                                        | `map(string)` | `{}`         |    no    |

## Outputs

| Name                            | Description                                                        |
| ------------------------------- | ------------------------------------------------------------------ |
| `alb_arn`                       | The ARN of the created Application Load Balancer.                  |
| `alb_dns_name`                  | The DNS name of the created Application Load Balancer.             |
| `alb_zone_id`                   | The Route 53 Hosted Zone ID of the created ALB.                    |
| `alb_listener_http_arn`         | The ARN of the HTTP listener, if enabled.                          |
| `alb_listener_https_arn`        | The ARN of the HTTPS listener, if enabled.                         |
| `alb_security_group_id`         | The ID of the security group attached to the ALB.                  |
| `alb_access_logs_s3_bucket_arn` | The ARN of the S3 bucket for ALB access logs, if enabled.          |
