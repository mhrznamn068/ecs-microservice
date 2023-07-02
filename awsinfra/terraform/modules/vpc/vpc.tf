resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = merge(
      var.common_tags,
      {
        Name         = "${var.project_name}-${var.env}-vpc"
      }
  )

}

output "vpc_id" {
  value = aws_vpc.vpc.id
}