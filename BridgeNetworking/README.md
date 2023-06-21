<p align="center">
  <img width="650" height="200" src="../Assets/HeaderBridgeNetworking.png">
</p>

<h1 align="center">DKVM Bridge Networking Submodule</h1>
<h4 align="center">Automates the creation of the Bridge interface for your DKVM.</h4>

## About

This tool automates the process of creating and setting up a Bridge interface for use with QEMU. It performs the following actions:

- Checks if an Ethernet interface is actively used and Wi-Fi is not active.
- Prompts the user for confirmation to proceed.
- Shuts down the Ethernet interface.
- Checks if the Ethernet interface has an IP address assigned and prompts the user to remove it if necessary
- Checks and stops the NetworkManager and systemd-networkd services if they are running
- Backs up existing configuration files in the /etc/systemd/network folder.
- Copies new configuration files (br.netdev, 1-br0-bind.network, and 2-br0-dhcp.network) to the /etc/systemd/network folder.
- Modifies the 1-br0-bind.network file to match the detected Ethernet interface name.
- Enables and starts the systemd-networkd service.
- Checks the logs of systemd-networkd to verify if the bridge successfully acquired an IP address via DHCP.
- Verifies the route table and adds a default gateway if it is missing.
- Performs a ping test to google.com to check network connectivity.

## Requirements

* Software/Packages:
  * sed
  * systemd
  * iproute2
  * NetworkManager

Example Arch-based dependency installation:</br>
``sudo pacman -S networkmanager systemd iproute2 sed``

## Usage

