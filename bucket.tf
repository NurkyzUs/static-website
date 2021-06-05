### create S3 bucket with public-read acl  

resource "aws_s3_bucket" "first_bucket" {
  bucket = "s3-website-bucket-n"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  versioning {
      enabled    = true
}
}
### blocking all public acces on S3 bucket 

resource "aws_s3_bucket_public_access_block" "bucket_n" {
  bucket = aws_s3_bucket.first_bucket.id

  block_public_acls   = true
  block_public_policy = true
  restrict_public_buckets =true
  ignore_public_acls      = true
}