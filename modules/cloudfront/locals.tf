locals {
    tags = {
        Name = "${var.env}-static-web"
        Environment = var.env
    }
}