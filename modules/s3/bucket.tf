### it will create S3 bucket with private acl  

resource "aws_s3_bucket" "first_bucket" {
  bucket = "static-website-nurkyz"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
    }
  versioning {                             ### versioning will be enabled
      enabled    = true
    }
  server_side_encryption_configuration {    ### default SSE will be enabled
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.my_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

### all public acces on S3 bucket will be blocked

resource "aws_s3_bucket_public_access_block" "bucket_n" {
  bucket = aws_s3_bucket.first_bucket.id

  block_public_acls   = true
  block_public_policy = true
  restrict_public_buckets =true
  ignore_public_acls      = true
}

### this key will be used to encrypt bucket objects
resource "aws_kms_key" "my_key" {
  deletion_window_in_days = 8
}