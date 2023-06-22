#!/bin/bash

# Detect the wlan interface
wifi_interface=$(ip link show | awk -F: '$0 ~ "wl"{print $2; exit}' | tr -d '[:space:]') 
echo -e "\e[31mDEBUG:\e[0m Variable wifi_interface reports: $wifi_interface ..."

# Detect the state of the wlan interface only if it was found
if [ -n "$wifi_interface" ]; then
    wifi_state=$(ip link show $wifi_interface | grep -oP '(?<=state )[A-Z]+' 2>/dev/null)
    echo -e "\e[31mDEBUG:\e[0m Variable wifi_state reports: $wifi_state ..."

    # If wifi interface state is UP, end the script
    if [ "$wifi_state" == "UP" ]; then
        echo "This script is not intended to be used with an active WiFi connection."
        exit 1
    fi

    # Notify that wifi was detected but not active
    if [ "$wifi_state" == "DOWN" ]; then
        echo "WiFi was detected but is not active."
    fi
fi

# Detect the ethernet interface
ethernet_interface=$(ip link show | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2; exit}' | tr -d '[:space:]') 
echo -e "\e[31mDEBUG:\e[0m Variable ethernet_interface reports: $ethernet_interface ..."

# Detect the state of the ethernet interface
ethernet_state=$(ip link show $ethernet_interface | grep -oP '(?<=state )[A-Z]+' 2>/dev/null)
echo -e "\e[31mDEBUG:\e[0m Variable ethernet_state reports: $ethernet_state ..."

# If ethernet state is DOWN, end the script
if [ "$ethernet_state" == "DOWN" ]; then
    echo "An active Ethernet connection is needed."
    exit 1
fi

# The expected functionality
if [ "$ethernet_state" == "UP" ] && ([ -z "$wifi_interface" ] || [ "$wifi_state" == "DOWN" ]); then
    echo "Ethernet connection is active, WiFi interface is down. All checks passed!"
fi


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

    # Check and stop systemd-networkd.socket if running
    systemd_networkd_socket_status=$(systemctl is-active systemd-networkd.socket)

    if [[ $systemd_networkd_socket_status == "active" ]]; then
        echo "Stopping systemd-networkd.socket..."
        sudo systemctl stop systemd-networkd.socket
        echo "systemd-networkd.socket has been stopped."
    else
        echo "systemd-networkd.socket is already stopped."
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

    # Check and start systemd-networkd.socket if stopped
    systemd_networkd_socket_status=$(systemctl is-active systemd-networkd.socket)

    if [[ $systemd_networkd_socket_status == "inactive" ]]; then
        echo "Starting systemd-networkd.socket..."
        sudo systemctl start systemd-networkd.socket
        echo "systemd-networkd.socket has been started."
    else
        echo "systemd-networkd.socket is already running."
    fi

    echo "Starting systemd-networkd..."
    sudo systemctl start systemd-networkd
    echo "systemd-networkd has been started."

    echo "Waiting on Bridge status..."
    sleep 10

    # Check systemd-networkd logs
    echo "Checking systemd-networkd logs..."
    if journalctl -u systemd-networkd | grep -q "br0: DHCPv4 address"; then
        echo "br0 successfully acquired an IP address via DHCP."
    else
        echo "br0 failed to acquire a local IP via IPv4."
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