# +----------+
# | Userpass |
# +----------+
resource "vault_auth_backend" "userpass_auth" {
  path = "userpass"
  type = "userpass"
}
resource "vault_generic_endpoint" "userpass_auth_user_admin" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "admin"
}
EOT
}
resource "vault_auth_backend" "mfa_userpass_auth" {
  path = "mfa_userpass"
  type = "userpass"
}
resource "vault_generic_endpoint" "userpass_auth_user_mfa_admin" {
  depends_on           = [vault_auth_backend.mfa_userpass_auth]
  path                 = "auth/userpass/users/mfa_admin"

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "admin"
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
  backend        = vault_auth_backend.approle.path
  role_name      = "admin"
  token_policies = ["admin"]
}

# +-----------+
# | Login MFA |
# +-----------+
resource "vault_identity_mfa_duo" "mfa_duo" {
  api_hostname    = var.api_hostname
  secret_key      = var.secret_key
  integration_key = var.integration_key
}
resource "vault_identity_mfa_login_enforcement" "mfa_duo_enforce" {
  name = "default"
  mfa_method_ids = [
    vault_identity_mfa_duo.mfa_duo.method_id,
  ]
  auth_method_accessors = [
    vault_auth_backend.mfa_userpass_auth.accessor
  ]
}

# +------+
# | Okta |
# +------+ - disabled until VAULT-11854 is fixed
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

# +-----+
# | AWS |
# +-----+
# https://developer.hashicorp.com/vault/tutorials/cloud-ops/vault-auth-method-aws
resource "vault_auth_backend" "aws" {
  type = "aws"
  path = "aws"
}
resource "vault_aws_auth_backend_sts_role" "role" {
  backend    = vault_auth_backend.aws.path
  account_id = "1234567890"
  sts_role   = "arn:aws:iam::1234567890:role/my-role"
}

# +-----+
# | JWT |
# +-----+
# resource "vault_jwt_auth_backend" "example" {
#     description         = "Demonstration of the Terraform JWT auth backend"
#     path                = "jwt"
#     oidc_discovery_url  = "https://myco.auth0.com/"
#     bound_issuer        = "https://myco.auth0.com/"
# }

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

# +-------+
# | Azure |
# +-------+
# resource "vault_auth_backend" "example" {
#   type = "azure"
# }

# resource "vault_azure_auth_backend_config" "example" {
#   backend       = vault_auth_backend.example.path
#   tenant_id     = "11111111-2222-3333-4444-555555555555"
#   client_id     = "11111111-2222-3333-4444-555555555555"
#   client_secret = "01234567890123456789"
#   resource      = "https://vault.hashicorp.com"
# }

# +-----+
# | GCP |
# +-----+
# resource "vault_gcp_auth_backend" "gcp" { 
#   credentials  = file("vault-gcp-credentials.json")

#   custom_endpoint = {
#     api     = "www.googleapis.com"
#     iam     = "iam.googleapis.com"
#     crm     = "cloudresourcemanager.googleapis.com"
#     compute = "compute.googleapis.com"
#   }
# }

# +------------+
# | Kubernetes |
# +------------+
# resource "vault_auth_backend" "kubernetes" {
#   type = "kubernetes"
# }

# resource "vault_kubernetes_auth_backend_config" "example" {
#   backend                = vault_auth_backend.kubernetes.path
#   kubernetes_host        = "http://example.com:443"
#   kubernetes_ca_cert     = "-----BEGIN CERTIFICATE-----\nexample\n-----END CERTIFICATE-----"
#   token_reviewer_jwt     = "ZXhhbXBsZQo="
#   issuer                 = "api"
#   disable_iss_validation = "true"
# }

resource "vault_auth_backend" "cert" {
    path = "cert"
    type = "cert"
}