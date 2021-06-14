### it will create S3 bucket with public-read acl 

resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"

  ### to make this bucket publicly readable we need to generate "bucket_policy" in json format

  policy = file("s3_policy.json")

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

### all public acces on S3 bucket will be blocked

resource "aws_s3_bucket_public_access_block" "bucket_n" {
  bucket = aws_s3_bucket.www_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

