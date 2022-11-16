listener "tcp" {
    address = "0.0.0.0:8200"
    cluster_address = "0.0.0.0:8201"
    tls_disable = 1
}
  
storage "raft" {
    path = "/opt/vault/data"
    node_id = "v0"
    retry_join = {
        leader_api_addr = "http://v1:8202"
    }
    retry_join = {
        leader_api_addr = "http://v2:8204"
    }
}

api_addr = "http://v0:8200"
cluster_addr = "http://v0:8201"
cluster_name = "v-cluster"
ui = true
log_level = "info"
raw_storage_endpoint = true
license_path = "/etc/vault.d/license.hclic"