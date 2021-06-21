### it will create S3 bucket with private acl 

resource "aws_s3_bucket" "www_bucket_n" {
  bucket = "web.${var.bucket_name}"
  acl    = "private"

  
  website {
    index_document = "index.html" ### when request comes to our domain_name
    error_document = "404.html"   ### when page will not be available
  }

  ### versioning will be enabled

  versioning {
    enabled = true
  }

  tags = local.common_tags
}


### block public access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.www_bucket_n.id

  block_public_acls   = true
  block_public_policy = true
  restrict_public_buckets = true
  ignore_public_acls = true
}



