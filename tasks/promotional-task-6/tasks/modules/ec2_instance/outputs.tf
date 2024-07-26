output "aws_instance_id" {
  value = aws_instance.this.id
}

output "instance_ip_addr" {
  value = aws_instance.this.public_ip
}