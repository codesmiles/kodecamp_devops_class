variable "vpc_id" {
  description = "ID of the VPC to create security groups in"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

# variable "sg_main_data" {
#   type = object({
#     name        = string
#     description = string
#     vpc_id      = string
#     tags        = string
#   })
# }

# variable "sg_ingress" {
#   type = list(object({
#     from_port       = number
#     to_port         = number
#     protocol        = string
#     cidr_blocks   = list(string)
#     security_groups = list(string)
#   }))

# }

# variable "sg_egress" {
#   type = list(object({

#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))
# }
