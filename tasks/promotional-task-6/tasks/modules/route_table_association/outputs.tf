output "route_table_association_ids" {
  value       = [for assoc in aws_route_table_association.subnet_association : assoc.id]
  description = "The IDs of the route table associations"
}