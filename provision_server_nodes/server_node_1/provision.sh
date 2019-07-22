#!/usr/bin/env bash

cat << EOF > /etc/consul.d/server_node_1_config.json
{
 "bind_addr": "172.20.20.11",
 "datacenter": "dc1",
 "data_dir": "/opt/consul",
 "log_level": "INFO",
 "enable_syslog": true,
 "enable_debug": true,
 "node_name": "consul-server-one",
 "server": true,
 "client_addr": "0.0.0.0",
 "bootstrap_expect": 3,
 "rejoin_after_leave": true,
 "ui": true,
 "retry_join": [
    "172.20.20.12","172.20.20.13"
    ]
}
EOF

# Consul should own its configuration files
chown --recursive consul:consul /etc/consul.d

# Starting consul
sudo systemctl start consul



