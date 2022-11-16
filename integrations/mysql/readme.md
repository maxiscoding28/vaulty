## Mysql
This datbase is automatically seeeded with data from [seed.sql](./seed.sql).

### Login to the Mysql shell
`mysql -h 127.0.0.1 -u root -proot`
### Create a user in Mysql shell directly (for testing)
```
CREATE USER 'cat-lover'@'%' IDENTIFIED BY 'password';GRANT SELECT ON Animals.Cats to 'cat-lover'@'%';
```
```
CREATE USER 'dog-lover'@'%' IDENTIFIED BY 'password';GRANT SELECT ON Animals.Dogs to 'dog-lover'@'%';
```
### Create Vault config for database secrets engine with mysql-database-plugin
```
<!-- Run from a shell in the vault environment -->
vault write database/config/mysql \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(192.168.211.12:3306)/" \
    allowed_roles="cat-lover,dog-lover" \
    username="root" \
    password="root"
```
### Create roles
```
<!-- Cat lover -->
vault write database/roles/cat-lover \
    db_name=mysql \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON Animals.Cats TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"

<!-- Dog lover -->
vault write database/roles/cat-lover \
    db_name=mysql \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON Animals.Dogs TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"
Success! Data written to: database/roles/my-role

```
### Creation Statements for Vault (used in the role creation requests above)

```
"CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON Animals.Cats TO '{{name}}'@'%';"
```

```
"CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON Animals.Dogs TO '{{name}}'@'%';"
```


| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| mysql   | 3306 | 192.168.211.12 |