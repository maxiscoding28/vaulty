# Vaulty

## Overview
Vaulty is my attempt to create an easily configurable environment for reproducing common issues encountered in the course of me working support tickets for Hashicorp vault.

The repo makes use of the [official Vault Enterprise Docker image](https://hub.docker.com/r/hashicorp/vault-enterprise) and [docker-compose](https://docs.docker.com/compose/) to create 3 three-node vault clusters using integrated storage backends.

## Getting Started
### Creating the Network
For Vaulty to work, you must first have Docker installed and a network created using the following command:
```
docker network create vaulty-net --subnet 192.168.211.0/24
```
### Startng the Nodes
Each node is running on a separate port that is exposed on the host machine. Therefore each node can be accessed individually by updating the `VAULT_ADDR` on the host machine. This is useful for inspecting individual nodes during repro scenarios. You can start each cluster by executing the `./start-cluster.sh` script from within the clusters directory in the project repo.

The `./start-cluster` script will attempt to initialize, unseal and join the 3 nodes. If you don't want the script to attempt these actions you can pass the `ni` argument to the script ("no init"): `./start-cluster ni`.

Optionally, to make troubleshooting easier, I added the following lines to my `.zshrc` file to make each node in the 3 clusters directly addressable:
```
## v
alias v0='VAULT_ADDR=http://127.0.0.1:8200 vault'
alias v1='VAULT_ADDR=http://127.0.0.1:8202 vault'
alias v2='VAULT_ADDR=http://127.0.0.1:8204 vault'

## dr
alias dr0='VAULT_ADDR=http://127.0.0.1:8206 vault'
alias dr1='VAULT_ADDR=http://127.0.0.1:8208 vault'
alias dr2='VAULT_ADDR=http://127.0.0.1:8210 vault'

## pr
alias pr0='VAULT_ADDR=http://127.0.0.1:8212 vault'
alias pr1='VAULT_ADDR=http://127.0.0.1:8214 vault'
alias pr2='VAULT_ADDR=http://127.0.0.1:8216 vault'
```
#### v - (primary cluster)
| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| v0   | 8200 | 192.168.211.2 |
| v1   | 8202 | 192.168.211.3 |
| v2   | 8204 | 192.168.211.4 |

#### dr - secondary cluster (can be used for setting up disaster recovery)
| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| dr0   | 8206 | 192.168.211.5 |
| dr1   | 8208 | 192.168.211.6 |
| dr2   | 8210 | 192.168.211.7 |

#### pr - secondary cluster (can be used for setting up performance replication)
| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| pr0   | 8212 | 192.168.211.8 |
| pr1   | 8214 | 192.168.211.9 |
| pr2   | 8216 | 192.168.211.10 |

### Note on Versioning
By default the `:latest` tag of the vault-enterprise docker image is used. To run the cluster with a different [tagged version](https://hub.docker.com/r/hashicorp/vault-enterprise/tags) you can pass it as an environment variable in the command e.g.
```
 VERSION=1.11-ent ./start-cluster.sh
```

### Enabling a File Audit Device
[A file based audit device](https://developer.hashicorp.com/vault/docs/audit/file) can be enabled by writing to `vault audit enable file file_path=/vault/logs/vault.log`. This is a volume defined in the docker-compose.yml and the file can be inspected on your local machine at the `./logs/vault.log` path in the cluster directory.
 
## Provider (work in progress)
[View Readme](./v/provider/readme.md)

## Integrations (work in progress)
### LDAP - https://hub.docker.com/r/bitnami/openldap/

### Mysql - A Mysql container for DB secrets engine
[View Readme](./integrations/mysql/readme.md)

### Agent - A Vault Agent
[View Readme](./integrations/agent/readme.md)

### Prometheus/Grafana - Telemtry Monitoring
[View Readme](./integrations/prometheus-grafana-monitoring/readme.md)

### Fluentd - For pushing to a local splunk instance
[View Readme](./integrations/fluentd-splunk/readme.md)
