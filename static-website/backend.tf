terraform {
  backend "s3" {
    bucket = "static-web-nurkyz"
    key    = "static-web/terraform.tfsate"
    region = "us-east-1"
  }
}