---
layout: default
title: Part 2 - Configure Storage Drives
parent: Installing macOS
nav_order: 3
---

# Configure VirtIO Drives
#### This is required to boot OpenCore.

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

If you're not going to passthrough an NVME drive to install macOS on, then this is the step to make a disk image. You can choose any size you'd like but I suggest the standard 128G, 256GB, 500GB, 1000GB.

Here you can see me creating the disk image I'll be installing macOS on.

<p align="center">
  <img src="../../assets/VManAddVirtIOInstallation.png">
</p>

## You can now continue to the next <a href="03-ConfigNIC.html">page</a>.