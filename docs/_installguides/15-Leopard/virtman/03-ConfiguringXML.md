---
layout: default
title: Configuring XML Paths
parent: Using Virt-Manager
grand_parent: Leopard
nav_order: 4
---

# Configuring XML Paths
#### How to set paths for disk images.

{: headsup }
This will not go through the installation process! It simply goes over pointing the Hard Disk image and Install Disk image path, to the correct fields. When stopping/starting the VM, double check the boot device chosen in the XML.

To begin, confirm you have downloaded the correct Install Disks for Leopard.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DarwinFetchPowerPCSources.png"><img src="../../../../assets/DarwinFetchPowerPCSources.png" alt=""></a>

Let's begin by updating the Machine Type to the following mac99 with via=pmu flag. We must also enable the USB Controller.

```xml
<qemu:arg value="-M"/>
<qemu:arg value="mac99,via=pmu,usb=on"/>
```

You can now edit the XML paths to define your named Hard Disk image.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPowerPCImagesDB.png"><img src="../../../../assets/DiskProvisionPowerPCImagesDB.png" alt=""></a>

In this example image, you can see I named my image Macintosh.img, so you will update the path to reflect that.

```xml
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Macintosh,file=/home/user/DarwinKVM/DiskProvision/Macintosh.img,discard=unmap,detect-zeroes=unmap'/>
```

You can now modify and update the Install Disk path.

```xml
<qemu:arg value='-drive'/>
<qemu:arg value='if=none,format=raw,media=disk,id=Installer,file=/home/user/DarwinKVM/DarwinFetch/downloads/10.5.6_00000/Mac OS X 10.5.6/Mac OS X 10.5.6.iso,discard=unmap,detect-zeroes=unmap'/>
```

In this example, we point to the OS X 10.5.6 ISO Install Media from DarwinFetch.

{: .important }
This guide does not go over installation! You must change the following section to boot via CD-ROM or Hard Drive depending on what part of the installation process you are on.

```xml
<qemu:arg value='-boot'/>
<qemu:arg value='d'/>
```

We now have to use USB input for Leopard and onwards, so to do so, we can add the following snippet after the -boot snippet.

```xml
<qemu:arg value='-device'/>
<qemu:arg value='usb-tablet'/>
<qemu:arg value='-device'/>
<qemu:arg value='usb-kbd'/>
```

## You can now continue to the next <a href="../04-Completion">page</a>.
