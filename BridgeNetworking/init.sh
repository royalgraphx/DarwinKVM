#!/bin/bash

echo -e "\e[31mDEBUG:\e[0m Welcome to DKVM Bridge Networking..."
echo -e "\e[31mDEBUG:\e[0m THIS IS A DEBUG BUILD, DO NOT USE IN PROD..."
echo -e "\e[31mDEBUG:\e[0m Verbose enabled, displaying VARS..."

echo -e "\e[31mDEBUG:\e[0m Checking Wi-Fi status..."
# Check if Wi-Fi is connected
wifi_status=$(iw dev | awk '$1=="Interface"{print $2}') # Will return the interface name if Wi-Fi is connected
echo -e "\e[31mDEBUG:\e[0m Variable wifi_status reports: $wifi_status..."
if [[ -n $wifi_status ]]; then
    echo "Wi-Fi connection detected. This script is intended to be used only when Ethernet is actively used and Wi-Fi is not active. Exiting..."
    exit 1
fi

echo -e "\e[31mDEBUG:\e[0m Wi-Fi not detected..."
echo -e "\e[31mDEBUG:\e[0m Checking Ethernet status..."

# Check if Ethernet is connected
ethernet_interface=$(ip link show | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}' | tr -d '[:space:]') # Will return interface name if Ethernet is connected
echo -e "\e[31mDEBUG:\e[0m Variable ethernet_interface reports: $ethernet_interface ..."

if [[ -z $ethernet_interface ]]; then
    echo "No active Ethernet connection detected. Exiting..."
    exit 1
fi

echo "Ethernet connection detected, and no Wi-Fi connection is active. Proceeding with the script..."

# Rest of the script...

echo "This script will detect any running network managers and disable them."
echo "Please make sure you understand the alternative network management solution being created before continuing."

read -p "Do you want to proceed? (y/n): " answer

if [[ $answer == "y" || $answer == "Y" ]]; then
    echo -e "\e[31mDEBUG:\e[0m User agreed..."

    # Shut down the Ethernet interface
    echo "Shutting down Ethernet interface: $ethernet_interface"
    sudo ip link set $ethernet_interface down

    # Check if the Ethernet interface has an IP assigned
    ip_address=$(ip -o -4 addr show dev "$ethernet_interface" | awk '{print $4}')
    echo -e "\e[31mDEBUG:\e[0m Variable ip_address reports: $ip_address ..."

    if [[ -n $ip_address ]]; then
        echo "The Ethernet interface ($ethernet_interface) has an IP address ($ip_address) assigned."

        read -p "Do you want to remove the IP address? (y/n): " remove_ip_answer

        if [[ $remove_ip_answer == "y" || $remove_ip_answer == "Y" ]]; then
            # Remove the IP address from the Ethernet interface
            sudo ip addr del $ip_address dev $ethernet_interface
            echo "The IP address has been removed from the Ethernet interface."
        else
            echo "Please make sure to remove the IP address before proceeding."
            exit 1
        fi
    else
        echo "The Ethernet interface ($ethernet_interface) does not have an IP address assigned."
    fi

    # Check and stop NetworkManager if running
    network_manager_status=$(systemctl is-active NetworkManager)

    if [[ $network_manager_status == "active" ]]; then
        echo "Stopping NetworkManager..."
        sudo systemctl stop NetworkManager
        echo "NetworkManager has been stopped."

        echo "Disabling NetworkManager..."
        sudo systemctl disable NetworkManager
        echo "NetworkManager has been disabled."
    else
        echo "NetworkManager is already stopped."
    fi

    # Check and stop systemd-networkd if running
    systemd_networkd_status=$(systemctl is-active systemd-networkd)

    if [[ $systemd_networkd_status == "active" ]]; then
        echo "Stopping systemd-networkd..."
        sudo systemctl stop systemd-networkd
        echo "systemd-networkd has been stopped."

        echo "Disabling systemd-networkd..."
        sudo systemctl disable systemd-networkd
        echo "systemd-networkd has been disabled."
    else
        echo "systemd-networkd is already stopped."
    fi

    # Check /etc/systemd/network folder for existing files
    config_folder="/etc/systemd/network"
    backup_folder="$HOME/systemd-preBridgebackup"
    mkdir -p "$backup_folder"

    if [[ -n $(ls -A "$config_folder") ]]; then
        echo "Backing up existing configuration files..."

        # Move files to the backup folder
        sudo mv "$config_folder"/* "$backup_folder/"

        echo "Existing configuration files have been backed up to: $backup_folder"
    else
        echo "No current configurations found."
    fi

    # Copy new files to the config folder
    script_folder=$(dirname "$0")
    sudo cp "$script_folder/br.netdev" "$config_folder/"
    sudo cp "$script_folder/1-br0-bind.network" "$config_folder/"
    sudo cp "$script_folder/2-br0-dhcp.network" "$config_folder/"

    echo "New configuration files have been copied to: $config_folder"

    # Modify 1-br0-bind.network file if needed
    if [[ $ethernet_interface == en* ]]; then
        echo "Matching en* interface found!"
    else
        echo "Detected Ethernet interface: $ethernet_interface"
        sudo sed -i "s/en*/$ethernet_interface/" "$config_folder/1-br0-bind.network"
        echo "Updated interface name in 1-br0-bind.network to: $ethernet_interface"
    fi

    # Enable and start systemd-networkd
    echo "Enabling systemd-networkd..."
    sudo systemctl enable systemd-networkd
    echo "systemd-networkd has been enabled."

    echo "Starting systemd-networkd..."
    sudo systemctl start systemd-networkd
    echo "systemd-networkd has been started."

    # Check systemd-networkd logs
    echo "Checking systemd-networkd logs..."
    if journalctl -u systemd-networkd | grep -q "br0: DHCPv4 address"; then
        echo "br0 successfully acquired an IP address via DHCP."
    else
        echo "br0 failed to acquire a local IP via IPv4."
    fi

    # Check the route table
    echo "Verifying route table..."
    if route -n | grep -q '_gateway'; then
        echo "Route table is okay."
    else
        echo "Route table does not have a default gateway."

        read -p "Please enter your default gateway: " default_gateway

        # Add default gateway to the route table
        sudo route add default gw "$default_gateway"

        echo "Default gateway has been added to the route table."
    fi

    # Perform a ping on google.com
    echo "Performing ping test..."
    if ping -c 5 google.com >/dev/null; then
        echo "Ping test successful. Bridge is now Operational."
    else
        echo "Ping test failed. Bridge is Nonfunctional."
    fi

else
    echo "Script execution stopped. No changes have been made."
fi