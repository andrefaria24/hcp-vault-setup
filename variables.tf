variable "HCP_CLIENT_ID" {
    type = string
    sensitive = true
}

variable "HCP_CLIENT_SECRET" {
    type = string
    sensitive = true
}

variable "HCP_HVN_ID" {
    type = string
}

variable HCP_VAULT_CLUSTER_ID {
    type = string
}

variable "HCP_VAULT_CLUSTER_TIER" {
  type    = string

  validation {
    condition     = contains(["dev", "starter_small", "standard_small", "plus_small"], var.HCP_VAULT_CLUSTER_TIER)
    error_message = "The tier must be dev, starter_small, standard_small, or plus_small."
  }
}

variable "HCP_VAULT_CLUSTER_PROXY_ENDPOINT"  {
  type    = string

  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.HCP_VAULT_CLUSTER_PROXY_ENDPOINT)
    error_message = "The Cluster Proxy Endpoint value must be either ENABLED or DISABLED"
  }
}

variable "HCP_VAULT_CLUSTER_PUBLIC_ENDPOINT" {
  type    = bool

  validation {
    condition     = contains([true, false], var.HCP_VAULT_CLUSTER_PUBLIC_ENDPOINT)
    error_message = "The Cluster Public Endpoint value must be either true or false"
  }
}

variable "ALLOWED_IP" {
  type = string
}