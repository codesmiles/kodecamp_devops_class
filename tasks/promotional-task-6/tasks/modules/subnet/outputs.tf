output "subnet_id" {
  value = aws_subnet.this.id
}

# output "subnet_types" {
#   value = [for subnet in var.subnets : subnet.type]
# }