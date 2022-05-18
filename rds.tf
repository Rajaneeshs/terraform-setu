locals {
  name   = "${lower(var.project_name)}-rds"

}


module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4"

  name        = local.name
  description = "Complete PostgreSQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = "aws_security_group.servC.id"
    },
  ]

}


module "postgres_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier =  local.name

  create_db_option_group = false
  create_db_parameter_group = false


  engine            = "postgres"
  engine_version    = "12.5"
  instance_class    = var.rds_instance_type
  allocated_storage = 50
  storage_encrypted     = true
  name     = "terraform"
  username = var.rds_user_cred.name
  password = var.rds_user_cred.password
  port     = 5432
  multi_az = var.rds_multi_az
  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.rds_security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  backup_retention_period = 30
  skip_final_snapshot     = true
  deletion_protection     = false
}


