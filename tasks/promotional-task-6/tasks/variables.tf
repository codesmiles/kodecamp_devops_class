variable "subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
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
