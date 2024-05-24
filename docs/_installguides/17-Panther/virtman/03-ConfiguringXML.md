---
layout: default
title: Configuring XML Paths
parent: Using Virt-Manager
grand_parent: Panther
nav_order: 4
---

# Configuring XML Paths
#### How to set paths for disk images.

{: headsup }
This will not go through the installation process! It simply goes over pointing the Hard Disk image and Install Disk image path, to the correct fields. When stopping/starting the VM, double check the boot device chosen in the XML.

To begin, confirm you have downloaded the correct Install Disks for Panther.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DarwinFetchPowerPCSources.png"><img src="../../../../assets/DarwinFetchPowerPCSources.png" alt=""></a>

You can now edit the XML paths to define your named Hard Disk image.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPowerPCImagesDB.png"><img src="../../../../assets/DiskProvisionPowerPCImagesDB.png" alt=""></a>

In this example image, you can see I named my image Macintosh.img, so you will update the path to reflect that.

```xml
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Macintosh,file=/home/user/DarwinKVM/DiskProvision/Macintosh.img,discard=unmap,detect-zeroes=unmap'/>
```

{: .important }
The example is spaced out for easier human readability for copy and pasting.

You can now modify and update the Install Disks path. Panther requires three CD-ROM Drives.

```xml
<qemu:arg value='-device'/>
<qemu:arg value='ide-cd,bus=ide.0,drive=Installer'/>
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Installer,file=/home/user/DarwinKVM/DarwinFetch/downloads/10.3.0_7B850/Panther_CD1.toast_/Panther_Disc1.toast,discard=unmap,detect-zeroes=unmap'/>

<qemu:arg value='-device'/>
<qemu:arg value='ide-cd,bus=ide.1,drive=Installer2'/>
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Installer2,file=/home/user/DarwinKVM/DarwinFetch/downloads/10.3.0_7B850/Panther_CD2.toast_/Panther_Disc2.toast,discard=unmap,detect-zeroes=unmap'/>

<qemu:arg value='-device'/>
<qemu:arg value='ide-cd,bus=ide.1,drive=Installer3'/>
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Installer3,file=/home/user/DarwinKVM/DarwinFetch/downloads/10.3.0_7B850/Panther_CD3.toast__0/Panther_Disc3.toast,discard=unmap,detect-zeroes=unmap'/>
```

In this example, we point to the OS X 10.3.0 ISO Install Media disks from DarwinFetch.

{: .important }
This guide does not go over installation! You must change the following section to boot via CD-ROM or Hard Drive depending on what part of the installation process you are on.

```xml
<qemu:arg value='-boot'/>
<qemu:arg value='d'/>
```

## You can now continue to the next <a href="../04-Completion">page</a>.
