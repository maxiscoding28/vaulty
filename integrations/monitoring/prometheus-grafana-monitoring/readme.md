
# Prometheus-grafana

[Vault Documentation](https://developer.hashicorp.com/vault/tutorials/monitoring/monitor-telemetry-grafana-prometheus)
### Prometheus
Create a file within this directory called `vault prometheus token` (already added to the `.gitignore` file) and lace a root token (or token with sufficient priviligies to sys/metrics) into the file.

Navigate to localhost:9090 in your browser

### Grafana
Navigate to localhost:3000 in your browser
username/password is admin admin

| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| prometheus   | 8220 | 192.168.211.14 |
| grafana   | 8220 | 192.168.211.15 |