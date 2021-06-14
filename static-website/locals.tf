locals {
  common_tags = {
    project = "static-web-project"
    owner   = "Nurkyz"
  }
  s3_origin_id = "www.${var.domain_name}"
}