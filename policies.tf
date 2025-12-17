# Admin policy with full access
resource "vault_policy" "admin" {
  name   = "admin"
  policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

# Vault Radar policy
resource "vault_policy" "vault_radar" {
  name   = "vault_radar"
  policy = <<EOT
path "kvv2/data/*" {
  capabilities = ["create", "read", "update", "delete"]
}

path "kvv2/metadata/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kvv2/metadata/" {
  capabilities = ["list", "read"]
}

path "kvv2/undelete/*" {
  capabilities = ["update"]
}

path "kvv2/destroy/*" {
  capabilities = ["update"]
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}

path "auth/token/renew-self" {
  capabilities = ["update"]
}

path "auth/token/revoke-self" {
  capabilities = ["update"]
}

path "sys/internal/ui/namespaces" {
  capabilities = ["read"]
}

path "sys/internal/ui/namespaces/*" {
  capabilities = ["read"]
}
EOT
}