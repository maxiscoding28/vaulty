# Entity
resource "vault_identity_entity" "admin" {
  name      = "admin"
  policies  = [""]
  metadata  = {
    foo = "bar"
  }
}
# Entity Alias
# Group 
# Group Alias
# OIDC provider