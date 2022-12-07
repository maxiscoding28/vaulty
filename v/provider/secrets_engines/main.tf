# ## Secrets Engines
# resource "vault_mount" "kvv1" {
#   path        = "kvv1"
#   type        = "kv"
#   options     = { version = "1" }
#   description = "KV Version 1 secret engine mount"
# }

# resource "vault_kv_secret" "secret" {
#   path = "${vault_mount.kvv1.path}/secret"
#   data_json = jsonencode(
#   {
#     zip = "zap",
#     foo = "bar"
#   }
#   )
# }

# resource "vault_mount" "kvv2" {
#   path        = "kvv2"
#   type        = "kv"
#   options     = { version = "2" }
#   description = "KV Version 2 secret engine mount"
# }

# resource "vault_kv_secret_backend_v2" "config" {
#   mount                = vault_mount.kvv2.path
#   max_versions         = 5
#   delete_version_after = 12600
#   cas_required         = true
# }

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

# resource "vault_mount" "transit" {
#   path                      = "transit"
#   type                      = "transit"
#   description               = "Example description"
#   default_lease_ttl_seconds = 3600
#   max_lease_ttl_seconds     = 86400
# }

# resource "vault_transit_secret_cache_config" "cfg" {
#   backend = vault_mount.transit.path
#   size    = 500
# }