data "aws_acm_certificate" "acm_domain" {
  domain    = var.domain_name
  types     = ["AMAZON_ISSUED"]
  key_types = ["RSA_2048"]
}