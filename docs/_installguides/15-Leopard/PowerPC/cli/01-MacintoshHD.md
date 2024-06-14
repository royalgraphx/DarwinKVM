---
layout: default
title: Creating Macintosh HD
parent: PowerPC (CLI)
grand_parent: Leopard
nav_order: 2
---

# Creating Macintosh HD
#### Creation of a blank .img for your PowerMac.
#### This section has been derived from the <a href="https://github.com/royalgraphx/DiskProvision">DiskProvision</a> Github.

<br>
To continue in this guide you will need a disk image that will act as the Macintosh HD disk for installing Mac OS X to. In this page you'll get a basic overview on how to utilize the DiskProvision tool that's in DarwinKVM to complete this requirement.

First, navigate to the DiskProvision directory so you can use the launcher. If you need any help understanding this section, please refer to the DiskProvision [README.md](https://github.com/royalgraphx/DiskProvision/blob/main/README.md) for better context.

## Basic Walkthrough

When you first cd into the ``DiskProvision/`` folder, run ``./DiskProvision``, you will then be presented with a menu with a few options.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMainMenu.png"><img src="../../../../../assets/DiskProvisionMainMenu.png" alt=""></a>

To get started, enter 1 to create a new blank disk image. You will be asked a few questions about the Name, Size, and type of image.

{: .note }
Feel free to call it as you'd like, as it doesn't have to be "Macintosh", You can also use a QCOW2 if you'd like. Recommended to make the image atleast 16GB in size for comfortable operation.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionCreatingPPCHDD.png"><img src="../../../../../assets/DiskProvisionCreatingPPCHDD.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPowerPCImagesDB.png"><img src="../../../../../assets/DiskProvisionPowerPCImagesDB.png" alt=""></a>

You will be brought back to the main menu afterwards. We're done! We can now use this image within QEMU via Command Line options.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMainMenu.png"><img src="../../../../../assets/DiskProvisionMainMenu.png" alt=""></a>

## You can now continue to the next <a href="../02-ConfiguringCLI">page</a>.
