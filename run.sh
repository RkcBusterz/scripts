#!/bin/bash

# Write new static IP config to netplan
cat <<EOF | sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null
network:
  version: 2
  renderer: networkd
  ethernets:
    enp4s0:
      dhcp4: no
      optional: true
      addresses:
        - 103.193.88.134/24
      gateway4: 10.13.12.1
      nameservers:
        addresses:
          - 10.10.0.1
          - 8.8.8.8
EOF

# Apply the new config
sudo netplan apply

echo "✅ Static IP 103.193.88.134 set with gateway 10.13.12.1 and DNS 10.10.0.1, 8.8.8.8"
