output "subnets_for_tgw" {
  description = "List of IDs of all subnets"
  value       = { "db_subnets" = module.vpc.database_subnets, "private_subnets" = module.vpc.private_subnets, "public_subents" = module.vpc.public_subnets }
}

output "vpc_for_tgw" {
  description = "VPC ID "
  value       = module.vpc.vpc_id
}


