terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.11.0"
    }
  }
}

provider "vault" {
  address = ""
  token = ""
}
