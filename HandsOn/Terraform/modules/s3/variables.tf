variable "bucketname" {
  description = "Name of the bucket"
  type        = string
}

variable "tags" {
    description = "Tag for the bucket "
    type        = map(string)
  
}