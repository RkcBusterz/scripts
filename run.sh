#!/bin/bash

echo "[*] Stopping Open vSwitch services..."
sudo systemctl stop openvswitch-switch
sudo systemctl disable openvswitch-switch

echo "[*] Purging Open vSwitch packages..."
sudo apt purge -y openvswitch-switch openvswitch-common openvswitch-datapath-dkms

echo "[*] Removing Open vSwitch residual files..."
sudo rm -rf /etc/openvswitch /var/run/openvswitch /var/log/openvswitch

echo "[*] Autoremoving unused dependencies..."
sudo apt autoremove --purge -y

echo "[✔] Open vSwitch completely removed from your system."
