# Enable userpass authentication method
resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  description = "Enable userpass authentication managed by Terraform"

  tune {
    default_lease_ttl = "8h"
    max_lease_ttl     = "24h"
  }
}

# Create a user with admin policy assigned
resource "vault_generic_endpoint" "acfaria_user" {
  depends_on = [vault_auth_backend.userpass, vault_policy.admin]
  path       = "auth/userpass/users/${var.VAULT_USERPASS_USERNAME}"
  data_json = jsonencode({
    password = var.VAULT_USERPASS_PASSWORD
    policies = ["${resource.vault_policy.admin.name}"]
  })
}

# Enable AppRole authentication method
resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = "approle"
  description = "Enable AppRole authentication managed by Terraform"
}

# Vault Radar AppRole role
resource "vault_approle_auth_backend_role" "vault_radar" {
  backend        = vault_auth_backend.approle.path
  role_name      = "vault-radar"
  token_policies = [vault_policy.vault_radar.name]
  token_ttl      = 28800 # 8 hours
  token_max_ttl  = 86400 # 24 hours
  bind_secret_id = true
  token_num_uses = 0
  depends_on     = [vault_auth_backend.approle]
}