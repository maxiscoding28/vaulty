# Entity
resource "vault_identity_entity" "admin" {
  name      = "admin"
  policies  = ["admin"]
}
resource "vault_identity_entity" "viewer" {
  name      = "viewer"
  policies  = ["viewer"]
}