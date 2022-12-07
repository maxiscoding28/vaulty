resource "vault_auth_backend" "userpass" {
  path = "userpass"
  type = "userpass"
}

resource "vault_auth_backend" "approle" {
  path = "approle"
  type = "approle"
}

resource "vault_auth_backend" "cert" {
    path = "cert"
    type = "cert"
}

## Add Login MFA

## Add Github

## Add Okta

## Add K*s

## Add JWT

## Add AWS

## Add Azure

## Add Google Cloud

## Add LDAP