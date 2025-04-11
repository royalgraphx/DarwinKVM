#!/bin/bash

#
# DarwinKVM project's Main Menu Script.
#
# Copyright (c) 2025 RoyalGraphX
# Copyright (c) 2025 Carnations Botanica
# BSD 3-Clause License, see LICENSE for more information.
#
# No, you cannot use my EFI or XML configurations in your prebuilts or repackage any of the content here.
# All instances of related work, must point back to DarwinKVM if you use any information from here.
# See LICENSE for more information. This is your only warning.
#

# Script Variables
VERSION="0.1.2"
DEBUG=false
isInternalUser=false

l2c() {
    local mode="$1"
    shift
    local message="$1"

    case "$mode" in
        INTRNL)
            [[ "$isInternalUser" == true ]] && echo "[INTERNAL] $message"
            ;;
        DBG)
            [[ "$DEBUG" == true ]] && echo "[DEBUG] $message"
            ;;
    esac
}

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
    # Extract OS ID and PRETTY_NAME
    OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')
    OS_NAME_RAW=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

    # List of supported OSes
    SUPPORTED_OSES=("arch" "fedora" "debian" "linuxmint" "ubuntu")

    # Check if the detected OS is in the supported list
    OS_SUPPORTED=false
    for os in "${SUPPORTED_OSES[@]}"; do
        if [[ "$OS_ID" == "$os" ]]; then
            OS_SUPPORTED=true
            break
        fi
    done

    # Set OS_NAME accordingly
    if [[ "$OS_SUPPORTED" == true ]]; then
        OS_NAME="$OS_NAME_RAW"
    else
        OS_NAME="Unknown OS (Support cannot be expected!)"
    fi
else
    OS_NAME="Unknown OS (Support cannot be expected!)"
fi

# Construct the main menu

# Define public options
MENU_OPTIONS=(
    "Download/Update Submodules"
    "System Report"
    "Dump IOMMU Table"
    "Dynamic XML Configuration"
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
)

# Append carnationsinternal options if isInternalUser is true
if [[ "$isInternalUser" == true ]]; then
    MENU_OPTIONS+=(
        "Update Submodules for EUs (Rebase)"
        "Create New Local Commit"
        "Push Local Changes to Github"
    )
fi

# finally, add the Exit option
MENU_OPTIONS+=(
    "Exit"
)

