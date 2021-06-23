locals {
  common_tags = {
    project = "static-web-project"
    owner   = "Uslanb"
  }
  s3_origin_id = "www.${var.domain_name}"
}