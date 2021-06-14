resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.www_bucket.website_endpoint
    origin_id   = local.s3_origin_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  enabled = true
  default_root_object = "index.html"
  aliases = ["www.${var.domain_name}"]

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
    compress = true
    min_ttl                = 18000
    max_ttl = 15768000
 }
 restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }
  viewer_certificate {
    acm_certificate_arn      = data.aws_acm_certificate.acm_domain.arn
    ssl_support_method       = "sni-only"
  }
}
