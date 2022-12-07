# Userpass
resource "vault_auth_backend" "userpass" {
  path = "userpass"
  type = "userpass"
}

resource "vault_generic_endpoint" "admin-user" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"

  data_json = <<EOT
{
  "policies": ["admin"],
  "password": "admin"
}
EOT
}

# Approle
resource "vault_auth_backend" "approle" {
  path = "approle"
  type = "approle"
}

resource "vault_approle_auth_backend_role" "approle-admin-role" {
  backend        = vault_auth_backend.approle.path
  role_name      = "test-role"
  token_policies = ["admin"]
}

## Login MFA
resource "vault_identity_mfa_duo" "mfa_duo" {
  api_hostname    = var.api_hostname
  secret_key      = var.secret_key
  integration_key = var.integration_key
}

resource "vault_auth_backend" "cert" {
    path = "cert"
    type = "cert"
}

## Github






## Add Okta

## Add K*s

## Add JWT

## Add AWS

## Add Azure

## Add Google Cloud

## Add LDAP