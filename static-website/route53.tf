resource "aws_route53_zone" "zone_id" {
  name = var.domain_name
  tags = local.common_tags
}

resource "aws_route53_record" "www_route53" {
  zone_id = aws_route53_zone.zone_id.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

// resource "aws_route53_record" "cert_validation" {
//   zone_id = aws_route53_zone.zone_id.zone_id
//   name    = var.domain_name
//   type    = "CNAME"

//   alias {
//       name = data.aws_acm_certificate.acm_domain.domain_name
//       zone_id = data.aws_acm_certificate.acm_domain.hosted_zone_id
//       evaluate_target_health = false
//   }
// }