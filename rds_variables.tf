variable "rds_multi_az" {
default = false
}

variable "rds_user_cred" {
  type = object({
    name    = string
    password = string
  })
  sensitive = true
}

variable "rds_instance_type"{}

