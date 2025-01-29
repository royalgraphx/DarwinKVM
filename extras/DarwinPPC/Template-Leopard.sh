#!/bin/bash

#
# Copyright (c) 2024 RoyalGraphX.
# GNU General Public License v3.0
#

hdd_path="../DiskProvision/images/Macintosh.img"
iso_path="../DarwinFetch/downloads/10.5.6_00000/Mac OS X 10.5.6/Mac OS X 10.5.6.iso"

# echo "HDD path is: $hdd_path"
# echo "ISO path is: $iso_path"

# Check if the HDD image exists
if [ ! -f "$hdd_path" ]; then
    echo "Could not open '$hdd_path': No such file or directory"
    exit 1
fi

# Check if the ISO file exists
if [ ! -f "$iso_path" ]; then
    echo "Could not open '$iso_path': No such file or directory"
    exit 1
fi

qemu-system-ppc -name guest="running Mac OS X Leopard on DarwinPPC" \
-M mac99,via=pmu,usb=on \
-accel tcg \
-m 2G \
-smp 1,sockets=1,cores=1,threads=1 \
-uuid CE0BC759-0FE9-4918-B6C1-5A1E17A27857 \
-no-user-config \
-nodefaults \
-rtc base=utc \
-no-shutdown \
-boot menu=on,strict=on \
-device ide-hd,bus=ide.0,drive=Macintosh \
-drive if=none,format=raw,media=disk,id=Macintosh,file="$hdd_path",discard=unmap,detect-zeroes=unmap \
-device ide-cd,bus=ide.0,drive=Installer \
-drive if=none,format=raw,media=disk,id=Installer,file="$iso_path",discard=unmap,detect-zeroes=unmap \
-device sungem,mac=2A:84:84:06:3E:78,netdev=net0 \
-netdev user,id=net0 \
-device VGA,edid=on \
-prom-env boot-args=-v \
-prom-env 'vga-ndrv?=true' \
-prom-env 'auto-boot?=true' \
-g 1280x720x32 \
-boot c \
-device \
usb-tablet \
-device \
usb-kbd \