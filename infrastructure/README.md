Infrastructure-as-Code
======================

We use Terraform for managing our infrastructure as code. Follow Cloudflare's
Terraform documentation to modify these files.

Refrain from storing anything sensitive in these files.

Some of our infrastructure is not yet manageable via code, e.g. the GitLab
configuration to serve our website cannot be tracked here, even though we point
our DNS records at GitLab's IP address.

