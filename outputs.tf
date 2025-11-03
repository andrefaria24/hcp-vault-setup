output "vault_cluster_uri" {
  value = hcp_vault_cluster.main.vault_public_endpoint_url
}

output "vault_cluster_id" {
  value = hcp_vault_cluster.main.cluster_id
}