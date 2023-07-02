variable "region" {
    description = "AWS region"
    type = string
}

variable "project_name" {
  description = "Project Name"
  type = string
}

variable "region_azs" {
  description = "AWS Region Suffix"
}

variable "num_public_subnets" {
  description = "Number of required public subnets"
}

variable "num_private_subnets" {
  description = "Number of required private subnets"
}

variable "vpc_cidr" {
  description = "VPC subnet CIDR"
}

variable "common_tags" {
  description = "Tags for AWS resource"
}

variable "env" {
  description = "Environment to be deployed on"
  type = string
}

