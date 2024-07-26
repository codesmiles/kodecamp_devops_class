variable "key_name" {
  description = "Name of the SSH key pair for accessing EC2 instances"
  type        = string
}

variable "sg_id" {
  description = "The Security Group ID for accessing EC2 instances"
  type = list(string)
}

variable "file_path"{
  type = string
  description = "the path to the file for installing the sath"
}
variable "instance_name" {
  type = string
  description = "Name for the EC2 instance"
}
variable "subnet_id" {
  type= string
  description = "ID of the subnet in which to launch the EC2 instance"
}
variable "ami" {
  description = "AMI ID to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
}

