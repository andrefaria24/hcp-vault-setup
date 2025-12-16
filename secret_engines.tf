# Enable KVv2
resource "vault_mount" "kvv2_engine" {
  path        = "kvv2"
  type        = "kv"
  description = "KV Version 2 secret engine mount managed by Terraform"

  options = {
    version = "2"
  }
}