variable "bucketname" {
    default = "kodecamp_tfbucket297983083"
}

variable "tags" {
  default = {
    "Name": "kodecamp bucket"
    "Project":"kodecamp DevOps Bootcamp"
  }
}


# variable "ami_id" {
#     description = "ubuntu 22 ami id"
#     # default = "ami-06a51409950c275
# }

# variable "ec2_type" {
#   default = "t2.micro"
# }

# variable "tags" {
#   description = "tags for ec2 server"
#   type = map(string)
#   default = {
#     Name        = "web_server"
#     Environment = "development"
#     project = "KC_bootcamp"
#   }
# }
