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