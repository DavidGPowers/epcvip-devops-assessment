# variables.tf
# This file defines the input variables for the web application service module.

# Application Naming
variable "app_name" {
  description = "A unique name for the web application (e.g., 'my-webapp'). Used for naming resources."
  type        = string
}

variable "target_environment" {
  description = "The target environment (e.g., 'dev', 'test', 'prod') to append to resource names and for tagging."
  type        = string
}

# Network Configuration
variable "vpc_id" {
  description = "The ID of the VPC where the target group and ASG instances will be deployed."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the Auto Scaling Group instances will be launched. These should be private subnets."
  type        = list(string)
  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "At least two subnet IDs must be provided for the Auto Scaling Group for high availability."
  }
}

# ALB Configuration
variable "alb_source_security_group_id" {
  description = "The ID of the security group attached to the ALB. This is used to allow traffic from the ALB to the EC2 instances."
  type        = string
}

# ALB Listener Rule Configuration
variable "alb_listener_arn" {
  description = "The ARN of the ALB listener to attach the rule to. Required if any listener rule conditions are provided."
  type        = string
  default     = null
}

variable "listener_rule_priority" {
  description = "The priority for the listener rule (1-50000). Required if any listener rule conditions are provided."
  type        = number
  default     = null
}

variable "listener_rule_host_headers" {
  description = "A list of host headers to match. If provided, a listener rule will be created."
  type        = list(string)
  default     = []
}

variable "listener_rule_path_patterns" {
  description = "A list of path patterns to match. If provided, a listener rule will be created."
  type        = list(string)
  default     = []
}

variable "listener_rule_http_methods" {
  description = "A list of HTTP methods to match (e.g., GET, POST). If provided, a listener rule will be created."
  type        = list(string)
  default     = []
}

# Auto Scaling Policy Configuration
variable "enable_cpu_scaling_policies" {
  description = "Set to true to create CPU-based step scaling policies and CloudWatch alarms."
  type        = bool
  default     = false
}

variable "scale_up_cpu_threshold" {
  description = "The average CPU utilization that triggers a scale-up event (e.g., 70)."
  type        = number
  default     = 70
}

variable "scale_down_cpu_threshold" {
  description = "The average CPU utilization that triggers a scale-down event (e.g., 30)."
  type        = number
  default     = 30
}

variable "cpu_threshold_evaluation_periods" {
  description = "The number of consecutive 1-minute periods the CPU threshold must be breached to trigger scaling."
  type        = number
  default     = 5 # 5 minutes
}

variable "scale_up_adjustment" {
  description = "The number of instances to add during a scale-up event."
  type        = number
  default     = 1
}

variable "scale_down_adjustment" {
  description = "The number of instances to remove during a scale-down event. Must be negative."
  type        = number
  default     = -1
  validation {
    condition     = var.scale_down_adjustment < 0
    error_message = "The scale_down_adjustment value must be negative."
  }
}

# ALB Target Group Configuration
variable "target_group_port" {
  description = "The port on which the EC2 instances in the target group will receive traffic from the ALB."
  type        = number
  default     = 80 # Common default for web applications
}

variable "target_group_protocol" {
  description = "The protocol for the target group (e.g., HTTP, HTTPS, TCP, TLS, UDP, TCP_UDP, GENEVE)."
  type        = string
  default     = "HTTP"
  validation {
    condition     = contains(["HTTP", "HTTPS", "TCP", "TLS", "UDP", "TCP_UDP", "GENEVE"], upper(var.target_group_protocol))
    error_message = "Invalid target_group_protocol. Must be one of: HTTP, HTTPS, TCP, TLS, UDP, TCP_UDP, GENEVE."
  }
}

# Health Check Configuration
variable "health_check_path" {
  description = "The destination for the health check request. For HTTP/HTTPS, this is a URL path. For TCP/SSL, it's ignored."
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "The port the load balancer uses when performing health checks on the targets. Default is traffic-port."
  type        = string
  default     = "traffic-port" # Use the port the target group is listening on
}

variable "health_check_protocol" {
  description = "The protocol the load balancer uses when performing health checks. Default is the target group protocol."
  type        = string
  default     = "HTTP"
  validation {
    condition     = contains(["HTTP", "HTTPS", "TCP", "TLS"], upper(var.health_check_protocol))
    error_message = "Invalid health_check_protocol. Must be one of: HTTP, HTTPS, TCP, TLS."
  }
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Between 5 and 300 seconds."
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response from a target means a failed health check. Between 2 and 120 seconds."
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. Between 2 and 10."
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering a target unhealthy. Between 2 and 10."
  type        = number
  default     = 3
}

variable "health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. For HTTP/HTTPS protocol only. You can specify a range of values (e.g., '200-299') or a comma-separated list of values (e.g., '200,202')."
  type        = string
  default     = "200"
}

# Auto Scaling Group Configuration
variable "launch_template_id" {
  description = "The ID of the EC2 Launch Template to use for the Auto Scaling Group instances."
  type        = string
}

variable "launch_template_version" {
  description = "The version of the Launch Template to use (e.g., '$Latest', '$Default', or a specific version number)."
  type        = string
  default     = "$Latest"
}

variable "desired_capacity" {
  description = "The desired number of EC2 instances in the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "min_size" {
  description = "The minimum number of EC2 instances in the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of EC2 instances in the Auto Scaling Group."
  type        = number
  default     = 2
}

# General Settings
variable "tags" {
  description = "A map of tags to assign to all resources created by this module."
  type        = map(string)
  default     = {}
}
