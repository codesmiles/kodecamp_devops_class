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
}

module "subnets" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnets = var.subnets
}
