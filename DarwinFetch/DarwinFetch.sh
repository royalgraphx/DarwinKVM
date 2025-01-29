#!/bin/bash

# Script version
VERSION="0.1.2"

# Define the name of the virtual environment directory
VENV_DIR=".DFetchVEnv"

# Function to activate the virtual environment
activate_venv() {
    source "$1/bin/activate"
    echo "Activated virtual environment: $1"
}

check_python_version() {
    # Check if Python 3 is available and its version
    if command -v python3 >/dev/null 2>&1; then
        PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
        if [[ $(python3 -c 'import sys; print(sys.version_info >= (3,0))') == "True" ]]; then
            echo "Python 3 detected. Version: $PYTHON_VERSION"
        else
            echo "Python 3 or later is required."
            exit 1
        fi
    else
        echo "Python 3 is not installed. Please install Python 3 or later."
        exit 1
    fi
}

check_homebrew() {
    # Check if Homebrew is installed
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew is installed."
    else
        echo "Homebrew is not installed."
        read -p "Do you want to install Homebrew now? (y/n): " choice
        case "$choice" in 
            y|Y ) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ;;
            n|N ) echo "Homebrew installation skipped." ;;
            * ) echo "Invalid choice. Please enter 'y' or 'n'." ;;
        esac
    fi
}

check_pip() {
    # Check if pip is available
    if command -v pip >/dev/null 2>&1; then
        echo "pip is installed."
    elif command -v pip3 >/dev/null 2>&1; then
        echo "pip3 is installed."
    else
        echo "pip or pip3 is not installed."
        echo "Please install pip manually to continue."
        exit 1
    fi
}

check_pacman_package() {
    # Check if the package is installed via Pacman
    if pacman -Qs "$1" >/dev/null 2>&1; then
        return 0  # Package exists
    else
        return 1  # Package does not exist
    fi
}

check_apt_package() {
    # Check if the package is installed via APT
    if dpkg -s "$1" >/dev/null 2>&1; then
        return 0  # Package exists
    else
        return 1  # Package does not exist
    fi
}

check_ensurepip() {
    # Array of typically installed files from the providing package
    local files=(
        "/usr/lib/python3.12/ensurepip/__init__.py"
        "/usr/lib/python3.12/ensurepip/__main__.py"
        "/usr/lib/python3.12/ensurepip/_uninstall.py"
    )

    # Loop through each file and check if it exists
    for file in "${files[@]}"; do
        if [ ! -f "$file" ]; then
            echo "ensurepip is not installed: $file is missing."
            return 1
        fi
    done

    echo "ensurepip is installed."
    return 0
}

check_requirements_import() {
# Function to check if all modules in requirements.txt can be imported
# Can only be called after check_python_version has been used
    if [ ! -f "requirements.txt" ]; then
        echo "requirements.txt not found."
        return 1
    fi

    while IFS= read -r module; do
        module_name=$(echo $module | sed 's/==.*//')
        $(python_executable) -c "import $module_name" 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "Failed to import module: $module_name"
            return 1
        fi
    done < "requirements.txt"
    
    echo "All modules in requirements.txt imported successfully."
    return 0
}

install_package() {
    # Install a package based on the package manager
    if [ -f /etc/arch-release ]; then
        sudo pacman -S "$1" --noconfirm || { echo "Failed to install $1"; exit 1; }
    elif [ -f /etc/debian_version ]; then
        sudo apt-get install -y "$1" || { echo "Failed to install $1"; exit 1; }
    elif [ -f /etc/fedora-release ]; then
        sudo dnf install -y "$1" || { echo "Failed to install $1"; exit 1; }
    else
        echo "Unsupported Linux distribution. The current supported Linux distributions are Arch Linux, Debian and Fedora (or its derivatives)"
        exit 1
    fi
}

install_packages_brew() {
    # Install packages using Homebrew
    brew install "$@" || { echo "Failed to install package using Homebrew"; exit 1; }
}

install_requirements_pip() {
    # Install packages in requirements.txt using pip or pip3
    if command -v pip3 >/dev/null 2>&1; then
        pip3 install -r requirements.txt || { echo "Failed to install all required packages using pip3"; exit 1; }
    elif command -v pip >/dev/null 2>&1; then
        pip install -r requirements.txt || { echo "Failed to install all required packages using pip"; exit 1; }
    else
        exit 1
    fi
}

package_exists() {
    # Check if a package exists based on the package manager
    if [ -f /etc/arch-release ]; then
        if ! check_pacman_package "python-$1"; then
            echo "python-$1 is not installed. Installing..."
            install_package "python-$1"
        else
            echo "python-$1 is installed."
        fi
    elif [ -f /etc/debian_version ]; then
        if ! check_apt_package "python3-$1"; then
            echo "python3-$1 is not installed. Installing..."
            install_package "python3-$1"
        else
            echo "python3-$1 is installed."
        fi
    elif [ -f /etc/fedora-release ]; then
        if ! check_dnf_package "python3-$1"; then
            echo "python3-$1 is not installed. Installing..."
            install_package "python3-$1"
        else
            echo "python3-$1 is insatlled."
            fi
else
        echo "Unsupported Linux distribution. The current supported Linux distributions are Arch Linux, Debian and Fedora (or its derivatives)"
        exit 1
    fi
}


