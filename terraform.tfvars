# Credentials
aws_profile = "Prod"

# AWS Region where DPOP Should be Created
aws_region = "us-east-1"

aws_azs = ["us-east-1a", "us-east-1b"]


# The Name of the VPC
aws_vpc_name = 	"Terraform-Test"


# The CIDR block for the VPC
aws_vpc_cidr = "10.13.0.0/16"

# The default SSH key for all instances (the Key must exist in this region)
aws_key_name = "Prod"
instance_size = "c5.large"


volume_size = 40
volume_type = "gp2"
ami_id = "ami-1234567890"
project_name = "Prod-Terraform"


rds_user_cred = {
name = "dbuser"
password = "Terraform1234"
}
rds_multi_az = true
rds_instance_type = "db.m4.large"
lt_instance_type = "c5.large"

