output "association_ids" {
  value       = aws_route_table_association.association[*].id
  description = "The IDs of the route table associations"
}