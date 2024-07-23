terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "user_michael"
}


module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cider_blocks
  tags = var.vpc_tags
}

module "subnets" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnets = var.subnets
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  tags = var.igw_tags
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_tables =  [
    {
      tags = "public_route_table"
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway_id
    } 
  ]
}

module "route_table_associations" {
  source         = "./modules/route_table_association"
  subnet_ids      = module.subnets.subnet_ids
  route_table_ids = module.route_table.route_table_ids
}

# module "route_table_association" {
#   source = "./modules/route_table_association"
#   route_table_id  = route_table
#   tags 
#   route_table_id 
# }

# output "route_table_association_ids" {
#   value       = [for assoc in aws_route_table_association.subnet_association : assoc.id]
#   description = "The IDs of the route table associations"
# }

# resource "aws_route_table_association" "association" {
#   count          = length(var.subnet_ids)
#   subnet_id      = var.subnet_ids[count.index]
#   route_table_id = var.route_table_id

# }
