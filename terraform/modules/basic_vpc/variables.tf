# variables.tf
# This file defines the input variables for the basic VPC module.

variable "project_name" {
  description = "The name of the project. Used for naming resources."
  type        = string
}

variable "target_environment" {
  description = "The deployment target_environment (e.g., 'dev', 'uat', 'prd'). Used for naming resources and tagging."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC (e.g., '10.0.0.0/16')."
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "The VPC CIDR block must be a valid CIDR."
  }
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets. Must be at least two for high availability."
  type        = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "At least two public subnet CIDR blocks must be provided for high availability."
  }
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets. Must be at least two for high availability."
  type        = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "At least two private subnet CIDR blocks must be provided for high availability."
  }
}

variable "tags" {
  description = "A map of tags to assign to all resources created by this module."
  type        = map(string)
  default     = {}
}
