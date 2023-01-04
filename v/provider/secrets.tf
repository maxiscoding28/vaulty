# +----+
# | KV |
# +----+
resource "vault_mount" "kv1" {
  path        = "kv1"
  type        = "kv"
  options     = { version = "1" }
}

# +-------+
# | KV-v2 |
# +-------+
resource "vault_mount" "kv2" {
  path        = "kv2"
  type        = "kv"
  options     = { version = "2" }
}

# +-----+
# | PKI |
# +-----+
# resource "vault_mount" "pki" {
#   path                      = "%s"
#   type                      = "pki"
#   default_lease_ttl_seconds = 3600
#   max_lease_ttl_seconds     = 86400
# }

# AWS - use doormat boundary user

# TRANSIT