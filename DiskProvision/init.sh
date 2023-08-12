#!/bin/bash

# Welcome! Hello to anyone reading, you can do this manually and define it however you want.
#
#  Copyright (c) 2023 RoyalGraphX
#  BSD 3-Clause License
#


# Check if "mnt" directory exists and unmount it if necessary
if test -d "mnt"; then
    echo "Unmounting 'mnt' directory..."
    sudo umount mnt
fi

# Check if OpenCore.img file exists and remove it if necessary
if test -f "OpenCore.img"; then
    echo "OpenCore.img already exists. Removing it..."
    rm -rf OpenCore.img
fi

qemu-img create -f raw OpenCore.img 1G
echo "OpenCore Image created!"
echo "Mounting and formatting..."

# Check if nbd module is already loaded
if lsmod | grep -q "^nbd"; then
    echo "nbd module is already loaded. Proceeding..."
else
    echo "nbd module is not loaded. Loading..."
    sudo modprobe nbd max_part=8
fi

# Check if /dev/nbd0 is already connected
if lsblk -o NAME | grep -q "^nbd0$"; then
    echo "/dev/nbd0 is already connected. Disconnecting..."
    sudo qemu-nbd --disconnect /dev/nbd0
fi

sudo qemu-nbd --connect=/dev/nbd0 -f raw OpenCore.img

sudo mkfs.fat -F 32 -n "OPENCORE" -I /dev/nbd0
echo "Formatting complete!"

# Create "mnt" directory if it doesn't exist
if [ ! -d "mnt" ]; then
    mkdir mnt
    echo "Created 'mnt' directory."
fi

# Mount /dev/nbd0 to the "mnt" directory with desired ownership
sudo mount -o uid=$(id -u),gid=$(id -g) /dev/nbd0 mnt
echo "Image mounted to 'mnt' directory with desired ownership successfully."

# Prompt to unmount or keep mounted
read -r -p "Do you want to unmount the image? (y/n): " choice
if [[ $choice == "y" || $choice == "Y" ]]; then
    # Unmount the image from the "mnt" directory
    sudo umount mnt

    # Disconnect the NBD device
    sudo qemu-nbd --disconnect /dev/nbd0
    echo "NBD device disconnected."

    # Remove the "mnt" directory
    rm -rf mnt
    echo "Directory 'mnt' removed."
    echo "Image unmounted."
else
    echo "Image kept mounted. Remember to unmount it later when you're done."
fi
