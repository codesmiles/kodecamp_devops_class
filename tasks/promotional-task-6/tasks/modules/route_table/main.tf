resource "aws_route_table" "this" {
  count = length(var.route_tables)
  vpc_id = var.vpc_id
  
  route {
    cidr_block = var.route_tables[count.index].cidr_block
    gateway_id = var.route_tables[count.index].gateway_id
  }

  tags = {
    name = var.route_tables[count.index].tags
  }
}

