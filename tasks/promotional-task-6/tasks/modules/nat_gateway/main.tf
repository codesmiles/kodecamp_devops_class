resource "aws_nat_gateway" "this" {
  subnet_id     = var.nat_gw_cred.subnet_id
  allocation_id = var.nat_gw_cred.elastic_ip_id

  tags = {
    Name = var.nat_gw_cred.tags
  }
  # depends_on = [aws_internet_gateway.example]
}
