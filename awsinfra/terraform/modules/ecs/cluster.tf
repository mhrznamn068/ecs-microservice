module "ecs_cluster" {
  source  = "cn-terraform/ecs-cluster/aws"
  version = "1.0.10"
  name    = "${var.project_name}-${var.env}"
  containerInsights = var.containerInsights
}
