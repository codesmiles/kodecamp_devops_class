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
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
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
  route_table = {
    tags       = "public_route_table"
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet_gateway.internet_gateway_id
  }

}
module "private_route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_table = {
    tags       = "private_route_table"
    cidr_block = "0.0.0.0/0"
    gateway_id = module.public_nat_gw.nat_gateway_id
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

module "public_elastic_ip" {
  source = "./modules/elasitc_ip"
  eip = {
    tags = "public_elastic_ip"
  }
}

module "public_nat_gw" {
  source = "./modules/nat_gateway"

  nat_gw_cred = {
    elastic_ip_id = module.public_elastic_ip.eip_id,
    subnet_id     = module.public_subnet.subnet_id,
    tags          = "public_nat_gw"
  }
}

module "security_group" {
  my_ip              = var.my_ip_address
  source             = "./modules/security_group"
  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
}

module "public_ec2_instance" {
  ami           = var.ami
  sg_id         = [module.security_group.public_sg_id]
  source        = "./modules/ec2_instance"
  subnet_id     = module.public_subnet.subnet_id
  file_path     = file("${path.module}/scripts/install_nginx.sh")
  instance_name = var.public_instance_name
  instance_type = var.instance_type
}

module "private_ec2_instance" {
  ami           = var.ami
  sg_id         = [module.security_group.private_sg_id]
  source        = "./modules/ec2_instance"
  subnet_id     = module.private_subnet.subnet_id
  file_path     = file("${path.module}/scripts/install_posgres.sh")
  instance_name = var.private_instance_name
  instance_type = var.instance_type
}
