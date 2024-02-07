---
layout: default
title: Image Creation
parent: DiskProvision
nav_order: 2
---

# Disk Image Creation
#### Creation of the OpenCore .img for your DKVM.
#### This section has been derived from the <a href="https://github.com/royalgraphx/DiskProvision">DiskProvision</a> Github.

{: .warning }
DiskProvision (Executable Variant) is disabled at the moment! Please use ``./legacy/init.sh`` to quickly create an OpenCore.img! Once done, you can now scroll to the bottom for the last step. No unmounting needed, you'll be following to configure the drive in the following pages.

To continue in this guide you will need a disk image that will act as the OpenCore disk for booting macOS. In this page you'll get a basic overview on how to utilize the DiskProvision tool that's in DarwinKVM. First, navigate to the DiskProvision/build directory so you can use the executable. If you need any help understanding this section, please refer to the DiskProvision [README.md](https://github.com/royalgraphx/DiskProvision/blob/main/README.md) for better context.

## Basic Walkthrough

When you first head into the build/ folder, you'll see an executable you can launch via a terminal, you will be presented with a menu with a few options.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMainMenu.png"><img src="../../assets/DiskProvisionMainMenu.png" alt=""></a>

To get started, you can select option 1 which will begin the creation of a new disk image. Feel free to call it as you'd like, as it doesn't have to be "OpenCore".

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionCreatingOCImage.png"><img src="../../assets/DiskProvisionCreatingOCImage.png" alt=""></a>

You will now see a new Disk Image created for you in the images folder.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPostImageCreation.png"><img src="../../assets/DiskProvisionPostImageCreation.png" alt=""></a>

Go ahead and mount the disk image you created. You can do this by selection option 3 and choosing the image to mount, this will create an mnt/ folder which acts as the image mount point.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMountingDiskImage.png"><img src="../../assets/DiskProvisionMountingDiskImage.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPostImageMount.png"><img src="../../assets/DiskProvisionPostImageMount.png" alt=""></a>

{: .warning }
After running ``./legacy/init.sh`` and your image is created, you must still follow this section.

{: .headsup }
You can now go ahead and transfer the EFI folder from [DarwinOCPkg](https://github.com/royalgraphx/DarwinOCPkg) to the root of the image. The rest of the steps will outline adding the necessary files to build your EFI for your Virtual Machine.

{: .note }
You now have a mounted disk image to begin configuring for your target Darwin installation!

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionAddingOCAlternative.png"><img src="../../assets/DiskProvisionAddingOCAlternative.png" alt=""></a>

<h2 align="center">You can now proceed to the <a href="../../infocenter/01-FileOverview/index">OpenCore File Overview</a>!</h2>
