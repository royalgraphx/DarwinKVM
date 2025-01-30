#!/bin/bash

#
# DarwinKVM project's Menu Script.
#
# Copyright (c) 2025 RoyalGraphX, Carnations Botanica
# BSD 3-Clause License, see LICENSE for more information.
#

# Script version
VERSION="0.0.1"

# Detect basic system details
SHELL_NAME=$(basename "$SHELL") # Get shell name
ARCH=$(uname -m) # Get system architecture
ROOT=$(pwd) # We'll need this to make ``cd``ing around works reliably

# Setup Submodule paths
DISKPROVISION="$ROOT/extras/DiskProvision"
DUDKFIRMWARE="$ROOT/extras/DUDK-Firmware"
DARWINFETCH="$ROOT/extras/DarwinFetch"
DARWINOCPKG="$ROOT/extras/DarwinOCPkg"

# List of submodules that are supposed to be available to DKVM right now
SUBMODULES=("$DISKPROVISION" "$DUDKFIRMWARE" "$DARWINFETCH" "$DARWINOCPKG")

# Determine amount of submodules that were found as valid paths
SUBMODULES_VALID=0 # Set the int as 0 as a setup
for path in "${SUBMODULES[@]}"; do # Iterate through submodules and check if they exist
    if [[ -d "$path" ]]; then
        ((SUBMODULES_VALID++))
    fi
done

# Detect OS
if [[ "$(uname)" == "Darwin" ]]; then
    OS_NAME="$(sw_vers -productName) $(sw_vers -productVersion)"
elif [[ -f /etc/os-release ]]; then
    OS_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    OS_NAME="Unknown OS (Support is not expected!)"
fi

# Define menu options
MENU_OPTIONS=(
    "Download/Update Submodules"
    "System Report"
    "Dump IOMMU Table"
    "Exit"
)

# Function to display the menu
show_menu() {
    clear
    echo "Welcome to DarwinKVM!"
    echo "Quickly and interactively run various commands and scripts."
    echo "Copyright (c) 2024 2025 RoyalGraphX, Carnations Botanica"
    echo "$SHELL_NAME $ARCH Pre-Release $VERSION for $OS_NAME"
    if [[ $SUBMODULES_VALID -gt 0 ]]; then
        echo "Valid submodules found: $SUBMODULES_VALID"
    else
        echo "No valid submodules found! Please select option 1 before continuing."
    fi
    echo ""
    echo "Main Menu:"

    # Loop through options dynamically, future proofing new options
    for i in "${!MENU_OPTIONS[@]}"; do
        echo "$((i + 1)). ${MENU_OPTIONS[i]}"
    done

    echo ""
    echo "Select an option (1-${#MENU_OPTIONS[@]})" 
}

# Function to ensure all submodules are setup and valid
setupsubmods() {
    clear
    echo "This option is still not available."
}

# Function to check the host status and report its current states
sysreport() {
    clear
    echo "This option is still not available."
}

# Function to dump IOMMU Table into groups and sort them neatly
iommu() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "IOMMU Table dumping is only supported on Linux hosts."
        return 1
    fi

    # Check if IOMMU is enabled by looking for relevant kernel messages
    if ! sudo dmesg | grep -E "iommu"; then
        echo "Warning: IOMMU does not appear to be enabled on this system."
        read -rp "Press Enter to continue anyway, or Ctrl+C to exit..."
    fi

    # Run the script using the detected shell
    "$SHELL_NAME" ./scripts/iommu.sh
}

# Main menu loop
while true; do
    show_menu
    read -r choice

    # Validate input
    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#MENU_OPTIONS[@]} )); then
        selected_option="${MENU_OPTIONS[choice-1]}"

        case "$selected_option" in
            "Download/Update Submodules")
                setupsubmods
                ;;
            "System Report")
                sysreport
                ;;
            "Dump IOMMU Table")
                iommu
                ;;
            "Exit")
                echo "Exiting...";
                exit 0
                ;;
        esac
    else
        echo "Invalid choice, please enter a number between 1 and ${#MENU_OPTIONS[@]}"
    fi

    echo ""
    read -rp "Press Enter to continue..."
done
