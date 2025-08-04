terraform {
  required_version = "~>1.12.0"

  cloud {
    organization = "acfaria-hashicorp"

    workspaces {
      name = "vault-dedicated"
    }
  }

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.109.0"
    }
  }
}