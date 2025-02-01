#
#  MemInfoGen, script to parse Windows Host DMI Decode 
#  Output for Custom Memory Mapping in macOS Guests.
#
#  Copyright (c) 2023, 2024, 2025 RoyalGraphX
#  BSD 3-Clause License
#

printf "Data Width\n"
cat WindowsDMIDecode.txt | grep "Data Width:"
printf "Error Correction Type\n"
cat WindowsDMIDecode.txt | grep "Error Correction Type:"
printf "Form Factor\n"
cat WindowsDMIDecode.txt | grep "Form Factor:"
printf "Total Width\n"
cat WindowsDMIDecode.txt | grep "Total Width:"
printf "Type\n"
cat WindowsDMIDecode.txt | grep "Type:"
printf "Type Detail\n"
cat WindowsDMIDecode.txt | grep "Type Detail:"
printf "\n"
printf "Device Properties\n"
printf "\n"
printf "Asset Tag\n"
cat WindowsDMIDecode.txt | grep "Asset Tag:"
printf "Bank Locator\n"
cat WindowsDMIDecode.txt | grep "Bank Locator:"
printf "Device Locator\n"
cat WindowsDMIDecode.txt | grep "Locator:"
printf "Manufacturer\n"
cat WindowsDMIDecode.txt | grep "Manufacturer:"
printf "Part Number\n"
cat WindowsDMIDecode.txt | grep "Part Number:"
printf "Serial Number\n"
cat WindowsDMIDecode.txt | grep "Serial Number:"
printf "Size\n"
cat WindowsDMIDecode.txt | grep "Size:"
printf "Speed\n"
cat WindowsDMIDecode.txt | grep "Speed:"