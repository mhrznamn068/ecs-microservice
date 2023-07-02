variable "vpc_id" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "region" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}

variable "project_name" {
  type = string
}

variable "env" {
  description = "Environment stage to deploy resource"
  type = string
}

variable "deploy_env" {
  type = string
}

variable "hostname" {
  type = string
}

variable "zone" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "containerInsights" {
  description = "Enables container insights if true"
  type = bool
}

variable "apigateway_image_tag" {
  description = "Image tag of app service"
  type = string
}

variable "countries_image_tag" {
  description = "Image tag of app service"
  type = string
}

variable "food_image_tag" {
  description = "Image tag of app service"
  type = string
}

variable "log_retention" {
  type = number
}