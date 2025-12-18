# Enable KVv2
resource "vault_mount" "kvv2_engine" {
  path        = "kvv2"
  type        = "kv"
  description = "KV Version 2 secret engine mount managed by Terraform"

  options = {
    version = "2"
  }
}

# Enable LDAP secrets engine
resource "vault_mount" "ldap" {
  path        = "ldap"
  type        = "ldap"
  description = "LDAP secrets engine mount managed by Terraform"
}

# Enable Database secrets engine
resource "vault_mount" "database" {
  path        = "database"
  type        = "database"
  description = "Database secrets engine mount managed by Terraform"
}

# Enable PKI secrets engine
resource "vault_mount" "pki" {
  path        = "pki-lab-andrecfaria-com"
  type        = "pki"
  description = "PKI secret engine mount for lab.andrecfaria.com managed by Terraform"

  default_lease_ttl_seconds = 315360000 # 10 years
  max_lease_ttl_seconds     = 315360000 # 10 years
}