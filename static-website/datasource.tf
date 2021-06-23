data "aws_acm_certificate" "acm_domain" {
  domain    = var.domain_name
  types     = ["AMAZON_ISSUED"]
  key_types = ["RSA_2048"]
}

data "aws_route53_zone" "main" {
  name         = "nurkyz.info."
  private_zone = false
}