output "vpc_id" {
  value = module.vpc.vpc_id
  description = "The ID of the VPC created by the module"
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
  description = "The IDs of the subnets created by the module"
}