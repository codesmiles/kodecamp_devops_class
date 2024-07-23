resource "aws_route_table_association" "association" {
  count          = length(var.route_table_ids) * length(var.subnet_ids)
  subnet_id      = element(var.subnet_ids, count.index % length(var.subnet_ids))
  route_table_id = element(var.route_table_ids, floor(count.index / length(var.subnet_ids)))
}