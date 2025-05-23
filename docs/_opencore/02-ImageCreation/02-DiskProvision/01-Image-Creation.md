---
layout: default
title: Image Creation
parent: Using DiskProvision
grand_parent: Disk Image Creation
description: "This page goes over how to create a new blank OpenCore image formatted as FAT32 by DiskProvision."
nav_order: 1
has_children: false
has_toc: false
---

<style>
  .navigation-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }
  
  .nav-button {
    margin: 10px;
  }

</style>

<p align="center">
  <img width="650" height="200" src="../../../../assets/Headers/Header-OC-IMG-Creation.png">
</p>

{: .internalnote }
This section needs to have its screenshots updated with the latest DiskProvision, after it's rewritten. The legacy screenshots are still here for continuity and to allow users to still follow along. Be aware of what you're choosing! The menu may have changed.

<p align="center">To continue the guide you will need a disk image that will act as a USB containing OpenCore. In this page, you'll get a basic overview on how to utilize the DiskProvision tool that's in DarwinKVM to complete this requirement.</p>

<p align="center">For further learning of DiskProvision and its offerings, check out the <a href="https://github.com/royalgraphx/DiskProvision/blob/main/README.md">README.md</a> on the Github repo.</p>

<p align="center">You can now launch DiskProvision using DarwinKVM's Main Menu.</p>

<hr>
<h2 align="center">Basic Walkthrough</h2>

{: .note }
Feel free to call it as you'd like. It doesn't have to be <code>OpenCore</code> but will have an 8 character limit due to FAT32. 2GB is the minimum recommended size if using recoveryOS to hold <code>com.apple.recovery.boot</code> folder and contents comfortably, especially if lots of logs are created.

<br>
<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMainMenu.png"><img src="../../../../assets/DiskProvision/DiskProvisionMainMenu.png" alt=""></a>

<p align="center">To get started, Linux hosts have a special 3rd option which will begin the creation of a new "OpenCore"-type disk image that is prepared to be used as a bootable and mountable disk.</p>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionCreatingOCImage.png"><img src="../../../../assets/DiskProvision/DiskProvisionCreatingOCImage.png" alt=""></a>

<p align="center">You will be brought back to the main menu afterwards. Select option 2 to browse the images in the database, and select the disk image you created. You will be asked if you'd like to mount it to a directory, and yes we do want to. Press enter as Yes is the default.</p>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMountingDiskImage.png"><img src="../../../../assets/DiskProvision/DiskProvisionMountingDiskImage.png" alt=""></a>

{: .warning }
Do NOT use the left-hand side mounted disks tab to view the contents! Make sure you are using the folder itself, that is linked to the disk image itself. For some reason, some FMs can cause corruption to the image this way. There is no easy way to prevent the images from appearing from the sidebar, but the folders are linked to the direct NBD device/partition correctly.

<p align="center">When you look at your file explorer graphically, you will see there is a <code>mountpoints/</code> folder that holds all actively mounted images within the DiskProvision root folder.</p>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMountPointsDirectory.png"><img src="../../../../assets/DiskProvision/DiskProvisionMountPointsDirectory.png" alt=""></a>

<p align="center">In this folder, will spawn folders linked to the mounted NBD device. This is how you can interact with the contents of the mounted disk image.</p>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionPostImageMount.png"><img src="../../../../assets/DiskProvision/DiskProvisionOpenCoreMounted.png" alt=""></a>

<p align="center">Double click and enter the folder named after the image you just created and mounted. You'll now continue on to the next page, to begin filling the contents of the image.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../../../03-ImageContents/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
