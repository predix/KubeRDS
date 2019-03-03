provider "cloudflare" {
  email = "gurjeet@singh.im"
  token = "${var.cloudflare_token}"
}

variable "cloudflare_token" {
  # Terraform will prompt for the token
}

variable "domain" {
  default = "krds.io"
}

variable "gitlab_pages_ipv4_address" {
  default = "35.185.44.232"
}

resource "cloudflare_record" "root-level" {
  domain  = "${var.domain}"
  name    = "${var.domain}"
  value   = "${var.gitlab_pages_ipv4_address}"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "www" {
  domain  = "${var.domain}"
  name    = "www"
  value   = "${var.gitlab_pages_ipv4_address}"
  type    = "A"
  proxied = true
}

