resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = var.route_table.cidr_block
    gateway_id = var.route_table.gateway_id
  }
  tags = {
    name = var.route_table.tags
  }
}

