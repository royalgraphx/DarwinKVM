#!/bin/bash

#
# Copyright (c) 2024 RoyalGraphX.
# GNU General Public License v3.0
#

hdd_path="../DiskProvision/images/Macintosh.img"
iso_path="../DarwinFetch/downloads/10.3.0_7B850/Panther_CD1.toast_/Panther_Disc1.toast"
iso2_path="../DarwinFetch/downloads/10.3.0_7B850/Panther_CD2.toast_/Panther_Disc2.toast"
iso3_path="../DarwinFetch/downloads/10.3.0_7B850/Panther_CD3.toast__0/Panther_Disc3.toast"

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

qemu-system-ppc -name guest="running Mac OS X Panther on DarwinPPC" \
-M mac99,usb=off \
-accel tcg \
-m 2G \
-smp 1,sockets=1,cores=1,threads=1 \
-uuid 93BD9490-BC76-49F0-B86A-25E29523FDC8 \
-no-user-config \
-nodefaults \
-rtc base=utc \
-no-shutdown \
-boot menu=on,strict=on \
-device ide-hd,bus=ide.0,drive=Macintosh \
-drive if=none,format=raw,media=disk,id=Macintosh,file="$hdd_path",discard=unmap,detect-zeroes=unmap \
-device ide-cd,bus=ide.0,drive=Installer \
-drive if=none,format=raw,media=disk,id=Installer,file="$iso_path",discard=unmap,detect-zeroes=unmap \
-device ide-cd,bus=ide.1,drive=Installer2 \
-drive if=none,format=raw,media=disk,id=Installer2,file="$iso2_path",discard=unmap,detect-zeroes=unmap \
-device ide-cd,bus=ide.1,drive=Installer3 \
-drive if=none,format=raw,media=disk,id=Installer3,file="$iso3_path",discard=unmap,detect-zeroes=unmap \
-device sungem,mac=2A:84:84:06:3E:78,netdev=net0 \
-netdev user,id=net0 \
-device VGA,edid=on \
-prom-env boot-args=-v \
-prom-env 'vga-ndrv?=true' \
-prom-env 'auto-boot?=true' \
-g 1280x720x32 \
-boot c \
