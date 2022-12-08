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
data "vault_policy_document" "viewer-pd" {
  rule {
    path         = "*"
    capabilities = ["read"]
    description  = "View everything"
  }
}
resource "vault_policy" "viewer" {
  name   = "viewer"
  policy = data.vault_policy_document.viewer-pd.hcl
}

# DR Token Policy

## Sentinel Policy RGP/EGP
