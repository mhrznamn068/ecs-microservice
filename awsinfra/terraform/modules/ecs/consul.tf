
resource "aws_cloudwatch_log_group" "consul_server_lg" {
  name = "consul_server-${var.env}"
}

module "consul_server" {
  name                        = "${var.project_name}-consul-${var.env}"
  source                      = "./modules/modules/consul_server"
  ecs_cluster_arn             = module.ecs_cluster.aws_ecs_cluster_cluster_arn
  subnet_ids                  = var.private_subnets
  vpc_id                      = var.vpc_id
  vpc_cidr                    = var.vpc_cidr
  lb_enabled                  = true
  lb_subnets                  = var.public_subnets
  internal_lb_subnets         = var.private_subnets
  //lb_ingress_rule_cidr_blocks = ["${var.lb_ingress_ip}/32"]
  lb_ingress_rule_cidr_blocks = ["${var.vpc_cidr}"]
  internal_lb_enabled         = true
  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-group         = aws_cloudwatch_log_group.consul_server_lg.name
      awslogs-region        = var.region
      awslogs-stream-prefix = "consul-server"
    }
  }
  launch_type = "FARGATE"
  datacenter = "${var.env}-dc1"
}

resource "aws_security_group_rule" "consul_server_ingress" {
  description              = "Access to Consul server from VPC CIDR"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = module.consul_server.security_group_id
  cidr_blocks              = ["${var.vpc_cidr}"]
}

