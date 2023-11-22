---
layout: default
title: Part 2 - Configure Storage Drives
parent: Installing macOS
nav_order: 3
---

# Configure VirtIO Drives
#### This is required to boot OpenCore and recoveryOS.

## Adding OpenCore Drive

Select the "Add Hardware" button to bring up the Storage prompt. Select the OpenCore image via the "Manage..." button. The ``Bus type:`` should be set to VirtIO. Cache mode set to none, and Discard mode is set to unmap.

<p align="center">
  <img src="../../assets/VManAddVirtIOInstallation2.png">
</p>


<p align="center">
  <img src="../../assets/VManAddOpenCore1.png">
</p>

Don't forget to set it as your boot drive.

<p align="center">
  <img src="../../assets/VManAddOpenCore2.png">
</p>

## Creating a Virtual SSD for installation

{: .important }
If you're looking to passthrough a secondary NVMe drive on your system to act as the main storage for the Virtual Machine, follow the write-up for using NVMe's on Virt-Manager. Requires compatible NVMe.

To create a virtual SSD, when selecting the "Add Hardware" button to bring up the Storage prompt, there is a + button in the current libvirt images directory. You can choose any size you'd like but I suggest the standard 128G, 256GB, 512GB, 1024GB.

Here you can see me creating the disk image I'll be installing macOS on.

<p align="center">
  <img src="../../assets/VManAddVirtIOInstallation.png">
</p>

## You can now continue to the next <a href="03-ConfigNIC.html">page</a>.