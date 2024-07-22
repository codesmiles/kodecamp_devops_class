terraform{
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.57.0"
        }
    }
}

provider "aws" {
  region = "eu-west-1"
  profile = "user_michael" #kc_user
}

module "kc_tfbucket" {
    source = "./modules/s3"
    bucketname = var.bucketname
    tags = var.tags
}


# resource "aws_instance" "this" {
#     ami = var.ami.ami_id
#     instance_type = var.ec2_type

#     tags = var.tags

# }

