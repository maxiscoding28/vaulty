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
