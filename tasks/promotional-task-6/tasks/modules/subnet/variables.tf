variable "subnets" {
  description = "A list of maps defining subnet configurations"
  type = list(object({
    tags              = string
    cidr_block        = string
    availability_zone = string
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC to associate with the subnets"
  type        = string
}
