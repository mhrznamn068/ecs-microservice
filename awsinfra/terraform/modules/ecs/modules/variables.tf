variable "vpc_id" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "vpc_pvt_subnet_ids" {
  type = list(string)
}
variable "vpc_pub_subnet_ids" {
  type = list(string)
}

variable "project_name" {
  type = string
}

variable "env" {
  description = "Environment stage to deploy resource"
  type = string
}

variable "cluster_arn" {
  description = "ECS cluster arn"
  type = string
}

variable "lb_enabled" {
  description = "Enables ALB for component"
  type = bool
}

variable "component" {
    description = "Component name (Microservice Name)"
    type = string
}

variable "port" {
    description = "Service port"
    type = number
}

variable "health_check_code" {
    description = "Service health check response code"
    type = number
}

variable "health_check_path" {
  description = "Service health check path"
  type = string
}

variable "command" {
  description = "Command to run in Container"
  type = string
}

variable "component_ecr_url" {
    description = "ECR url for component"
}

variable "component_image_tag" {
    description = "Image tag of component"
}

variable "container_cpu" {
    description = "CPU allocation for component container"
    type = number
}

variable "environment_variables" {
  type = list(object({
    name  = string
    value = string
  }))
}

variable "certificate_arn" {}

variable "http_redirect" {
  description = "ALB HTTP to HTTP redirection"
  type = bool
}

variable "internal_lb_enabled" {
  description = "Internal facing loadbalancer"
  type = bool
}

variable "log_retention" {
  type = number
}