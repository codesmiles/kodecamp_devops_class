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
  route_tables = [
    {
      tags = "public_route_table"
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway_id
    } 
  ]

}