# +-------------+
# | Kubernetes Auth Method  |
# +-------------+


# +------------+
# | Kubernetes Secrets Engine |
# +------------+
# resource "vault_kubernetes_secret_backend" "config" {
#   path                      = "kubernetes"
#   description               = "kubernetes secrets engine description"
#   default_lease_ttl_seconds = 43200
#   max_lease_ttl_seconds     = 86400
#   kubernetes_host           = "https://127.0.0.1:61233"
#   kubernetes_ca_cert        = file("/path/to/cert")
#   service_account_jwt       = file("/path/to/token")
#   disable_local_ca_jwt      = false
# }