#!/bin/bash

# === Configuration ===
INTERFACE="enp4s0"
STATIC_IP="103.193.88.134/24"
GATEWAY="103.193.88.1"
DNS1="8.8.8.8"
DNS2="1.1.1.1"
NETPLAN_FILE="/etc/netplan/50-cloud-init.yaml"

# === Write new netplan config ===
sudo tee $NETPLAN_FILE > /dev/null <<EOF
network:
  version: 2
  ethernets:
    $INTERFACE:
      dhcp4: no
      optional: true
      addresses:
        - $STATIC_IP
      routes:
        - to: 0.0.0.0/0
          via: $GATEWAY
      nameservers:
        addresses:
          - $DNS1
          - $DNS2
EOF

# === Apply netplan ===
echo "Applying netplan..."
sudo netplan apply && echo "✅ Netplan applied successfully." || echo "❌ Failed to apply netplan. Run: sudo netplan --debug apply"
