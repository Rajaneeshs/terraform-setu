module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"


  # Autoscaling group
  name = "${var.project_name}-ASG"

  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "ELB"
  vpc_zone_identifier       = module.vpc.private_subnets

  initial_lifecycle_hooks = [
    {
      name                  = "ExampleStartupLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 60
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
      notification_metadata = jsonencode({ "hello" = "world" })
    },
    {
      name                  = "ExampleTerminationLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 180
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
      notification_metadata = jsonencode({ "goodbye" = "world" })
    }
  ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  lt_name                = "${var.project_name}-ASG-LT"
  description            = "Launch template"
  update_default_version = true

  use_lt    = true
  create_lt = true

  image_id          = var.ami_id
  instance_type     = var.lt_instance_type
  enable_monitoring = true
  user_data_base64  = base64encode(local.user_data)
  target_group_arns = module.nlb.target_group_arns
  key_name = var.aws_key_name
  security_groups = [aws_security_group.allow_tls.id]


  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.volume_size
        volume_type           = var.volume_type
      }
    }
  ]

}

