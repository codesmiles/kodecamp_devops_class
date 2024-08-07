variable "vpc_cider_blocks" {
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
   default = "KCVPC"
}

variable "public_subnet" {
  description = "credentials for public subnet"
  default = {
      tags              = "public_subnet"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "eu-west-1a"
    }
}

variable "private_subnet" {
  description = "credentials for private subnet"
  default = {
      tags              = "private_subnet"
      cidr_block        = "10.0.2.0/24"
      availability_zone = "eu-west-1b"
    }
}

variable "igw_tags" {
  default = "kcvpc_igw"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "my_ip_address" {
  type = string
  default = "102.89.33.144" # Run curl ifconfig.me on your terminal or visit https://www.whatismyip.com/
}

variable "ami" {
  type = string
  default = "ami-07f34a34ca2efac5d" #ubuntu 20.04 LTS
}
variable "instance_type" {
  type = string
  default = "t2.micro"
  }

  variable "public_instance_name" {
    type = string
    default = "public_instance"
  }
  variable "private_instance_name" {
    type = string
    default = "private_instance"
  }