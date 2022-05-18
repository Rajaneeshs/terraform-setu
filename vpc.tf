# VPC endpoint gateway and asssociate with all route table 


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_azs
  private_subnets = local.private_cidrs
  public_subnets  = local.public_cidrs
  database_subnets= local.aws_db_cidrs

  enable_nat_gateway = true
  one_nat_gateway_per_az = true
  create_database_subnet_group = true
  enable_dns_hostnames = true
  enable_dns_support   = true

}


# Supporting Resources

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

