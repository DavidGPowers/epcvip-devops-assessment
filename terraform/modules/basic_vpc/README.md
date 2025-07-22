# AWS Basic VPC Module

This Terraform module creates a foundational AWS Virtual Private Cloud (VPC) with a standard network topology, including:

* A custom VPC with specified CIDR block.

* Two public subnets, each in a different Availability Zone, with automatic public IP assignment.

* Two private subnets, each in a different Availability Zone.

* An Internet Gateway attached to the VPC for public subnet internet access.

* A NAT Gateway (with an associated Elastic IP) deployed in one of the public subnets, enabling outbound internet access for resources in private subnets.

* Appropriate route tables and associations for both public and private subnets.

This module provides a secure and highly available network foundation for deploying applications within AWS.

## Features

* **Configurable VPC CIDR:** Define your desired IP address range for the VPC.

* **Public and Private Subnets:** Automatically provisions two public and two private subnets across different Availability Zones for high availability.

* **Internet Connectivity:** Sets up an Internet Gateway for public subnets.

* **Outbound Private Connectivity:** Deploys a NAT Gateway for instances in private subnets to access the internet securely.

* **Automated Routing:** Configures route tables and associations for seamless traffic flow.

* **Flexible Naming & Tagging:** Uses `project_name` and `target_environment` variables for consistent resource naming and supports custom tags.

## Usage

To use this module, define it in your Terraform configuration and provide the required input variables.

```terraform
module "my_vpc" {
  source = "./modules/basic-vpc" # Adjust the path to this module

  project_name       = "my-app"
  target_environment        = "dev"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Owner       = "DevTeam"
    CostCenter  = "12345"
  }
}

output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.my_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.my_vpc.private_subnet_ids
}

````

## Inputs

| Name | Description | Type | Default | Required |
| ----- | ----- | ----- | ----- | ----- |
| `project_name` | The name of the project. Used for naming resources. | `string` | n/a | yes |
| `target_environment` | The deployment target_environment (e.g., 'dev', 'test', 'prod'). Used for naming resources and tagging. | `string` | n/a | yes |
| `vpc_cidr_block` | The CIDR block for the VPC (e.g., '10.0.0.0/16'). | `string` | n/a | yes |
| `public_subnet_cidrs` | A list of CIDR blocks for the public subnets. Must be at least two for high availability. | `list(string)` | n/a | yes |
| `private_subnet_cidrs` | A list of CIDR blocks for the private subnets. Must be at least two for high availability. | `list(string)` | n/a | yes |
| `tags` | A map of tags to assign to all resources created by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ----- | ----- |
| `vpc_id` | The ID of the created VPC. |
| `public_subnet_ids` | A list of IDs of the created public subnets. |
| `private_subnet_ids` | A list of IDs of the created private subnets. |
| `internet_gateway_id` | The ID of the created Internet Gateway. |
| `nat_gateway_id` | The ID of the created NAT Gateway. |

## Requirements

| Name | Version |
| ----- | ----- |
| `terraform` | `>= 1.0` |
| `aws` | `~> 6.0` |

## Resources

| Name | Type |
| ----- | ----- |
| `aws_vpc.main` | resource |
| `aws_internet_gateway.main` | resource |
| `aws_subnet.public` | resource |
| `aws_subnet.private` | resource |
| `aws_eip.nat_gateway_eip` | resource |
| `aws_nat_gateway.main` | resource |
| `aws_route_table.public` | resource |
| `aws_route_table_association.public` | resource |
| `aws_route_table.private` | resource |
| `aws_route_table_association.private` | resource |
| `aws_availability_zones.available` | data source |


