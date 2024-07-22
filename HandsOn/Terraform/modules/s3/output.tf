output "bucket_name" {
  value = aws_s3_bucket.kc_tf_bucket.bucket 
}

output "tags" {
 value = aws_s3_bucket.kc_tf_bucket.tags 
}