# Function to display the menu
show_menu() {
    clear
    if [[ "$isInternalUser" == true && "$DEBUG" == true ]]; then
        echo "Welcome to DarwinKVM! [Internal User Options Enabled | Debug Mode Enabled]"
    elif [[ "$isInternalUser" == true ]]; then
        echo "Welcome to DarwinKVM! [Internal User Options Enabled]"
    elif [[ "$DEBUG" == true ]]; then
        echo "Welcome to DarwinKVM! [Debug Mode Enabled]"
    else
        echo "Welcome to DarwinKVM!"
    fi
    echo "Quickly and interactively run various commands and scripts."
    echo "Copyright (c) 2023 2024 2025 RoyalGraphX"
    echo "Copyright (c) 2025 Carnations Botanica"
    echo "$SHELL_NAME $ARCH Pre-Release $VERSION for $OS_NAME"
    if [[ $SUBMODULES_VALID -eq 0 ]]; then
        echo "No valid submodules found! Please select option 1 before continuing."
    elif [[ $SUBMODULES_VALID -ge 8 ]]; then
        echo "All $SUBMODULES_VALID submodules are valid and found!"
    else
        echo "Valid submodules found: $SUBMODULES_VALID (Some features may not work correctly.)"
    fi
    echo ""
    echo "WARNING: When it comes to automation, lots of options will use sudo!"
    echo "If this is something you do not feel comfortable with, do it manually."
    echo ""
    echo "Main Menu:"
    echo ""

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

# The DarwinKVM Dynamic XML Configurator
# Pulls host data to make unique XML like virt-man
dynamic_xml() {
    clear

    # Ensure the OS is Linux
    if [[ "$(uname)" != "Linux" ]]; then
        echo "Dynamic XML is only supported on Linux hosts."
        return 1
    fi

    # XML content collector
    XML_CONTENT=""

    # Create the comment header for the XML
    create_header() {
        XML_CONTENT+="<!--\n"
        XML_CONTENT+="    This virtual machine definition was created dynamically by DarwinKVM\n"
        XML_CONTENT+="    The model of this XML is set to: ${MODEL}\n"
        XML_CONTENT+="-->\n\n"
    }

    create_domain_wrapper() {
        XML_CONTENT+="<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>\n"
    }

    # Very simple branding, yknow.
    create_domain_details() {
        XML_CONTENT+="  <name>DarwinKVM-${MODEL_PRETTY}</name>\n"
        XML_CONTENT+="  <description>This virtual machine is a DarwinKVM ${MODEL} using ${GUESTCPU}.</description>\n"
        XML_CONTENT+="  <uuid>$(uuidgen)</uuid>\n"
    }

    # I need to actually test if memoryBacking will automatically place itself after import
    create_memory() {
        XML_CONTENT+="  <memory unit='KiB'>$RESERVED_MEMORY_KIB</memory>\n"
        XML_CONTENT+="  <currentMemory unit='KiB'>$RESERVED_MEMORY_KIB</currentMemory>\n"
        XML_CONTENT+="  <memoryBacking>\n"
        XML_CONTENT+="    <nosharepages/>\n"
        XML_CONTENT+="  </memoryBacking>\n"
    }

    create_vcpus() {
        XML_CONTENT+="  <vcpu placement='static'>$VCPUS</vcpu>\n"
    }

    create_os() {
        # Ensure MODEL_PRETTY is set based on MODEL
        if [[ "$MODEL" == "MacPro7,1" ]]; then
            MODEL_PRETTY="MP71"
        elif [[ "$MODEL" == "MacPro5,1" ]]; then
            MODEL_PRETTY="MP51"
        elif [[ "$MODEL" == "MacPro4,1" ]]; then
            MODEL_PRETTY="MP41"
        elif [[ "$MODEL" == "MacPro3,1" ]]; then
            MODEL_PRETTY="MP31"
        elif [[ "$MODEL" == "MacPro2,1" ]]; then
            MODEL_PRETTY="MP21"
        else
            MODEL_PRETTY="Unknown"
        fi

        # Check which OVMF files exist, prioritize .4m.fd over .fd
        if [[ -n "$OVMF_CODE" && -n "$OVMF_VARS" ]]; then
            # Determine which OVMF code and vars files to use based on what's found
            if [[ -f "$OVMF_CODE" && "$OVMF_CODE" =~ \.4m\.fd$ ]]; then
                CODE_FILE="$OVMF_CODE"
                EXTENSION="4m.fd"
            elif [[ -f "$OVMF_CODE" && "$OVMF_CODE" =~ \.fd$ ]]; then
                CODE_FILE="$OVMF_CODE"
                EXTENSION="fd"
            else
                l2c INTRNL "OVMF_CODE not found or not of correct format (.fd or .4m.fd)."
                return
            fi

            if [[ -f "$OVMF_VARS" && "$OVMF_VARS" =~ \.4m\.fd$ ]]; then
                VARS_FILE="$OVMF_VARS"
            elif [[ -f "$OVMF_VARS" && "$OVMF_VARS" =~ \.fd$ ]]; then
                VARS_FILE="$OVMF_VARS"
            else
                l2c INTRNL "OVMF_VARS not found or not of correct format (.fd or .4m.fd)."
                return
            fi

            # Generate the dynamic nvram file name based on MODEL_PRETTY
            NVRAM_FILE="/var/lib/libvirt/qemu/nvram/DarwinKVM_${MODEL_PRETTY}_VARS.${EXTENSION}"

            # Now build the XML
            XML_CONTENT+="  <os firmware='efi'>\n"
            XML_CONTENT+="    <type arch='x86_64' machine='q35'>hvm</type>\n"
            XML_CONTENT+="    <firmware>\n"
            XML_CONTENT+="      <feature enabled='no' name='enrolled-keys'/>\n"
            XML_CONTENT+="      <feature enabled='no' name='secure-boot'/>\n"
            XML_CONTENT+="    </firmware>\n"
            XML_CONTENT+="    <loader readonly='yes' type='pflash'>$CODE_FILE</loader>\n"
            XML_CONTENT+="    <nvram template='$VARS_FILE'>$NVRAM_FILE</nvram>\n"
            XML_CONTENT+="    <boot dev='hd'/>\n"
            XML_CONTENT+="    <bootmenu enable='yes'/>\n"
            XML_CONTENT+="  </os>\n"
        else
            l2c INTRNL "OVMF firmware files are missing, skipping the OS section. Check this out!!!"
        fi
    }

    get_cpu_info() {
        l2c INTRNL "Beginning CPU detection routine."

        # Try using lscpu first
        if command -v lscpu &> /dev/null; then
            CPU_NAME=$(lscpu | grep "Model name" | sed 's/Model name: *//')
            CPU_VENDOR=$(lscpu | grep "Vendor ID" | sed 's/Vendor ID: *//')
            CPU_PHYSICAL_CORES=$(lscpu | grep "^Core(s) per socket" | awk '{print $4}')
            CPU_THREADS_PER_CORE=$(lscpu | grep "Thread(s) per core" | awk '{print $4}')
            CPU_LOGICAL_CORES=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
        else
            # Fallback to /proc/cpuinfo
            CPU_NAME=$(grep -m 1 "model name" /proc/cpuinfo | sed 's/model name *: *//')
            CPU_VENDOR=$(grep -m 1 "vendor_id" /proc/cpuinfo | sed 's/vendor_id *: *//')
            CPU_PHYSICAL_CORES=$(grep "cpu cores" /proc/cpuinfo | awk -F': ' '{print $2}' | head -n1)
            CPU_THREADS_PER_CORE=$(( $(grep -c "^processor" /proc/cpuinfo) / CPU_PHYSICAL_CORES ))
            CPU_LOGICAL_CORES=$(grep -c "^processor" /proc/cpuinfo)
        fi

        l2c INTRNL "CPU Name: $CPU_NAME"
        l2c INTRNL "CPU Vendor: $CPU_VENDOR"
        l2c INTRNL "Physical Cores: $CPU_PHYSICAL_CORES"
        l2c INTRNL "Threads per Core: $CPU_THREADS_PER_CORE"
        l2c INTRNL "Logical Cores: $CPU_LOGICAL_CORES"

        # Determine reserved resources based on physical cores
        # XNU-compatible core/thread topology enforcement
        if [ "$CPU_PHYSICAL_CORES" -le 4 ]; then
            RESERVED_PHYSICAL_CORES=2  # 4 vCPUs (2 cores, 2 threads)
        elif [ "$CPU_PHYSICAL_CORES" -ge 8 ] && [ "$CPU_PHYSICAL_CORES" -lt 16 ]; then
            RESERVED_PHYSICAL_CORES=4  # 8 vCPUs (4 cores, 2 threads)
        elif [ "$CPU_PHYSICAL_CORES" -ge 16 ]; then
            RESERVED_PHYSICAL_CORES=8  # 16 vCPUs (8 cores, 2 threads)
        else
            # For CPUs with 5-7 cores, fallback to 2 cores, 2 threads
            RESERVED_PHYSICAL_CORES=2
        fi

        # Always reserve 2 threads
        RESERVED_THREADS=2

        # Calculate reserved logical cores (reserved physical cores * threads per core)
        RESERVED_LOGICAL_CORES=$(( RESERVED_PHYSICAL_CORES * CPU_THREADS_PER_CORE ))

        # Calculate vCPUs (reserved physical cores * reserved threads)
        VCPUS=$(( RESERVED_PHYSICAL_CORES * RESERVED_THREADS ))

        # Log the reserved resources
        l2c INTRNL "Reserved Physical Cores: $RESERVED_PHYSICAL_CORES"
        l2c INTRNL "Reserved Threads: $RESERVED_THREADS"
        l2c INTRNL "Reserved Logical Cores: $RESERVED_LOGICAL_CORES"
        l2c INTRNL "Reserved vCPUs: $VCPUS"

    }

    create_features() {
        XML_CONTENT+="  <features>\n"
        XML_CONTENT+="    <acpi/>\n"
        XML_CONTENT+="    <apic/>\n"
        XML_CONTENT+="  </features>\n"
    }

    create_cpu_features() {
        XML_CONTENT+="  <cpu mode='host-passthrough' check='none' migratable='on'>\n"
        XML_CONTENT+="    <topology sockets='1' dies='1' cores='$RESERVED_PHYSICAL_CORES' threads='$RESERVED_THREADS'/>\n"
        XML_CONTENT+="    <cache mode='passthrough'/>\n"
        
        # If the vendor is AuthenticAMD, add the topoext feature
        if [[ "$CPU_VENDOR" == "AuthenticAMD" ]]; then
            XML_CONTENT+="    <feature policy='require' name='topoext'/>\n"
        fi

        XML_CONTENT+="  </cpu>\n"
    }

    create_clock_info() {
        XML_CONTENT+="  <clock offset='utc'>\n"
        XML_CONTENT+="    <timer name='rtc' tickpolicy='catchup'/>\n"
        XML_CONTENT+="    <timer name='pit' tickpolicy='delay'/>\n"
        XML_CONTENT+="    <timer name='hpet' present='yes'/>\n"
        XML_CONTENT+="    <timer name='tsc' present='yes' mode='native'/>\n"
        XML_CONTENT+="  </clock>\n"
    }

    create_on_states() {
        XML_CONTENT+="  <on_poweroff>destroy</on_poweroff>\n"
        XML_CONTENT+="  <on_reboot>restart</on_reboot>\n"
        XML_CONTENT+="  <on_crash>restart</on_crash>\n"
    }

    create_devices() {
        XML_CONTENT+="  <devices>\n"
        XML_CONTENT+="    <emulator>/usr/bin/qemu-system-x86_64</emulator>\n"
        XML_CONTENT+="    <watchdog model='itco' action='none'/>\n"
        XML_CONTENT+="    <memballoon model='none'/>\n"
        XML_CONTENT+="  </devices>\n"
    }

    create_qemu_args() {
        XML_CONTENT+="  <qemu:commandline>\n"
        XML_CONTENT+="    <qemu:arg value='-global'/>\n"
        XML_CONTENT+="    <qemu:arg value='ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off'/>\n"
        XML_CONTENT+="    <qemu:arg value='-device'/>\n"
        XML_CONTENT+="    <qemu:arg value='isa-applesmc,osk=ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc'/>\n"
        XML_CONTENT+="    <qemu:arg value='-usb'/>\n"
        XML_CONTENT+="    <qemu:arg value='-device'/>\n"
        XML_CONTENT+="    <qemu:arg value='usb-tablet'/>\n"
        XML_CONTENT+="    <qemu:arg value='-device'/>\n"
        XML_CONTENT+="    <qemu:arg value='usb-kbd'/>\n"
        XML_CONTENT+="    <qemu:arg value='-cpu'/>\n"
        XML_CONTENT+="    <qemu:arg value='${GUESTCPU},vendor=GenuineIntel'/>\n"
        XML_CONTENT+="  </qemu:commandline>\n"
    }

    ovmf_where() {
        l2c INTRNL "Beginning EDK2 UEFI detection routine."

        # Common locations for OVMF files
        OVMF_PATHS=(
            "/usr/share/OVMF"
            "/usr/share/edk2/x64"
            "/usr/share/qemu"
            "/var/lib/libvirt/qemu"
        )

        OVMF_CODE=""
        OVMF_VARS=""

        for path in "${OVMF_PATHS[@]}"; do
            # Prioritize 4m versions first
            if [[ -f "$path/OVMF_CODE.4m.fd" ]]; then
                OVMF_CODE="$path/OVMF_CODE.4m.fd"
                l2c INTRNL "Found OVMF_CODE.4m.fd at: $OVMF_CODE"
            elif [[ -f "$path/OVMF_CODE.fd" && -z "$OVMF_CODE" ]]; then
                OVMF_CODE="$path/OVMF_CODE.fd"
                l2c INTRNL "Found OVMF_CODE.fd at: $OVMF_CODE"
            fi

            if [[ -f "$path/OVMF_VARS.4m.fd" ]]; then
                OVMF_VARS="$path/OVMF_VARS.4m.fd"
                l2c INTRNL "Found OVMF_VARS.4m.fd at: $OVMF_VARS"
            elif [[ -f "$path/OVMF_VARS.fd" && -z "$OVMF_VARS" ]]; then
                OVMF_VARS="$path/OVMF_VARS.fd"
                l2c INTRNL "Found OVMF_VARS.fd at: $OVMF_VARS"
            fi
        done

        # If not found, log a message
        if [[ -z "$OVMF_CODE" ]]; then
            l2c INTRNL "OVMF_CODE not found in common locations."
        fi
        if [[ -z "$OVMF_VARS" ]]; then
            l2c INTRNL "OVMF_VARS not found in common locations."
        fi

    }

    get_memory_info() {
        l2c INTRNL "Beginning memory detection routine."

        # Get total memory in KiB
        TOTAL_MEMORY_KIB=$(grep '^MemTotal' /proc/meminfo | awk '{print $2}')
        
        # Convert KiB to MB and GB using integer division
        TOTAL_MEMORY_MB=$((TOTAL_MEMORY_KIB / 1024))
        TOTAL_MEMORY_GB=$((TOTAL_MEMORY_MB / 1024))

        # Calculate 1/4th of total memory
        RESERVED_MEMORY_KIB=$((TOTAL_MEMORY_KIB / 4))
        RESERVED_MEMORY_MB=$((TOTAL_MEMORY_MB / 4))
        RESERVED_MEMORY_GB=$((TOTAL_MEMORY_GB / 4))

        l2c INTRNL "Total Memory (in KiB): $TOTAL_MEMORY_KIB KiB"
        l2c INTRNL "Total Memory (in MB): $TOTAL_MEMORY_MB MB"
        l2c INTRNL "Total Memory (in GB): $TOTAL_MEMORY_GB GB"
        
        # Reserved memory output
        l2c INTRNL "Reserved Memory (in KiB): $RESERVED_MEMORY_KIB KiB"
        l2c INTRNL "Reserved Memory (in MB): $RESERVED_MEMORY_MB MB"
        l2c INTRNL "Reserved Memory (in GB): $RESERVED_MEMORY_GB GB"

    }

    # Prompt user to select a Mac Pro model
    select_mac_pro_model() {
        echo "Select a Mac Pro model:"
        echo ""
        echo "1) MacPro7,1 (Catalina 10.15+)"
        echo "2) MacPro5,1 (Mojave 10.14-)"
        echo "3) MacPro4,1 (El Capitan 10.11-)"
        echo "4) MacPro3,1 (El Capitan 10.11-)"
        echo "5) MacPro2,1 (Mojave 10.7-)"
        echo ""
        echo "c) Cancel"
        echo ""

        read -p "Enter choice [1-5 or c]: " choice

        case $choice in
            1)
                l2c INTRNL "MacPro7,1 selected."
                mp71
                ;;
            2)
                l2c INTRNL "MacPro5,1 selected."
                mp51
                ;;
            3)
                l2c INTRNL "MacPro4,1 selected."
                mp41
                ;;
            4)
                l2c INTRNL "MacPro3,1 selected."
                mp31
                ;;
            5)
                l2c INTRNL "MacPro2,1 selected."
                mp21
                ;;
            c|C)
                l2c INTRNL "Mac Pro model selection cancelled."
                CANCEL=TRUE
                return
                ;;
            *)
                echo "Invalid choice. Please select 1 or 2."
                select_mac_pro_model
                ;;
        esac
    }

    # Prompt and save XML to a file
    save_xml() {
        l2c INTRNL "XML Output is set to $XML_FILE_PATH"

        if [[ -f "$XML_FILE_PATH" ]]; then
            read -rp "XML file already exists at $XML_FILE_PATH. Overwrite? [y/N]: " CONFIRM
            [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && {
                l2c INTRNL "User aborted saving XML."
                return 1
            }
        fi

        echo -e "$XML_CONTENT" > "$XML_FILE_PATH"
        l2c INTRNL "XML configuration saved to $XML_FILE_PATH"
    }

    # Placeholder split functions for each Mac Pro model
    # You're probably wondering, why are they all split but doing the same thing?
    # Because Bash lets you set variables. So, if a Mac Pro model requires something in
    # any specific section such as the OS or CPU Features, I can define them within each
    # function itself as its variables. This will be taken into account in each func
    mp71() {
        l2c INTRNL "Running MacPro7,1 configuration routine."
        MODEL="MacPro7,1"
        MODEL_PRETTY="MP71"
        GUESTCPU="Cascadelake-Server" # Based on MacPro7,1 CPU (Xeon Server architecture)

        # Generate XML components
        create_header
        create_domain_wrapper
        create_domain_details
        # Add memory section
        create_memory
        # Add vCPU section
        create_vcpus
        # Add OS section
        create_os
        # Add Features
        create_features
        # Add CPU Features
        create_cpu_features
        # Add Clock Timer settings
        create_clock_info
        # Add On States
        create_on_states
        # Add Devices block
        create_devices
        # Add QEMU custom args to set CPU and OSK
        create_qemu_args

        # Close domain wrapper
        XML_CONTENT+="</domain>\n"

        # Print the formatted XML content
        echo -e "$XML_CONTENT"

         # Define the XML file path
        XML_FILE_PATH="$ROOT/xmls/DarwinKVM-$MODEL_PRETTY.xml"
    }

    mp51() {
        l2c INTRNL "Running MacPro5,1 configuration routine."
        MODEL="MacPro5,1"
        MODEL_PRETTY="MP51"
        GUESTCPU="Westmere-v2"  # Based on MacPro5,1 CPU (Westmere architecture)

        # Generate XML components
        create_header
        create_domain_wrapper
        create_domain_details
        # Add memory section
        create_memory
        # Add vCPU section
        create_vcpus
        # Add OS section
        create_os
        # Add Features
        create_features
        # Add CPU Features
        create_cpu_features
        # Add Clock Timer settings
        create_clock_info
        # Add On States
        create_on_states
        # Add Devices block
        create_devices
        # Add QEMU custom args to set CPU and OSK
        create_qemu_args

        # Close domain wrapper
        XML_CONTENT+="</domain>\n"

        # Print the formatted XML content
        echo -e "$XML_CONTENT"

        # Define the XML file path
        XML_FILE_PATH="$ROOT/xmls/DarwinKVM-$MODEL_PRETTY.xml"
    }

    mp41() {
        l2c INTRNL "Running MacPro4,1 configuration routine."
        MODEL="MacPro4,1"
        MODEL_PRETTY="MP41"
        GUESTCPU="Conroe-v1"  # Based on MacPro2,1 ; 3,1 ; 4,1 CPU (Conroe architecture)

        # Generate XML components
        create_header
        create_domain_wrapper
        create_domain_details
        # Add memory section
        create_memory
        # Add vCPU section
        create_vcpus
        # Add OS section
        create_os
        # Add Features
        create_features
        # Add CPU Features
        create_cpu_features
        # Add Clock Timer settings
        create_clock_info
        # Add On States
        create_on_states
        # Add Devices block
        create_devices
        # Add QEMU custom args to set CPU and OSK
        create_qemu_args

        # Close domain wrapper
        XML_CONTENT+="</domain>\n"

        # Print the formatted XML content
        echo -e "$XML_CONTENT"

        # Define the XML file path
        XML_FILE_PATH="$ROOT/xmls/DarwinKVM-$MODEL_PRETTY.xml"
    }

    mp31() {
        l2c INTRNL "Running MacPro3,1 configuration routine."
        MODEL="MacPro3,1"
        MODEL_PRETTY="MP31"
        GUESTCPU="Conroe-v1"  # Based on MacPro2,1 ; 3,1 ; 4,1 CPU (Conroe architecture)

        # Generate XML components
        create_header
        create_domain_wrapper
        create_domain_details
        # Add memory section
        create_memory
        # Add vCPU section
        create_vcpus
        # Add OS section
        create_os
        # Add Features
        create_features
        # Add CPU Features
        create_cpu_features
        # Add Clock Timer settings
        create_clock_info
        # Add On States
        create_on_states
        # Add Devices block
        create_devices
        # Add QEMU custom args to set CPU and OSK
        create_qemu_args

        # Close domain wrapper
        XML_CONTENT+="</domain>\n"

        # Print the formatted XML content
        echo -e "$XML_CONTENT"

        # Define the XML file path
        XML_FILE_PATH="$ROOT/xmls/DarwinKVM-$MODEL_PRETTY.xml"
    }

    mp21() {
        l2c INTRNL "Running MacPro2,1 configuration routine."
        MODEL="MacPro2,1"
        MODEL_PRETTY="MP21"
        GUESTCPU="Conroe-v1"  # Based on MacPro2,1 ; 3,1 ; 4,1 CPU (Conroe architecture)

        # Generate XML components
        create_header
        create_domain_wrapper
        create_domain_details
        # Add memory section
        create_memory
        # Add vCPU section
        create_vcpus
        # Add OS section
        create_os
        # Add Features
        create_features
        # Add CPU Features
        create_cpu_features
        # Add Clock Timer settings
        create_clock_info
        # Add On States
        create_on_states
        # Add Devices block
        create_devices
        # Add QEMU custom args to set CPU and OSK
        create_qemu_args

        # Close domain wrapper
        XML_CONTENT+="</domain>\n"

        # Print the formatted XML content
        echo -e "$XML_CONTENT"

        # Define the XML file path
        XML_FILE_PATH="$ROOT/xmls/DarwinKVM-$MODEL_PRETTY.xml"
    }

    # Start system details detection routines
    get_cpu_info
    ovmf_where
    get_memory_info

    # Lets start building the XML
    # Call the selection function
    select_mac_pro_model

    # Check if CANCEL is TRUE before proceeding
    if [ "$CANCEL" = TRUE ]; then
        echo "Process cancelled. No XML was created nor will be saved."
        return  # Exit to prevent XML save
    fi

    # attempt to save the XML data to the file path
    save_xml

    # Prompt the user with the XML Importer UI
    read -rp "Would you like to open the XML Importer UI? [y/N]: " LAUNCH_XML_UI
    if [[ "$LAUNCH_XML_UI" == "y" || "$LAUNCH_XML_UI" == "Y" ]]; then
        xmlimporter
    fi

}

# Internal Function to update submodules for everyone else
submods_update_internal() {
    clear

    echo "Updating Git submodules..."
    git submodule update --remote --rebase
    echo "Submodules updated successfully."

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

# Function to call push.sh from scripts
push_changes() {
    clear

    # Construct the scripts root path using $ROOT
    SCRIPTS_ROOT="$ROOT/scripts"
    if [[ ! -d "$SCRIPTS_ROOT" ]]; then
        echo "Error: Scripts directory not found at $SCRIPTS_ROOT"
        echo "Please ensure the scripts folder exists."
        return 1
    fi
    echo "Scripts directory found at: $SCRIPTS_ROOT"
    
    # Launch push.sh in a new shell process and wait for it to exit
    (
        cd "$SCRIPTS_ROOT" || { echo "Error: Failed to change directory to $SCRIPTS_ROOT."; exit 1; }
        # Execute the push.sh script in a new shell
        exec "$SHELL_NAME" push.sh
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
            "Dynamic XML Configuration")
                dynamic_xml
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
            "Update Submodules for EUs (Rebase)")
                submods_update_internal
                ;;
            "Create New Local Commit")
                commit_changes
                ;;
            "Push Local Changes to Github")
                push_changes
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
