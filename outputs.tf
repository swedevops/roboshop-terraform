#output "vpc" {
#  value = lookup(lookup(module.vpc, "main", null), "subnets", null)
#}

output "vpc" {
  value = module.vpc
}
output "app" {
  value = module.app
}