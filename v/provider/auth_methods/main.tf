# resource "vault_auth_backend" "cert" {
#     path = "cert"
#     type = "cert"
# }

# resource "vault_auth_backend" "approle" {
#   path = "approle"
#   type = "approle"
# }

# ## MFA
# resource "vault_identity_mfa_duo" "example" {
#   api_hostname    = "api-xxxxxxxx.duosecurity.com"
#   secret_key      = "secret-key"
#   integration_key = "secret-int-key"
# }

# # Policies
# resource "vault_policy" "example" {
#   name = "dev-team"

#   policy = <<EOT
# path "secret/my_app" {
#   capabilities = ["update"]
# }
# EOT
# }

# data "vault_policy_document" "example" {
#   rule {
#     path         = "secret/*"
#     capabilities = ["create", "read", "update", "delete", "list"]
#     description  = "allow all on secrets"
#   }
# }