vault {
  address = "http://192.168.211.11:8218"
}

auto_auth {
    method {
        type      = "approle"
        config = {
            role_id_file_path = "/vault/role"
            secret_id_file_path = "/vault/secret"
            remove_secret_id_file_after_reading = false
        }
    }

    sink {
        type = "file"
        config = {
            path = "vault/sink.txt"
        }
    }
  }

template_config {
    exit_on_retry_failure = true
    static_secret_render_interval = "10m"
}

template {
    contents = "{{ with secret \"kv/max\" }}{{ .Data.pass }}{{ end }}"
    destination = "/vault/destination"
}