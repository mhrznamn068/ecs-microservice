output "lb_dns_name" {
  value = var.lb_enabled ? aws_lb.lb[0].dns_name : null
}

output "lb_zone_id" {
  value = var.lb_enabled ? aws_lb.lb[0].zone_id : null
}
