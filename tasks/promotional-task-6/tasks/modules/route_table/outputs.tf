output "route_table_ids" {
  value       = aws_route_table.this[*].id
  description = "The IDs of the route tables"
}