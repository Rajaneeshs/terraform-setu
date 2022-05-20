## Overview

**NOTE**: [Terraform][tfhome] must be version 1.0 or greater and valid AWS account credential configured.


## Getting Started


### Initializing Terraform

The following will initialize the local [terraform][tfhome] configuration without
creating a bucket for storing state data.

```sh
terraform init
```
### Configuration Variables for Terraform

[Terraform][tfhome] accepts variables which control its behaviors and the targets the
environment to build a cluster. Variables may be set through a
`terraform.tfvars` file or by setting environment variables.

The table below describes the variables and their names 


|Environment Variable Name|tfvars name|Type|Pipeline Visibility
|-|-|-|-|-|
|`TF_VAR_aws_region`|`aws_region`|Required|Public|
|`TF_VAR_aws_azs`>|`aws_azs`|Required|Public|
|`TF_VAR_aws_profile`|`aws_profile`|Required|Public|
|`TF_VAR_aws_vpc_name`|`aws_vpc_name`|Required|Public|
|`TF_VAR_aws_key_name`|`aws_key_name`|Required|Public|
|`TF_VAR_instance_size`|`instance_size`|Required|Public|
|`TF_VAR_volume_size`|`volume_size`|Required|Public|
|`TF_VAR_volume_type`|`volume_type`|Required|Public|
|`TF_VAR_ami_id`|`ami_id`|Required|Public|
|`TF_VAR_project_name`|`project_name`|Required|Public|
|`TF_VAR_rds_user_cred`|`rds_user_cred`|Required|Secret|
|`TF_VAR_rds_instance_type`|`rds_instance_type`|Required|Public|
|`TF_VAR_lt_instance_type`|`lt_instance_type`|Required|Public|
|`TF_VAR_servB_count`|`servB_count`|Required|Public|
|`TF_VAR_servC_count`|`servC_count`|Required|Public|
|`TF_VAR_rds_multi_az`|`rds_multi_az`|Optional|Public|

### Running Terraform

Run the following to ensure ***terraform*** will only perform the expected
actions:

```sh
terraform plan
```

Run the following to apply the configuration to the target AWS account 
environment:

```sh
terraform apply
```

