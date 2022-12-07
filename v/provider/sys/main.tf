terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.11.0"
    }
  }
}

# Auth Methods
provider "vault" {
  address = "http://127.0.0.1:8200"
  # Provider args
}


# Add Tuning