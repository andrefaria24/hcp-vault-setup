# Create Root Certificate Authority for lab.andrecfaria.com
# resource "vault_pki_secret_backend_root_cert" "root" {
#   backend = vault_mount.pki.path

#   type        = "internal"
#   common_name = "lab.andrecfaria.com Root CA"
#   ttl         = "87600h" # 10 years
#   issuer_name = "lab-andrecfaria-com-root"

#   key_type = "rsa"
#   key_bits = 4096
# }

# # These URLs are embedded in issued certificates. They must be reachable by clients
# resource "vault_pki_secret_backend_config_urls" "urls" {
#   backend = vault_mount.pki.path

#   issuing_certificates = [
#     "${hcp_vault_cluster.main.vault_public_endpoint_url}/v1/pki-lab-andrecfaria-com/ca",
#   ]

#   crl_distribution_points = [
#     "${hcp_vault_cluster.main.vault_public_endpoint_url}/v1/pki-lab-andrecfaria-com/crl",
#   ]
# }

# # Role for lab.andrecfaria.com issuance
# resource "vault_pki_secret_backend_role" "lab" {
#   backend = vault_mount.pki.path
#   name    = "lab-andrecfaria-com"

#   allow_localhost   = false
#   enforce_hostnames = true

#   # Permit lab.local + subdomains
#   allowed_domains  = ["lab.andrecfaria.com"]
#   allow_subdomains = true

#   # Permit issuing for the bare domain as CN (optional)
#   allow_bare_domains = true

#   # Allow non-DNS names
#   allow_ip_sans = true

#   # Leaf cert validity
#   ttl     = "87600h"
#   max_ttl = "87600h"

#   # Key settings for leaf certs
#   key_type = "rsa"
#   key_bits = 2048
# }