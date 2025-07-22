# Terraform Module: Basic VPC

This module creates a standard, best-practice Virtual Private Cloud (VPC) on AWS. It is designed to provide a foundational network for other infrastructure components.

The module provisions the following resources:
* A VPC with DNS support enabled.
* Public and private subnets distributed across at least two Availability Zones for high availability.
* An Internet Gateway to allow internet access for resources in the public subnets.
* An Elastic IP and a NAT Gateway to allow resources in the private subnets to initiate outbound internet traffic.
* Route tables and associations for both public and private subnets.

## Usage

```hcl
module "basic_vpc" {
  source = "./modules/basic_vpc"

  project_name         = "my-project"
  environment          = "dev"
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Owner = "team-alpha"
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

| Name                   | Description                                                                              | Type          | Default | Required |
| ---------------------- | ---------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| `project_name`         | The name of the project. Used for naming resources.                                      | `string`      | n/a     |   yes    |
| `environment`          | The deployment environment (e.g., 'dev', 'test', 'prod'). Used for naming and tagging.   | `string`      | n/a     |   yes    |
| `vpc_cidr_block`       | The CIDR block for the VPC (e.g., '10.0.0.0/16').                                        | `string`      | n/a     |   yes    |
| `public_subnet_cidrs`  | A list of CIDR blocks for the public subnets. Must be at least two.                      | `list(string)`| n/a     |   yes    |
| `private_subnet_cidrs` | A list of CIDR blocks for the private subnets. Must be at least two.                     | `list(string)`| n/a     |   yes    |
| `tags`                 | A map of tags to assign to all resources created by this module.                         | `map(string)` | `{}`    |    no    |

## Outputs

| Name                  | Description                                      |
| --------------------- | ------------------------------------------------ |
| `vpc_id`              | The ID of the created VPC.                       |
| `public_subnet_ids`   | A list of IDs of the created public subnets.     |
| `private_subnet_ids`  | A list of IDs of the created private subnets.    |
| `internet_gateway_id` | The ID of the created Internet Gateway.          |
| `nat_gateway_id`      | The ID of the created NAT Gateway.               |

## Resources

| Name                                                                      | Type                       |
| ------------------------------------------------------------------------- | -------------------------- |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource                   |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource                   |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource                   |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource                   |
| [aws_eip.nat_gateway_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource                   |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource                   |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource                   |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource                   |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource                   |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource                   |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source                |
