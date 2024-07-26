data "aws_key_pair" "key_pair" {
  key_name = var.key_name
  include_public_key = true
}

resource "aws_instance" "this" {
  ami =var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  security_groups = var.sg_id
  key_name = data.aws_key_pair.key_pair.key_name
  user_data = var.file_path

  tags = {
    Name = var.instance_name
  }
}


