module "apigateway" {
  source                          = "./modules"
  env                             = var.env
  vpc_id                          = var.vpc_id
  vpc_cidr                        = var.vpc_cidr
  aws_region                      = var.region
  vpc_pvt_subnet_ids              = var.private_subnets
  vpc_pub_subnet_ids              = var.public_subnets
  project_name                    = var.project_name
  cluster_arn                     = module.ecs_cluster.aws_ecs_cluster_cluster_arn
  lb_enabled                      = "true"
  component                       = "apigateway"
  port                            = 80
  health_check_code               = 200
  health_check_path               = "/health-check"
  command                         = "server"
  component_ecr_url               = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.project_name}-apigateway-${var.env}"
  component_image_tag             = var.apigateway_image_tag
  container_cpu                   = 2048
  certificate_arn                 = var.certificate_arn
  http_redirect                   = false
  internal_lb_enabled             = false
  log_retention                   = var.log_retention
  environment_variables           = [
    {
      name  = "ENVIRONMENT"
      value = var.env
    },
    {
      name = "NODE"
      value = "apigateway"
    },
    {
      name = "PRIMARY"
      value = 1
    },
    {
      name = "CONSUL_SERVER"
      value = module.consul_server.internal_lb_dns_name
    }
  ]
}
