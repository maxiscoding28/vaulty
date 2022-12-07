## KV
resource "vault_mount" "kv1" {
  path        = "kv1"
  type        = "kv"
  options     = { version = "1" }
}

##KV-V2
resource "vault_mount" "kv2" {
  path        = "kv2"
  type        = "kv"
  options     = { version = "2" }
}


## Database
    # AWS
    # MySQL
    # PostgresQl
    # Mongo
    # Active Directory
    # Cubbyhole
    # Google Cloud
    # KMS
    # KMIP
    # Kubernetes
    # LDAP
    # PKI
