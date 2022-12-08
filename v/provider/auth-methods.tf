# +----------+
# | Userpass |
# +----------+
resource "vault_auth_backend" "userpass_auth" {
  path = "userpass"
  type = "userpass"
}
resource "vault_generic_endpoint" "userpass_auth_user_admin" {
  depends_on           = [vault_auth_backend.userpass_auth]
  path                 = "auth/userpass/users/admin"

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "admin"
}
EOT
}
resource "vault_generic_endpoint" "userpass_auth_user_viewer" {
  depends_on           = [vault_auth_backend.userpass_auth]
  path                 = "auth/userpass/users/viewer"

  data_json = <<EOT
{
  "policies": ["viewer"],
  "password": "viewer"
}
EOT
}
resource "vault_auth_backend" "mfa_userpass_auth" {
  path = "mfa_userpass"
  type = "userpass"
}
resource "vault_generic_endpoint" "mfa_userpass_auth_user_admin" {
  depends_on           = [vault_auth_backend.mfa_userpass_auth]
  path                 = "auth/userpass/users/mfa_admin"

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "admin"
}
EOT
}
resource "vault_generic_endpoint" "mfa_userpass_auth_user_viewer" {
  depends_on           = [vault_auth_backend.mfa_userpass_auth]
  path                 = "auth/userpass/users/mfa_viewer"

  data_json = <<EOT
{
  "policies": ["viewer"],
  "password": "viewer"
}
EOT
}

# +----------+
# | Approle |
# +----------+
resource "vault_auth_backend" "approle_auth" {
  path = "approle"
  type = "approle"
}
resource "vault_approle_auth_backend_role" "approle_auth_role_admin" {
  backend        = vault_auth_backend.approle_auth.path
  role_name      = "admin"
  token_policies = ["admin"]
}
resource "vault_approle_auth_backend_role" "approle_auth_role_viewer" {
  backend        = vault_auth_backend.approle_auth.path
  role_name      = "viewer"
  token_policies = ["viewer"]
}

# +-----------+
# | Login MFA |
# +-----------+
resource "vault_identity_mfa_duo" "mfa_duo_identity" {
  api_hostname    = var.api_hostname
  secret_key      = var.secret_key
  integration_key = var.integration_key
}
resource "vault_identity_mfa_login_enforcement" "mfa_duo_identity_enforcement" {
  name = "default"
  mfa_method_ids = [
    vault_identity_mfa_duo.mfa_duo_identity.method_id,
  ]
  auth_method_accessors = [
    vault_auth_backend.mfa_userpass_auth.accessor
  ]
}

# +------+
# | Okta |
# +------+ - Disabled until VAULT-11854 is fixed
# resource "vault_okta_auth_backend" "okta_auth" {
#     organization = var.okta_organization
#     token        = var.okta_token
# }

# +--------+
# | Github |
# +--------+
resource "vault_github_auth_backend" "github_auth" {
  organization = "maxypoo-org"
}
resource "vault_github_user" "github_auth_user" {
  backend  = vault_github_auth_backend.github_auth.id
  user     = "maxiscoding28"
  policies = ["admin"]
}

# +------+
# | LDAP |
# +------+ 
# resource "vault_ldap_auth_backend" "ldap" {
#     path        = "ldap"
#     url         = "ldaps://dc-01.example.org"
#     userdn      = "OU=Users,OU=Accounts,DC=example,DC=org"
#     userattr    = "sAMAccountName"
#     upndomain   = "EXAMPLE.ORG"
#     discoverdn  = false
#     groupdn     = "OU=Groups,DC=example,DC=org"
#     groupfilter = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
# }

# +-------------+
# | Kubernetes  |
# +-------------+

# +------+
# | JWT  |
# +------+

# +------+
# | Cert |
# +------+ 
resource "vault_auth_backend" "cert" {
    path = "cert"
    type = "cert"
}

