variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the route table"
  type        = list(string)
}

variable "tags" {
  description = "names of tags to associate with the route table"
}
