## Agent

By default the agent is pointed to IP of the node in the [single node cluster](../single-node) `address = "http://192.168.211.11:8218"`. You can change this  from the agent's [config.hcl](./config.hcl) file.

Create a policy for the agent:
`vault write policy agent`
```
path "*"
{
  capabilities = ["read"]
}
```

Create an approle
```
<!-- Run from a shell in the vault environment -->
vault write auth/approle/role/agent policies=agent
```
Retrieve appRole role-id and add to [role](./role) file
```
 vault read auth/approle/role/agent/role-id
```

Retrieve appRole secret-id and add to [role](./secret) file
```
vault write -f auth/approle/role/agent/secret-id
```

Create a kv value to be rendered in the template ([defined in the config](./config.hcl)).
```
vault kv put kv/max pass=1234
```

Start the vault agent
```
./start-agent.sh
```

Shell into the vault agent and confirm that the secret is rendered at the location defined in the config.
```
cat /vault/destination
```


| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| agent   | 8220 | 192.168.211.13 |