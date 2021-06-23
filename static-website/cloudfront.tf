### create distribution for S3 bucket
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.www_bucket_n.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.main.cloudfront_access_identity_path
    }
  }


  enabled             = true
  default_root_object = "index.html"
  aliases             = ["${var.www_domain}", "${var.domain_name}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 18000
    default_ttl            = 18000
    max_ttl                = 15768000
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }

  ### SSL Certificate
  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.acm_domain.arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_cloudfront_origin_access_identity" "main" {
  comment = "terraform-access-identity-static-web"
}
