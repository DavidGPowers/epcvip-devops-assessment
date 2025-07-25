module "basic_vpc" {
  source = "./modules/basic_vpc"

  project_name       = "dp-webapp"
  target_environment = "dev"

  # in prod use IP Address Manager (IPAM)
  vpc_cidr_block       = "10.100.0.0/16"
  public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnet_cidrs = ["10.100.101.0/24", "10.100.102.0/24"]

  tags = local.common_tags
}

output "vpc_id" {
  value = module.basic_vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.basic_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.basic_vpc.private_subnet_ids
}
