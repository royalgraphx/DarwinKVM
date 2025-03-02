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
PROPERTREE="$ROOT/extras/ProperTree"
GENSMBIOS="$ROOT/extras/GenSMBIOS"
RPSGPUPT="$ROOT/extras/single-gpu-passthrough"
AVFIO="$ROOT/extras/vfio-script"

# List of submodules that are supposed to be available to DKVM right now
SUBMODULES=("$DISKPROVISION" "$DUDKFIRMWARE" "$DARWINFETCH" "$DARWINOCPKG" "$PROPERTREE" "$GENSMBIOS" "$RPSGPUPT" "$AVFIO")

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
    "Import XML to Virt-Manager"
    "Launch DiskProvision"
    "Launch DarwinFetch"
    "Launch ProperTree"
    "Launch GenSMBIOS"
    "Install/Uninstall RisingPrism sGPU Scripts"
    "Install/Uninstall akshaycodes VFIO-Script"
    "Modify QEMU Hook Script"
    "List Passthrough Devices via lspci"
    "Overclock via cpupower command"
    "Create New Local Commit"
    "Push Local Changes to Github"
    "Exit"
)

# Function to display the menu
show_menu() {
    clear
    echo "Welcome to DarwinKVM!"
    echo "Quickly and interactively run various commands and scripts."
    echo "Copyright (c) 2024 2025 RoyalGraphX, Carnations Botanica"
    echo "$SHELL_NAME $ARCH Pre-Release $VERSION for $OS_NAME"
    if [[ $SUBMODULES_VALID -eq 0 ]]; then
        echo "No valid submodules found! Please select option 1 before continuing."
    elif [[ $SUBMODULES_VALID -ge 8 ]]; then
        echo "All $SUBMODULES_VALID submodules are valid and found!"
    else
        echo "Valid submodules found: $SUBMODULES_VALID (Some features may not work correctly.)"
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
    echo "Checking submodules..."
    
    # Ensure we are in a Git repository, and not a ZIP download
    if [[ ! -d .git ]]; then
        echo "Error: This is not a Git repository. Did you download as ZIP?"
        echo "Ensure you are using 'git clone' in your terminal to download DarwinKVM."
        return 1
    fi

    # Check if submodules are already initialized
    if [[ -f .gitmodules ]]; then
        echo "Updating submodules..."
        git submodule update --init --recursive
        
        if [[ $? -eq 0 ]]; then
            echo "Submodules updated successfully."
        else
            echo "Error: Failed to update submodules. Please check your Git setup."
            return 1
        fi
    else
        echo "No submodules found in .gitmodules. Creating the required submodules."
        
        # Add the currently required submodules
        git submodule add https://github.com/royalgraphx/DiskProvision.git extras/DiskProvision
        git submodule add https://github.com/royalgraphx/DUDK-Firmware.git extras/DUDK-Firmware
        git submodule add https://github.com/royalgraphx/DarwinFetch.git extras/DarwinFetch
        git submodule add https://github.com/royalgraphx/DarwinOCPkg.git extras/DarwinOCPkg
        git submodule add https://github.com/corpnewt/ProperTree.git extras/ProperTree
        git submodule add https://github.com/corpnewt/GenSMBIOS.git extras/GenSMBIOS
        git submodule add https://gitlab.com/risingprismtv/single-gpu-passthrough.git extras/single-gpu-passthrough
        git submodule add https://gitlab.com/akshaycodes/vfio-script.git extras/vfio-script
        
        # Initialize and update the repository/submodules
        git submodule update --init --recursive

        if [[ $? -eq 0 ]]; then
            echo "Submodules are now setup!"
        else
            echo "Error: Failed to initialize submodules. Please check your Git setup."
            return 1
        fi
    fi
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
    if ! sudo dmesg | grep -E "iommu"&> /dev/null; then
        echo "Warning: IOMMU does not appear to be enabled on this system."
        read -rp "Press Enter to continue anyway, or Ctrl+C to exit..."
    fi

    # Run the script using the detected shell
    "$SHELL_NAME" ./scripts/iommu.sh
}

