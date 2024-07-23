variable "vpc_cider_blocks" {
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
   default = "KCVPC"
}

variable "subnets" {
  default = [
    {
      name              = "public_subnet"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-west-2a"
    },
    {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-west-2b"
      name              = "private_subnet"
    }
  ]
}

variable "igw_tags" {
  default = "kcvpc_igw"
}