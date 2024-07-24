resource "aws_subnet" "this" {

  vpc_id            = var.vpc_id
  cidr_block        = var.subnet.cidr_block
  availability_zone = var.subnet.availability_zone

  tags = {
    name = var.subnet.tags
  }
}
