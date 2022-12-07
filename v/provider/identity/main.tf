# ## Identity
# resource "vault_identity_entity" "test" {
#   name      = "tester1"
#   policies  = ["test"]
#   metadata  = {
#     foo = "bar"
#   }
# }
# resource "vault_identity_entity_alias" "test" {
#   name            = "user_1"
#   mount_accessor  = "token_1f2bd5"
#   canonical_id    = "49877D63-07AD-4B85-BDA8-B61626C477E8"
# }
# resource "vault_identity_group" "internal" {
#   name     = "internal"
#   type     = "internal"
#   policies = ["dev", "test"]

#   metadata = {
#     version = "2"
#   }
# }

# resource "vault_identity_group" "group" {
#   name     = "test"
#   type     = "external"
#   policies = ["test"]
# }


