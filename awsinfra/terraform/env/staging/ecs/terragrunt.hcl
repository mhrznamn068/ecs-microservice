include "root" {
  path = "${get_terragrunt_dir()}/../terragrunt.hcl"
}

locals {
  env = "staging"
}

terraform {
  source = "../../../modules/ecs/"

  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy"
    ]

    # With the get_terragrunt_dir() function, you can use relative paths!
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../../common.tfvars",
      "-var-file=${get_terragrunt_dir()}/../${local.env}.tfvars"
    ]
  }
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "dummyiTuhuior675t",
    k8s_subnets = "['dummy1234', 'dummy4321']"
  }
}

inputs = {
  env = local.env
  vpc_id = dependency.vpc.outputs.vpc_id
  private_subnets = dependency.vpc.outputs.private_subnets
  public_subnets = dependency.vpc.outputs.public_subnets
  containerInsights = "true"
  certificate_arn = ""
  deploy_env = "dev"
  log_retention = 1
  hostname = "example.com"
  zone = "example.com"
}

