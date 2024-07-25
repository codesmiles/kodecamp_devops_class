output "vpc_id" {
  value = module.vpc.vpc_id
  description = "The ID of the VPC created by the module"
}

output "public_subnet_id" {
  value = module.public_subnet.subnet_id
  description = "The IDs of the subnets created by the module"
}
output "private_subnet_id" {
  value = module.private_subnet.subnet_id
  description = "The IDs of the subnets created by the module"
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
  description = "The ID of the Internet Gateway"
}

output "public_route_table_id" {
  value       = module.public_route_table.route_table_id
  description = "The ID of the public route table"
}

output "private_route_table_id" {
  value       = module.private_route_table.route_table_id
  description = "The ID of the private route table"
}

output "public_route_table_association_id" {
  value = module.public_route_table_association.route_association_output
  description = "The ID of the public route table association"
}
output "private_route_table_association_id" {
  value       = module.private_route_table_association.route_association_output
  description = "The IDs of the private route table associations"
}

output "public_elastic_ip_id" {
  value = module.public_elastic_ip.eip_id
  description = "public_elastic_ip"
}

output "public_nat_gw_id" {
  value = module.public_nat_gw.nat_gateway_id
  description = "public nat gatway"
}