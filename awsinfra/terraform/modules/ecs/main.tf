data "aws_caller_identity" "current" {}

data "aws_route53_zone" "zone" {
  name         = var.zone
}

data "aws_acm_certificate" "wildcard_acm" {
  domain   = "*.${var.zone}"
  statuses = ["ISSUED"]
}

locals {
  env_suffix_dash = var.env == "prod" ? "" : "-${var.env}"
  env_prefix_dash = var.env == "prod" ? "" : "${var.env}-"
}

