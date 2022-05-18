module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.project_name}-NLB"

  load_balancer_type = "network"
  enable_cross_zone_load_balancing = true

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets


  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 8080
      target_type      = "instance"
      deregistration_delay = 10

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/live"
        port                = "8081"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
}
  ]

  http_tcp_listeners = [
    {
      port               = 443
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

}

