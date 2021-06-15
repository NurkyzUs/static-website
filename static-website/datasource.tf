data "aws_acm_certificate" "acm_domain" {
  domain    = "nurkyz.info"
  types     = ["AMAZON_ISSUED"]
  key_types = ["RSA_2048"]
}