# The DarwinKVM XML Importer
xmlimporter() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "Importing XMLs is only supported on Linux hosts."
        return 1
    fi

    XML_DIR="$ROOT/xmls"

    # Check if the directory exists
    if [[ ! -d "$XML_DIR" ]]; then
        echo "No XML directory found at $XML_DIR."
        return 1
    fi

    # Find all .xml files
    xml_files=()
    while IFS= read -r -d '' file; do
        xml_files+=("$file")
    done < <(find "$XML_DIR" -maxdepth 1 -type f -name "*.xml" -print0)

    # Check if any XML files were found
    if [[ ${#xml_files[@]} -eq 0 ]]; then
        echo "No XML files found in $XML_DIR."
        return 1
    fi

    echo "Available XML files:"
    for i in "${!xml_files[@]}"; do
        echo "$((i+1)). ${xml_files[$i]##*/}"  # Display filename only
    done

    # Prompt user for selection
    read -rp "Enter the number of the XML file to import: " choice

    # Validate input
    if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#xml_files[@]} )); then
        echo "Invalid selection. Returning to main menu..."
        return 1
    fi

    # Echo the chosen file
    selected_file="${xml_files[$((choice-1))]}"
    echo "You chose to import: $selected_file"

    # Extract the VM name from the XML using a portable approach
    if [[ "$(uname)" == "Darwin" ]]; then
        # For macOS, use sed to extract the name
        vm_name=$(sed -n 's/.*<name>\([^<]*\)<\/name>.*/\1/p' "$selected_file")
    else
        # For Linux, use grep and sed (same as before for Linux)
        vm_name=$(grep -o '<name>[^<]*</name>' "$selected_file" | sed 's/<[^>]*>//g')
    fi

    if [[ -z "$vm_name" ]]; then
        echo "No <name> tag found in the XML file."
        return 1
    fi

    echo "The VM name defined in the XML is: $vm_name"

    # Attempt to use virsh to check if the VM already exists
    if sudo virsh dumpxml "$vm_name" &>/dev/null; then
        echo "VM '$vm_name' already exists. Cannot import a duplicate XML."
        return 1
    else
        echo "VM '$vm_name' does not exist. You can import it if you choose to."
    fi

    # Prompt user to confirm import to virt-manager
    read -rp "Do you want to import this VM to virt-manager? (y/N): " user_input
    user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')  # Normalize to lowercase

    if [[ "$user_input" == "y" || "$user_input" == "yes" ]]; then
        # Import the XML to virt-manager using virsh define
        if sudo virsh --connect qemu:///system define "$selected_file"; then
            echo "VM '$vm_name' has been successfully imported to virt-manager."
        else
            echo "Failed to import VM '$vm_name'."
            return 1
        fi
    else
        echo "Import cancelled. Returning to main menu..."
    fi

}

# Function to bootstrap and launch DiskProvision
bootstrap_diskprovision() {
    clear
    echo "Bootstrapping DiskProvision..."

    # Try to locate Python (prefer python3, fallback to python)
    PYTHON_CMD=$(command -v python3 || command -v python)
    if [[ -z "$PYTHON_CMD" ]]; then
        echo "Error: Python is not installed. Please install Python to continue."
        return 1
    fi

    echo "Using Python from: $PYTHON_CMD"

    # Get the Python version
    PYTHON_VERSION=$("$PYTHON_CMD" --version 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to retrieve Python version."
        return 1
    fi

    echo "Python version: $PYTHON_VERSION"

    # Construct the DiskProvision root path using $ROOT
    DP_ROOT="$ROOT/extras/DiskProvision"
    if [[ ! -d "$DP_ROOT" ]]; then
        echo "Error: DiskProvision directory not found at $DP_ROOT"
        echo "Please ensure the DiskProvision submodule is downloaded."
        return 1
    fi
    echo "DiskProvision directory found at: $DP_ROOT"
    
    # Launch DiskProvision.sh in a new shell process and wait for it to exit
    echo "DiskProvision bootstrap complete! Now launching..."
    (
        cd "$DP_ROOT" || { echo "Error: Failed to change directory to $DP_ROOT."; exit 1; }
        # Execute the DiskProvision.sh script in a new shell
        exec "$SHELL_NAME" DiskProvision.sh
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: DiskProvision process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "DiskProvision process completed successfully."

}

# Function to bootstrap and launch DarwinFetch
bootstrap_darwinfetch() {
    clear
    echo "Bootstrapping DarwinFetch..."

    # Try to locate Python (prefer python3, fallback to python)
    PYTHON_CMD=$(command -v python3 || command -v python)
    if [[ -z "$PYTHON_CMD" ]]; then
        echo "Error: Python is not installed. Please install Python to continue."
        return 1
    fi

    echo "Using Python from: $PYTHON_CMD"

    # Get the Python version
    PYTHON_VERSION=$("$PYTHON_CMD" --version 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to retrieve Python version."
        return 1
    fi

    echo "Python version: $PYTHON_VERSION"

    # Construct the DarwinFetch root path using $ROOT
    DF_ROOT="$ROOT/extras/DarwinFetch"
    if [[ ! -d "$DF_ROOT" ]]; then
        echo "Error: DarwinFetch directory not found at $DF_ROOT."
        echo "Please ensure the DarwinFetch submodule is downloaded."
        return 1
    fi
    echo "DarwinFetch directory found at: $DF_ROOT"
    
    # Launch DarwinFetch.sh in a new shell process and wait for it to exit
    echo "DarwinFetch bootstrap complete! Now launching..."
    (
        cd "$DF_ROOT" || { echo "Error: Failed to change directory to $DF_ROOT."; exit 1; }
        # Execute the DarwinFetch.sh script in a new shell
        exec "$SHELL_NAME" DarwinFetch.sh
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: DarwinFetch process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "DarwinFetch process completed successfully."

}

# Function to bootstrap and launch ProperTree
bootstrap_propertree() {
    clear
    echo "Bootstrapping ProperTree..."

    # Try to locate Python (prefer python3, fallback to python)
    PYTHON_CMD=$(command -v python3 || command -v python)
    if [[ -z "$PYTHON_CMD" ]]; then
        echo "Error: Python is not installed. Please install Python to continue."
        return 1
    fi

    echo "Using Python from: $PYTHON_CMD"

    # Get the Python version
    PYTHON_VERSION=$("$PYTHON_CMD" --version 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to retrieve Python version."
        return 1
    fi

    echo "Python version: $PYTHON_VERSION"
    
    # Check for tkinter module
    echo "Checking for tkinter support..."
    "$PYTHON_CMD" -c "import tkinter" 2>/dev/null
    if [[ $? -ne 0 ]]; then
        echo "Error: tkinter module is not available in this Python installation."
        echo "Please install tkinter. For example:"
        echo "  On Ubuntu/Debian: sudo apt-get install python3-tk"
        echo "  On Arch Linux:   sudo pacman -S tk"
        return 1
    fi
    echo "tkinter module is available."

 # Construct the ProperTree root path using $ROOT
    PT_ROOT="$ROOT/extras/ProperTree"
    if [[ ! -d "$PT_ROOT" ]]; then
        echo "Error: ProperTree directory not found at $PT_ROOT."
        echo "Please ensure the ProperTree submodule is downloaded."
        return 1
    fi
    echo "ProperTree directory found at: $PT_ROOT"
    
    # Launch ProperTree.py and wait for it to exit
    echo "ProperTree bootstrap complete! Now launching..."
    (
        cd "$PT_ROOT" || { echo "Error: Failed to change directory to $PT_ROOT."; exit 1; }
        # Execute the ProperTree.py script
        exec $PYTHON_CMD ProperTree.py
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: ProperTree process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "ProperTree process completed successfully."

}

# Function to bootstrap and launch GenSMBIOS
bootstrap_gensmbios() {
    clear
    echo "Bootstrapping GenSMBIOS..."

    # Try to locate Python (prefer python3, fallback to python)
    PYTHON_CMD=$(command -v python3 || command -v python)
    if [[ -z "$PYTHON_CMD" ]]; then
        echo "Error: Python is not installed. Please install Python to continue."
        return 1
    fi

    echo "Using Python from: $PYTHON_CMD"

    # Get the Python version
    PYTHON_VERSION=$("$PYTHON_CMD" --version 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to retrieve Python version."
        return 1
    fi

    echo "Python version: $PYTHON_VERSION"

    # Construct the GenSMBIOS root path using $ROOT
    GSMB_ROOT="$ROOT/extras/GenSMBIOS"
    if [[ ! -d "$GSMB_ROOT" ]]; then
        echo "Error: GenSMBIOS directory not found at $GSMB_ROOT."
        echo "Please ensure the GenSMBIOS submodule is downloaded."
        return 1
    fi
    echo "GenSMBIOS directory found at: $GSMB_ROOT"
    
    # Launch GenSMBIOS.py and wait for it to exit
    echo "GenSMBIOS bootstrap complete! Now launching..."
    (
        cd "$GSMB_ROOT" || { echo "Error: Failed to change directory to $GSMB_ROOT."; exit 1; }
        # Execute the ProperTree.py script
        exec $PYTHON_CMD GenSMBIOS.py
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: GenSMBIOS process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "GenSMBIOS process completed successfully."

}

# Function to install/uninstall RisingPrism Single GPU passthrough
modify_rpsgpu() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "Installing RisingPrism GPU scripts is only supported on Linux hosts."
        return 1
    fi

    echo "Checking installation status of RisingPrism Single GPU passthrough..."
    echo ""

    # Construct the single-gpu-passthrough root path using $ROOT
    RPSGPUPT_ROOT="$ROOT/extras/single-gpu-passthrough"
    if [[ ! -d "$RPSGPUPT_ROOT" ]]; then
        echo "Error: single-gpu-passthrough directory not found at $RPSGPUPT_ROOT."
        echo "Please ensure the single-gpu-passthrough submodule is downloaded."
        return 1
    fi
    echo "single-gpu-passthrough directory found at: $RPSGPUPT_ROOT"

    REQUIRED_FILES=(
        "/etc/systemd/system/libvirt-nosleep@.service"
        "/usr/local/bin/vfio-startup"
        "/usr/local/bin/vfio-teardown"
        "/etc/libvirt/hooks/qemu"
    )

    ALL_FOUND=true

    for file in "${REQUIRED_FILES[@]}"; do
        if [[ -f "$file" ]]; then
            echo "Successfully Found: $file"
        else
            echo "Missing: $file"
            ALL_FOUND=false
        fi
    done

    echo ""
    if [[ "$ALL_FOUND" == true ]]; then
        echo "All files are present."
        echo "Routing to uninstallation process..."

        # List the required files that will be removed
        echo "The following files will be removed:"
        for file in "${REQUIRED_FILES[@]}"; do
            echo "  $file"
        done
        echo ""

        # Prompt the user for confirmation (default is No)
        read -rp "Are you sure you want to delete these files? (y/N): " confirmation
        # Convert response to lowercase for consistency
        confirmation=${confirmation,,}
        if [[ "$confirmation" == "y" || "$confirmation" == "yes" ]]; then
            echo "Removing files..."
            for file in "${REQUIRED_FILES[@]}"; do
                # Use sudo to remove each file or directory
                sudo rm -rf "$file"
                if [[ $? -eq 0 ]]; then
                    echo "Removed: $file"
                else
                    echo "Failed to remove: $file"
                    echo "Ensure you delete the file manually."
                fi
            done
            echo "Uninstallation process completed."
        else
            echo "Uninstallation cancelled."
        fi
    else
        echo "Routing to installation process..."
        
        # Launch install_hooks.sh in a new shell process and wait for it to exit
        (
            cd "$RPSGPUPT_ROOT" || { echo "Error: Failed to change directory to $RPSGPUPT_ROOT."; exit 1; }
            # Ensure the install_hooks.sh script is executable
            chmod +x install_hooks.sh
            # Execute the install_hooks.sh script in a new shell w sudo
            exec sudo "$SHELL_NAME" ./install_hooks.sh
        )
        EXIT_CODE=$?
        if [[ $EXIT_CODE -ne 0 ]]; then
            echo "Error: install_hooks.sh process exited with error code $EXIT_CODE."
            return $EXIT_CODE
        fi
            
        echo "Installation process completed."
    fi
}

# Function to install/uninstall akshaycodes VFIO-Script
modify_avfio() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "Installing akshaycodes VFIO script is only supported on Linux hosts."
        return 1
    fi

    echo "Checking installation status of akshaycodes VFIO-Script..."
    echo ""

    # Construct the vfio-script root path using $ROOT
    AVFIO_ROOT="$ROOT/extras/vfio-script"
    if [[ ! -d "$AVFIO_ROOT" ]]; then
        echo "Error: vfio-script directory not found at $AVFIO_ROOT."
        echo "Please ensure the vfio-script submodule is downloaded."
        return 1
    fi
    echo "vfio-script directory found at: $AVFIO_ROOT"

    REQUIRED_FILES=(
        "/etc/systemd/system/libvirt-nosleep@.service"
        "/etc/libvirt/hooks/qemu"
        "/bin/vfio-script.sh"
    )

    ALL_FOUND=true

    for file in "${REQUIRED_FILES[@]}"; do
        if [[ -f "$file" ]]; then
            echo "Successfully Found: $file"
        else
            echo "Missing: $file"
            ALL_FOUND=false
        fi
    done

    echo ""
    if [[ "$ALL_FOUND" == true ]]; then
        echo "All files are present."
        echo "Routing to uninstallation process..."

        # List the required files that will be removed
        echo "The following files will be removed:"
        for file in "${REQUIRED_FILES[@]}"; do
            echo "  $file"
        done
        echo ""

        # Prompt the user for confirmation (default is No)
        read -rp "Are you sure you want to delete these files? (y/N): " confirmation
        # Convert response to lowercase for consistency
        confirmation=${confirmation,,}
        if [[ "$confirmation" == "y" || "$confirmation" == "yes" ]]; then
            echo "Removing files..."
            for file in "${REQUIRED_FILES[@]}"; do
                # Use sudo to remove each file or directory
                sudo rm -rf "$file"
                if [[ $? -eq 0 ]]; then
                    echo "Removed: $file"
                else
                    echo "Failed to remove: $file"
                    echo "Ensure you delete the file manually."
                fi
            done
            echo "Uninstallation process completed."
        else
            echo "Uninstallation cancelled."
        fi
    else
        echo "Routing to installation process..."

        # Launch vfio_script_install.sh in a new shell process and wait for it to exit
        (
            cd "$AVFIO_ROOT" || { echo "Error: Failed to change directory to $AVFIO_ROOT."; exit 1; }
            # Ensure the vfio_script_install.sh script is executable
            chmod +x vfio_script_install.sh
            # Execute the vfio_script_install.sh script in a new shell with sudo
            exec sudo "$SHELL_NAME" ./vfio_script_install.sh
        )
        EXIT_CODE=$?
        if [[ $EXIT_CODE -ne 0 ]]; then
            echo "Error: vfio_script_install.sh process exited with error code $EXIT_CODE."
            return $EXIT_CODE
        fi

        echo "Installation process completed."
    fi
}

# Function that tries to use Nano, then Vim, finally Vi, to edit QEMU Hook script
modify_qemuhook() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "Modifying QEMU Hook script contents is only supported on Linux hosts."
        return 1
    fi

    echo "Attempting to open QEMU hook script for editing..."

    QEMU_HOOK_PATH="/etc/libvirt/hooks/qemu"

    # Ensure the QEMU hook file exists
    if [[ ! -f "$QEMU_HOOK_PATH" ]]; then
        echo "Error: $QEMU_HOOK_PATH does not exist."
        return 1
    fi

    # List of editors in priority order
    EDITORS=("nano" "vim" "vi")

    for editor in "${EDITORS[@]}"; do
        if command -v "$editor" &> /dev/null; then
            echo "Opening $QEMU_HOOK_PATH with $editor..."
            sudo "$editor" "$QEMU_HOOK_PATH"
            return $?  # Exit after successful edit
        fi
    done

    echo "Error: No suitable text editor (nano, vim, vi) found on the system."
    return 1

    echo "Opened and modified QEMU Hook script successfully."
}

# Function that isolates VGA/Audio devices from lspci output
list_pt_lspci() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "lspci dumping is only supported on Linux hosts."
        return 1
    fi
    
    echo "Listing VGA, Audio, and USB Controller devices from lspci output..."
    echo ""

    # Check if lspci is available
    if ! command -v lspci &> /dev/null; then
        echo "Error: lspci command not found. Please install pciutils."
        return 1
    fi

    # List VGA and Audio devices with relevant details
    lspci_output=$(lspci -nn | grep -Ei 'vga|3d|audio|usb')

    if [[ -z "$lspci_output" ]]; then
        echo "No VGA, Audio, or USB Controller devices found."
        return 1
    fi

    echo "$lspci_output"
    echo ""

}

# Function to call cpupower.sh from scripts
oc_cpu_cpupower() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "lspci dumping is only supported on Linux hosts."
        return 1
    fi

    # Construct the scripts root path using $ROOT
    SCRIPTS_ROOT="$ROOT/scripts"
    if [[ ! -d "$SCRIPTS_ROOT" ]]; then
        echo "Error: Scripts directory not found at $SCRIPTS_ROOT"
        echo "Please ensure the scripts folder exists."
        return 1
    fi
    echo "Scripts directory found at: $SCRIPTS_ROOT"
    
    # Launch cpupower.sh in a new shell process and wait for it to exit
    (
        cd "$SCRIPTS_ROOT" || { echo "Error: Failed to change directory to $SCRIPTS_ROOT."; exit 1; }
        # Execute the cpupower.sh script in a new shell
        exec "$SHELL_NAME" cpupower.sh
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: cpupower process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "cpupower process completed successfully."

}

# Function to call commit.sh from scripts
commit_changes() {
    clear

    # Construct the scripts root path using $ROOT
    SCRIPTS_ROOT="$ROOT/scripts"
    if [[ ! -d "$SCRIPTS_ROOT" ]]; then
        echo "Error: Scripts directory not found at $SCRIPTS_ROOT"
        echo "Please ensure the scripts folder exists."
        return 1
    fi
    echo "Scripts directory found at: $SCRIPTS_ROOT"
    
    # Launch commit.sh in a new shell process and wait for it to exit
    (
        cd "$SCRIPTS_ROOT" || { echo "Error: Failed to change directory to $SCRIPTS_ROOT."; exit 1; }
        # Execute the commit.sh script in a new shell
        exec "$SHELL_NAME" commit.sh
    )
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "Error: commit process exited with error code $EXIT_CODE."
        return $EXIT_CODE
    fi

    echo "commit process completed successfully."

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
            "Import XML to Virt-Manager")
                xmlimporter
                ;;
            "Launch DiskProvision")
                bootstrap_diskprovision
                ;;
            "Launch DarwinFetch")
                bootstrap_darwinfetch
                ;;
            "Launch ProperTree")
                bootstrap_propertree
                ;;
            "Launch GenSMBIOS")
                bootstrap_gensmbios
                ;;
            "Install/Uninstall RisingPrism sGPU Scripts")
                modify_rpsgpu
                ;;
            "Install/Uninstall akshaycodes VFIO-Script")
                modify_avfio
                ;;
            "Modify QEMU Hook Script")
                modify_qemuhook
                ;;
            "List Passthrough Devices via lspci")
                list_pt_lspci
                ;;
            "Overclock via cpupower command")
                oc_cpu_cpupower
                ;;
            "Create New Local Commit")
                commit_changes
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
