resource "aws_eip" "this" {
#   instance = var.eip.instance
  domain   = "vpc"

  tags = {
    Name = var.eip.tags
  }
}

# aws_instance.web.id
# resource "aws_eip" "this" {
#   domain = "vpc"

#   instance                  = aws_instance.foo.id
#   associate_with_private_ip = "10.0.0.12"
#   depends_on                = [aws_internet_gateway.gw]

#   tags = 
# }