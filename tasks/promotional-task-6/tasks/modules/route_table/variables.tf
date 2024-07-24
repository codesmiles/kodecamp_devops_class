
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to associate with the route table"
}

variable "route_tables" {
  description = "a list of maps defining the route table configuration"
  type = object({
    tags       = string
    cidr_block = string
    gateway_id = string
  })

}