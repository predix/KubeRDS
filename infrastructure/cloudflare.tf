provider "cloudflare" {
  email = "gurjeet@singh.im"
  token = "${var.cloudflare_token}"
}

variable "cloudflare_token" {
  # Terraform will prompt for the token
}

variable "domains" {
  default = [ "krds.io", "kuberds.com", "kuberds.org", "kuberds.net", "kuberds.io" ]
}

variable "gitlab_pages_ipv4_address" {
  default = "35.185.44.232"
}

# Create a rool-level A record for each of the domains
resource "cloudflare_record" "root-level" {
  count   = 5 # This shoud match the number of elements in "domanins" variable
  domain  = "${element(var.domains, count.index)}"
  name    = "${element(var.domains, count.index)}"
  value   = "${var.gitlab_pages_ipv4_address}"
  type    = "A"
  proxied = true
}

# Create an A record for "www" for each of the domains
resource "cloudflare_record" "www" {
  count   = 5 # This shoud match the number of elements in "domanins" variable
  domain  = "${element(var.domains, count.index)}"
  name    = "www"
  value   = "${var.gitlab_pages_ipv4_address}"
  type    = "A"
  proxied = true
}

