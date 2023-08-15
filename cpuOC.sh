#!/bin/bash

# CPU Governor OC Script. Can be automatically applied on boot.
#
# Copyright (c) 2023 RoyalGraphX
# BSD 3-Clause License
#

echo "Available CPU Governors:"
available_governors=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
IFS=' ' read -r -a governors <<< "$available_governors"
for ((i=0; i<${#governors[@]}; i++)); do
    echo "$i. ${governors[$i]}"
done

read -p "Enter the number corresponding to the desired governor: " selected_governor

if [[ $selected_governor -lt 0 || $selected_governor -ge ${#governors[@]} ]]; then
    echo "Invalid selection. Exiting..."
    exit 1
fi

selected_governor_name="${governors[$selected_governor]}"

echo "Applying $selected_governor_name governor..."
sudo cpupower frequency-set -g "$selected_governor_name"
echo "Waiting for changes to take effect..."
sleep 3

sudo cpupower monitor

echo "Thanks for using the CPU Governor OC Script!"