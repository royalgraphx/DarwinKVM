---
layout: default
title: Part 2 - Drivers
parent: Gathering Files
nav_order: 3
---

# Drivers
#### This section has been derived from the <a href="https://dortania.github.io/OpenCore-Install-Guide/installer-guide/opencore-efi.html">Adding The Base OpenCore Files</a> guide. It may be out of date. Please refer to latest documentation when possible.

Now something you'll notice is that it comes with a bunch of files in Drivers and Tools folder, we don't want most of these:

- Keep the following from Drivers (if applicable):

| Driver  | Status | Description | 
| ----- | ----- | ----- |
| OpenRuntime.efi | Required | Required for fixing NVRAM, power management, RTC, memory mapping etc. |
| ResetNvramEntry.efi | Required | Required to reset the system's NVRAM |
| OpenHfsPlus.efi | Optional | Open sourced HFS+ driver, but slower than Apple's proprietary driver |

There are already base files included in the repository. You'll have to check with your hardware to see if you need anything additional. As outlined in [Gathering files -> Firmware Drivers](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers) you will see a table that states [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi) is a required Driver. Personally from my experience, I've been fine using OpenHfsPlus.efi but you should first try with [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi), please download and add that to your OpenCore EFI.

## You can now continue to the next <a href="03-Kexts.html">page</a>.
