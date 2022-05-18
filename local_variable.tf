# CIDR Blocks for the VPC
locals {
public_cidrs  = ["${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,1)}" , "${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,2)}"]
private_cidrs = ["${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,4)}" , "${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,5)}"]
aws_db_cidrs  = ["${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,20)}", "${cidrsubnet("${module.vpc.vpc_cidr_block}", 8,21)}"]


  user_data = <<-EOT
  #!/bin/bash
  apt-get update
  apt-get -y install python3-venv awscli sshpass
  EOT


}


