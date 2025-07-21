# outputs.tf
# This file defines the output values for the basic VPC module.

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "A list of IDs of the created public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "A list of IDs of the created private subnets."
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "The ID of the created Internet Gateway."
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "The ID of the created NAT Gateway."
  value       = length(aws_nat_gateway.main) > 0 ? aws_nat_gateway.main[0].id : null
}
