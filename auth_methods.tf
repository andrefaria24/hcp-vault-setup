# Enable userpass authentication method
resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  description = "Enable userpass authentication managed by Terraform"
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