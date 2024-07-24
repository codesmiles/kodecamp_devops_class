variable "vpc_cider_blocks" {
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
   default = "KCVPC"
}

variable "public_subnet" {
  description = "credentials for public subnet"
  default = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-west-2a"
      tags              = "public_subnet"
    }
}

variable "private_subnet" {
  description = "credentials for private subnet"
  default = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-west-2b"
      tags              = "private_subnet"
    }
}

variable "igw_tags" {
  default = "kcvpc_igw"
}