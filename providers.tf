provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}

provider "vault" {
  address   = hcp_vault_cluster.main.vault_public_endpoint_url
  namespace = hcp_vault_cluster.main.namespace
  token     = hcp_vault_cluster_admin_token.admin.token
}