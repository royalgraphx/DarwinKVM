---
layout: default
title: Part 0 - Image Creation
parent: Gathering Files
nav_order: 1
---

# OpenCore Image Creation
#### Creation of the OpenCore .img for your DKVM.
#### This section has been derived from the <a href="https://github.com/royalgraphx/DarwinKVM/tree/main/DiskProvision">DiskProvision</a> Submodule.

{: .new }
DiskProvision automates the process of creating and setting up a disk image for use with QEMU. It also comes with mount.sh and unmount.sh to easily modify the contents.

Don't skip this section. To continue in this guide you will need an image file that will act as our OpenCore USB, holding all its contents. The fastest way to do this is by changing the directory to the DiskProvision folder in this repository. You can quickly generate and mount a 1GB ``.img`` file to add to your Virtual Machine later. If you need any help understanding this section, please refer to the [README.md](https://github.com/royalgraphx/DarwinKVM/tree/main/DiskProvision) for better context. You can now go ahead and transfer the EFI folder from [DarwinOCPkg](https://github.com/royalgraphx/DarwinOCPkg) to the root of the image. The rest of the steps will outline adding the necessary files to build your EFI for your Virtual Machine.

## Basic Usage

```
[royalgraphx@hypervisor DiskProvision]$ ./init.sh 
Formatting 'OpenCore.img', fmt=raw size=1073741824
OpenCore Image created!
Mounting and formatting...
nbd module is already loaded. Proceeding...
[sudo] password for royalgraphx: 
/dev/nbd0 disconnected
mkfs.fat 4.2 (2021-01-31)
Formatting complete!
Created 'mnt' directory.
Image mounted to 'mnt' directory with desired ownership successfully.
Do you want to unmount the image? (y/n): n
Image kept mounted. Remember to unmount it later when you're done.
[royalgraphx@hypervisor DiskProvision]$
```

## Example

<p align="center">
  <img src="../../assets/OpenCoreLocalCreation.png">
</p>

## You can now continue to the next <a href="01-ACPITables.html">page</a>.