python_executable() {
    # Determine the appropriate Python executable
    if command -v python3 >/dev/null 2>&1; then
        echo "python3"
    elif command -v python >/dev/null 2>&1; then
        echo "python"
    else
        echo "Python is not installed."
        exit 1
    fi
}

clear

# Print script version
echo "RGX Python Project Bootstrapper Version: $VERSION"

# Detect the host operating system
if [[ "$(uname)" == "Linux" ]]; then
    # Check if it's Arch-based or Debian-based
    if [ -f /etc/arch-release ]; then
        # Arch-based Linux commands or tasks
        echo "Running on Arch-based Linux..."

        check_python_version

        # Check if a virtual environment already exists in the current directory
        if [ -d "$VENV_DIR" ]; then
            echo "Virtual environment '$VENV_DIR' already exists."
            activate_venv "$VENV_DIR"
        else
            # Create the virtual environment
            echo "Creating virtual environment '$VENV_DIR'."
            $(python_executable) -m venv "$VENV_DIR"
            
            # Check if the virtual environment was created successfully
            if [ -d "$VENV_DIR" ]; then
                echo "Virtual environment '$VENV_DIR' created successfully."
                activate_venv "$VENV_DIR"
            else
                echo "Failed to create virtual environment '$VENV_DIR'."
                exit 1
            fi
        fi

        # Check if all modules can be imported and handle failure if necessary
        check_pip
        check_requirements_import
        if [ $? -ne 0 ]; then
            install_requirements_pip
        fi

        # sleep 5

    elif [ -f /etc/debian_version ]; then
        # Debian-based Linux commands or tasks
        echo "Running on Debian-based Linux..."

        check_python_version

        check_ensurepip || install_package "python3-venv"

        # Check if a virtual environment already exists in the current directory
        if [ -d "$VENV_DIR" ]; then
            echo "Virtual environment '$VENV_DIR' already exists."
            activate_venv "$VENV_DIR"
        else
            # Create the virtual environment
            echo "Creating virtual environment '$VENV_DIR'."
            $(python_executable) -m venv "$VENV_DIR"
            
            # Check if the virtual environment was created successfully
            if [ -d "$VENV_DIR" ]; then
                echo "Virtual environment '$VENV_DIR' created successfully."
                activate_venv "$VENV_DIR"
            else
                echo "Failed to create virtual environment '$VENV_DIR'."
                exit 1
            fi
        fi

        # Check if all modules can be imported and handle failure if necessary
        check_pip
        check_requirements_import
        if [ $? -ne 0 ]; then
            install_requirements_pip
        fi

elif [ -f /etc/fedora-release ]; then
        # Fedora Linux commands or tasks
        echo "Running on Fedora Linux..."

        check_python_version

        check_pip || install_package "python3-pip"

        # Check if a virtual environment already exists in the current directory
        if [ -d "$VENV_DIR" ]; then
            echo "Virtual environment '$VENV_DIR' already exists."
            activate_venv "$VENV_DIR"
        else
            # Create the virtual environment
            echo "Creating virtual environment '$VENV_DIR'."
            $(python_executable) -m venv "$VENV_DIR"
            
            # Check if the virtual environment was created successfully
            if [ -d "$VENV_DIR" ]; then
                echo "Virtual environment '$VENV_DIR' created successfully."
                activate_venv "$VENV_DIR"
            else
                echo "Failed to create virtual environment '$VENV_DIR'."
                exit 1
            fi
        fi
        
        # Check if all modules can be imported and handle failure if necessary
        check_pip
        check_requirements_import
        if [ $? -ne 0 ]; then
            install_requirements_pip
        fi

        # sleep 5

    else
        # Unsupported Linux distribution
        echo "Unsupported Linux distribution. The current supported Linux distributions are Arch Linux, Debian and Fedora (or its derivatives)"
        exit 1
    fi
elif [[ "$(uname)" == "Darwin" ]]; then
    # macOS-specific commands or tasks
    echo "Running on macOS..."

    check_homebrew
    
    # Check which python exec to use
    check_python_version

    # Check if a virtual environment already exists in the current directory
    if [ -d "$VENV_DIR" ]; then
        echo "Virtual environment '$VENV_DIR' already exists."
        activate_venv "$VENV_DIR"
    else
        # Create the virtual environment
        echo "Creating virtual environment '$VENV_DIR'."
        $(python_executable) -m venv "$VENV_DIR"
            
        # Check if the virtual environment was created successfully
        if [ -d "$VENV_DIR" ]; then
            echo "Virtual environment '$VENV_DIR' created successfully."
            activate_venv "$VENV_DIR"
        else
            echo "Failed to create virtual environment '$VENV_DIR'."
            exit 1
        fi
    fi

    # Check if all modules can be imported and handle failure if necessary
    check_pip
    check_requirements_import
    if [ $? -ne 0 ]; then
        install_requirements_pip
    fi

    # sleep 5

elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    # Windows-specific commands or tasks
    echo "Running on Windows..."
    echo "Unsupported operating system. Only macOS, Arch Linux, Debian and Fedora are supported."
    exit 1
else
    # Unsupported operating system
    echo "Unsupported operating system. Only macOS, Arch Linux, Debian and Fedora are supported."
    exit 1
fi

# Common tasks that apply to all operating systems after successful checks
echo "Checks passed..."

# Run command using the determined Python executable
echo "Running DarwinFetch using $(python_executable)"
$(python_executable) src/main.py
