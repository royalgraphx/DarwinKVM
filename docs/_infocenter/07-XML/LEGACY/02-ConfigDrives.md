---
layout: default
title: Configure Storage Drives
parent: DarwinLegacyKVM.xml
grand_parent: XML Import/Usage
nav_order: 3
---

# Configure VirtIO Drives
#### This is required to boot OpenCore and recoveryOS.

## Adding OpenCore Disk

Select the "Add Hardware" button to bring up the Storage prompt. Select the OpenCore image via the "Manage..." button. The ``Bus type:`` should be set to SATA. Cache mode set to None, and Discard mode is set to Unmap.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManLegacyKVMAddSATA.png"><img src="../../../../assets/VManLegacyKVMAddSATA.png" alt=""></a>

Don't forget to set it as your boot drive.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManLegacyKVMSetBootDisk.png"><img src="../../../../assets/VManLegacyKVMSetBootDisk.png" alt=""></a>

## Creating a Virtual SSD for installation

{: .headsup }
If you're looking to passthrough a physical drive on your system to act as the main storage for the Virtual Machine, substitute this section. Requires macOS compatible SSD/NVMe Hardware.

To create a virtual SSD, when selecting the "Add Hardware" button to bring up the Storage prompt, there is a + button in the current libvirt images directory. You can choose any size you'd like but I suggest the standard 128G, 256GB, 512GB, 1024GB.

Here you can see me creating the disk image I'll be installing macOS on.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManAddVirtIOInstallation.png"><img src="../../../../assets/VManAddVirtIOInstallation.png" alt=""></a>

## You can now continue to the next <a href="../03-ConfigNIC">page</a>.
