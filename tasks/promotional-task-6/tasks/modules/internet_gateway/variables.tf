variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway"
  type        = string
}

variable "tags" {
    description = "the name given to the tags to attach the Internet Gateway"
    type        = string
}