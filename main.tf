# Define HCP network
data "hcp_hvn" "default_network" {
  hvn_id = var.HCP_HVN_ID
}

# Create HCP Vault Dedicated Cluster
resource "hcp_vault_cluster" "main" {
  cluster_id      = var.HCP_VAULT_CLUSTER_ID
  hvn_id          = data.hcp_hvn.default_network.hvn_id
  tier            = var.HCP_VAULT_CLUSTER_TIER
  proxy_endpoint  = var.HCP_VAULT_CLUSTER_PROXY_ENDPOINT
  public_endpoint = var.HCP_VAULT_CLUSTER_PUBLIC_ENDPOINT

  ip_allowlist {
    address = var.ALLOWED_IP
  }
}