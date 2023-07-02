include "root" {
  path = "${get_terragrunt_dir()}/../terragrunt.hcl"
}

locals {
  env = "staging"
}

terraform {
  source = "../../../modules/vpc/"

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

inputs = {
  env = local.env
}
