resource "aws_s3_bucket" "this" {
 bucket = var.bucketname
 tags = var.tags
}

resource "aws_kms_key" "kc_bucket_key" {
  description = ""
}


