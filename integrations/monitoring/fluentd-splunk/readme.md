## Fluentd-splunk

A fluentd image configured to push vault operational logs to a local installation of splunk (via [splunk-hec](https://github.com/splunk/fluent-plugin-splunk-hec)) as well as the syslog for the fluentd container.

TODO: Add audit logs

Test Splunk HEC connection with:
```
curl -k http://host.docker.internal:8088/services/collector -H 'Authorization: Splunk <SPLUNK_TOKEN>' -d '{"index":"vault-audit", "event":"cry"}'
```

[Single-node](../single-node/docker-compose.yml) is currently set up to push logs to this container. You can add logs from any container by adding the following block in the docker-compose.yml file for the component.
```
    logging:
        driver: 'fluentd'
        options:
        fluentd-address: 192.168.211.16:24224
        tag: '{{.Name}}'
```


| Node | Port | Internal IP   |
| ---- | ---- | ------------- |
| splunk   | 8220 | 192.168.211.14 |
