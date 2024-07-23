variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the route table"
  type        = list(string)
}

variable "route_table_ids" {
  description = "ID of the public route table to associate with the subnets"
}