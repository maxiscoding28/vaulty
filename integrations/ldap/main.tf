# +------+
# | LDAP |
# +------+ 
# resource "vault_ldap_auth_backend" "ldap" {
#     path        = "ldap"
#     url         = "ldaps://dc-01.example.org"
#     userdn      = "OU=Users,OU=Accounts,DC=example,DC=org"
#     userattr    = "sAMAccountName"
#     upndomain   = "EXAMPLE.ORG"
#     discoverdn  = false
#     groupdn     = "OU=Groups,DC=example,DC=org"
#     groupfilter = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
# }
