generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-south-1"
  profile = "django-microservice-demo"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket  = "django-microservice-demo-terraform"
    key     = "staging/${path_relative_to_include()}/tf.tfstate"
    region  = "ap-south-1"
    profile = "django-microservice-demo"
  }
}
EOF
}
