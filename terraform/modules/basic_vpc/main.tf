# main.tf
# This file defines the core resources for the basic VPC module.

# 1. AWS VPC
# Creates the Virtual Private Cloud (VPC) with the specified CIDR block.
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-vpc"
    }
  )
}

# 2. Internet Gateway (for public subnets)
# Allows communication between the VPC and the internet.
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-igw"
    }
  )
}

# 3. Public Subnets
# These subnets will be associated with a route table that routes traffic to the Internet Gateway.
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-public-subnet-${count.index + 1}"
    }
  )
}

# 4. Private Subnets
# These subnets will be associated with a route table that routes outbound traffic through the NAT Gateway.
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-private-subnet-${count.index + 1}"
    }
  )
}

# 5. Elastic IP for NAT Gateway
# A static IP address required for the NAT Gateway.
# The 'vpc = true' attribute is not needed and causes an error.
resource "aws_eip" "nat_gateway_eip" {
  count = length(var.private_subnet_cidrs) > 0 ? 1 : 0 # Only create EIP if private subnets exist
  # Removed: vpc = true # This attribute is not expected here for modern EIPs in VPC context

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-nat-eip"
    }
  )
}

# 6. NAT Gateway (for private subnets)
# Allows instances in private subnets to connect to the internet or other AWS services.
resource "aws_nat_gateway" "main" {
  count         = length(var.private_subnet_cidrs) > 0 ? 1 : 0 # Only create NAT GW if private subnets exist
  allocation_id = aws_eip.nat_gateway_eip[0].id
  subnet_id     = aws_subnet.public[0].id # Place NAT Gateway in a public subnet

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-nat-gw"
    }
  )

  # Ensure NAT Gateway is created after the Internet Gateway
  depends_on = [aws_internet_gateway.main]
}

# 7. Route Table for Public Subnets
# Routes internet-bound traffic (0.0.0.0/0) to the Internet Gateway.
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-public-rt"
    }
  )
}

# 8. Route Table Associations for Public Subnets
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# 9. Route Table for Private Subnets
# Routes internet-bound traffic (0.0.0.0/0) to the NAT Gateway.
resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidrs) > 0 ? 1 : 0 # Only create if private subnets exist
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[0].id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.target_environment}-private-rt"
    }
  )
}

# 10. Route Table Associations for Private Subnets
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id # Associate with the single private route table
}

# Data source to get available AZs in the current region
data "aws_availability_zones" "available" {
  state = "available"
}
