output "vault_cluster_uri" {
  value = hcp_vault_cluster.main.vault_public_endpoint_url
}

output "vault_cluster_id" {
  value = hcp_vault_cluster.main.cluster_id
}

output "vault_namespace" {
  value = hcp_vault_cluster.main.namespace
}

output "vault_region" {
  value = hcp_vault_cluster.main.region
}

output "vault_version" {
  value = hcp_vault_cluster.main.vault_version
}

output "vault_org_id" {
  value = hcp_vault_cluster.main.organization_id
}