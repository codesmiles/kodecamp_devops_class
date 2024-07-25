resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id
  name   = "PublicSecurityGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id
  name   = "PrivateSecurityGroup"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group" "this" {
#    name        = var.sg_main_data.name
#   description = var.sg_main_data.description
#   vpc_id      = var.sg_main_data.vpc_id


#    dynamic "ingress" {
#     for_each = var.sg_ingress
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#     }
#   }

#   dynamic "egress" {
#     for_each = var.sg_egress
#     content {
#       from_port = egress.value.from_port
#       to_port = egress.value.to_port
#       protocol = egress.value.protocol
#       cidr_blocks = egress.value.cidr_blocks
#     }  
#   }
    
#     tags = {
#         Name = var.sg_main_data.tags
#     }
# }



