#!/bin/bash

#
#  Copyright (c) 2023 RoyalGraphX
#  BSD 3-Clause License
#

if [ ! -d "mnt" ]; then
    echo "Nothing to unmount."
    exit 1
fi

# Unmount the image from the "mnt" directory
sudo umount mnt
echo "Image unmounted."

# Disconnect the NBD device
sudo qemu-nbd --disconnect /dev/nbd0
echo "NBD device disconnected."

# Remove the "mnt" directory
rm -rf mnt
echo "Directory 'mnt' removed."
