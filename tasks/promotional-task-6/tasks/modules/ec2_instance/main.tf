resource "aws_key_pair" "key_pair" {
  key_name   = "kcvpc-key-pair-14345314"
  public_key = file("~/.ssh/kcvpc-key-pair.pub")
}


resource "aws_instance" "this" {
  ami =var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  security_groups = var.sg_id
  # key_name = data.aws_key_pair.key_pair.key_name
  key_name = aws_key_pair.key_pair.key_name
  user_data = var.file_path

  tags = {
    Name = var.instance_name
  }

    provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_address.txt"
  }
}

# data "aws_key_pair" "key_pair" {
#   key_name = "kcvpcfinalkeypair"
#   include_public_key = true
# }

# Resource to create a new key pair