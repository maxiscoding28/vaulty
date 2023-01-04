# +------+
# | KMIP |
# +------+
# resource "vault_kmip_secret_backend" "default" {
#   path                        = "kmip"
#   description                 = "Vault KMIP backend"
#   listen_addrs                = ["127.0.0.1:5696", "127.0.0.1:8080"]
#   tls_ca_key_type             = "rsa"
#   tls_ca_key_bits             = 4096
#   default_tls_client_key_type = "rsa"
#   default_tls_client_key_bits = 4096
#   default_tls_client_ttl      = 86400
# }