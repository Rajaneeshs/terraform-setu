variable "aws_region" {
  description = "AWS Deployment region.."
  default = "us-east-1"
}

variable "aws_profile" {
  description = "AWS IAM profile for terraform.."
}

variable "aws_vpc_name" {}
variable "aws_vpc_cidr" {}
variable "aws_key_name" {}
variable "aws_azs" {
type = list
}
variable "volume_size" {}
variable "volume_type" {}
variable "lt_instance_type" {}
variable "project_name" {}
variable "var.servB_count" {}
variable "var.servC_count" {}
 
variable "ami_id" {
type = string 
description = "Valid  ubuntu AMI"
validation {
condition     = can(regex("^ami-", var.ami_id))
error_message = "The ami_id must be valid AMI id of the form ami- ."
}
}
