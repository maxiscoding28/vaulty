data "vault_policy_document" "admin-pd" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo", "patch"]
    description  = "Access everything"
  }
}

resource "vault_policy" "admin" {
  name   = "admin"
  policy = data.vault_policy_document.admin-pd.hcl
}

# Viewer policy

## Namespace policy

## Sentinel Policy RGP/EgP
