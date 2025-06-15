#!/bin/bash

echo "🔧 Stopping Open vSwitch services..."
sudo systemctl stop openvswitch-switch 2>/dev/null
sudo systemctl disable openvswitch-switch 2>/dev/null

echo "🧹 Purging Open vSwitch packages..."
sudo apt purge -y openvswitch-switch openvswitch-common openvswitch-datapath-dkms

echo "🧼 Autoremoving unused packages..."
sudo apt autoremove --purge -y

echo "🗑️ Removing Open vSwitch configuration and data files..."
sudo rm -rf /etc/openvswitch/
sudo rm -rf /var/log/openvswitch/
sudo rm -rf /var/run/openvswitch/
sudo rm -f /etc/netplan/ovs.yaml

echo "🔧 Removing any DKMS modules related to Open vSwitch..."
sudo dkms remove openvswitch/ --all 2>/dev/null

echo "✅ Done. You may want to reboot to fully clean up the system."
