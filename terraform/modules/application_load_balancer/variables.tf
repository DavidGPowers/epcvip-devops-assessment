# ALB General Settings
variable "alb_name" {
  description = "A unique name for the Application Load Balancer."
  type        = string
}

variable "target_environment" {
  description = "The target environment (e.g., dev, test, prod) to append to resource names."
  type        = string
}

variable "internal_alb" {
  description = "Set to true to create an internal-facing ALB, false for internet-facing."
  type        = bool
  default     = true
}

# Network Settings
variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the ALB will be deployed. At least two subnets in different AZs are recommended."
  type        = list(string)
  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "At least two subnet IDs must be provided for the ALB for high availability."
  }
}

# HTTP Listener Settings
variable "http_enabled" {
  description = "Set to true to enable an HTTP listener on the specified port with a fixed-response default action."
  type        = bool
  default     = true
}

variable "http_port" {
  description = "The port for the HTTP listener."
  type        = number
  default     = 80
}

variable "http_ingress_cidrs" {
  description = "A list of CIDR blocks to allow HTTP ingress from."
  type        = list(string)
  default     = []
}

variable "http_ingress_sg_ids" {
  description = "A list of Security Group IDs to allow HTTP ingress from."
  type        = list(string)
  default     = []
}

# HTTP Egress Settings (similar to ingress, for specific outbound control)
variable "http_egress_cidrs" {
  description = "A list of CIDR blocks to allow HTTP egress to. These are *additional* to the default egress."
  type        = list(string)
  default     = []
}

variable "http_egress_sg_ids" {
  description = "A list of Security Group IDs to allow HTTP egress to. These are *additional* to the default egress."
  type        = list(string)
  default     = []
}

# HTTPS Listener Settings
variable "https_enabled" {
  description = "Set to true to enable an HTTPS listener on the specified port with a fixed-response default action."
  type        = bool
  default     = true
}

variable "https_port" {
  description = "The port for the HTTPS listener."
  type        = number
  default     = 443
}

variable "https_ingress_cidrs" {
  description = "A list of CIDR blocks to allow HTTPS ingress from."
  type        = list(string)
  default     = []
}

variable "https_ingress_sg_ids" {
  description = "A list of Security Group IDs to allow HTTPS ingress from."
  type        = list(string)
  default     = []
}

variable "https_tls_cert_arn" {
  description = "The ARN of the ACM certificate for the HTTPS listener. Required if https_enabled is true."
  type        = string
  default     = null

  validation {
    condition     = !var.https_enabled || (var.https_enabled && var.https_tls_cert_arn != null && var.https_tls_cert_arn != "")
    error_message = "https_tls_cert_arn must be provided if https_enabled is true."
  }
}

# HTTPS Egress Settings
variable "https_egress_cidrs" {
  description = "A list of CIDR blocks to allow HTTPS egress to. These are *additional* to the default egress."
  type        = list(string)
  default     = []
}

variable "https_egress_sg_ids" {
  description = "A list of Security Group IDs to allow HTTPS egress to. These are *additional* to the default egress."
  type        = list(string)
  default     = []
}

# ALB Access Logging Settings
variable "enable_access_logs" {
  description = "Set to true to enable ALB access logging to an S3 bucket."
  type        = bool
  default     = false
}

variable "access_logs_s3_bucket_name" {
  description = "The name of the S3 bucket where ALB access logs will be stored. Required if enable_access_logs is true."
  type        = string
  default     = null
  validation {
    condition     = !var.enable_access_logs || (var.enable_access_logs && var.access_logs_s3_bucket_name != null && var.access_logs_s3_bucket_name != "")
    error_message = "access_logs_s3_bucket_name must be provided if enable_access_logs is true."
  }
}

variable "access_logs_s3_prefix" {
  description = "The S3 bucket prefix for ALB access logs. Logs are stored in the root if not configured."
  type        = string
  default     = "alb-logs" # A sensible default prefix
}

variable "access_logs_s3_bucket_versioning_enabled" {
  description = "Set to true to enable versioning on the S3 bucket for ALB access logs."
  type        = bool
  default     = false
}

variable "access_logs_s3_bucket_lifecycle_enabled" {
  description = "Set to true to enable lifecycle rules on the S3 bucket for ALB access logs."
  type        = bool
  default     = false
}

variable "access_logs_s3_bucket_transition_days" {
  description = "Number of days after which to transition ALB logs to STANDARD_IA storage class. Only applicable if access_logs_s3_bucket_lifecycle_enabled is true."
  type        = number
  default     = null # No transition by default
}

variable "access_logs_s3_bucket_expiration_days" {
  description = "Number of days after which to expire (delete) ALB logs. Only applicable if access_logs_s3_bucket_lifecycle_enabled is true."
  type        = number
  default     = null # No expiration by default
}

# Management/FinOps Settings
variable "tags" {
  description = "A map of tags to assign to all resources created by this module."
  type        = map(string)
  default     = {}
}
