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
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cider_blocks
  tags           = var.vpc_tags
}


module "public_subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnet = var.public_subnet
}

module "private_subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
  subnet = var.private_subnet
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  tags   = var.igw_tags
}

module "public_route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_tables = {
    tags       = "public_route_table"
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet_gateway.internet_gateway_id
  }

}
module "private_route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_tables = {
    tags       = "private_route_table"
    cidr_block = "0.0.0.0/0"
    gateway_id = ""
  }
}


module "public_route_table_association" {
  source         = "./modules/route_table_association"
  subnet_id      = module.public_subnet.subnet_id
  route_table_id = module.public_route_table.route_table_id
}
module "private_route_table_association" {
  source         = "./modules/route_table_association"
  subnet_id      = module.private_subnet.subnet_id
  route_table_id = module.private_route_table.route_table_id
}
