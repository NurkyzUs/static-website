### it will create S3 bucket with public-read acl 

resource "aws_s3_bucket" "www_bucket_n" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"

  ### to make this bucket publicly readable we need to generate "bucket policy"

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



