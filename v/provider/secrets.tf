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


# +----------+
# | Database |
# +----------+
    # MySQL
    # PostgresQl
    # MongoDB
# resource "vault_database_secrets_mount" "db" {
#   path = "db"

#   mssql {
#     name           = "db1"
#     username       = "sa"
#     password       = "super_secret_1"
#     connection_url = "sqlserver://{{username}}:{{password}}@127.0.0.1:1433"
#     allowed_roles = [
#       "dev1",
#     ]
#   }

#   postgresql {
#     name              = "db2"
#     username          = "postgres"
#     password          = "super_secret_2"
#     connection_url    = "postgresql://{{username}}:{{password}}@127.0.0.1:5432/postgres"
#     verify_connection = true
#     allowed_roles = [
#       "dev2",
#     ]
#   }
# }

# resource "vault_database_secret_backend_role" "dev1" {
#   name    = "dev1"
#   backend = vault_database_secrets_mount.db.path
#   db_name = vault_database_secrets_mount.db.mssql[0].name
#   creation_statements = [
#     "CREATE LOGIN [{{name}}] WITH PASSWORD = '{{password}}';",
#     "CREATE USER [{{name}}] FOR LOGIN [{{name}}];",
#     "GRANT SELECT ON SCHEMA::dbo TO [{{name}}];",
#   ]
# }

# resource "vault_database_secret_backend_role" "dev2" {
#   name    = "dev2"
#   backend = vault_database_secrets_mount.db.path
#   db_name = vault_database_secrets_mount.db.postgresql[0].name
#   creation_statements = [
#     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
#     "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
#   ]
# }

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

# +------------+
# | Kubernetes |
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

