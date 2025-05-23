---
layout: default
title: Understanding Tasks
description: "We'll need to quickly go over all of the current tasks to get an understanding of what we'll be doing for the remainder of the section."
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
  <img width="650" height="200" src="../../assets/Headers/HeaderCurrentTasks.png">
</p>

<h5 align="center">We'll cover how to create and manage an OpenCore EFI disk image.</h5>

| **Step** | **Quick Description** |
| --- | --- |
| **Disk Image Creation** | We'll either manually craft our disk images using the Linux Terminal, or use a tool called DiskProvision which allows us to quickly create a blank raw disk image with the <code>.img</code> extension, mount it and format it freshly as FAT32. The resulting disk image created during this step mimics having the classic OpenCore USB Flash Drive inserted into your desktop machine. This image will hold the OpenCore configuration and this tool can be used to quickly mount, format, duplicate, and delete various OpenCore images you create and manage. You can indeed, create and manage multiple OpenCore disk images, and standard blank large images for the OS installation during this part. |
| **Disk Image Contents** | The Carnations Botanica organization maintains a fork of OpenCorePkg that is modified to contain swapped out files that are for the QEMU Q35 machine type. This includes: a set of SSDTs for the ACPI folder, two options of an HFS+ Driver depending on Target, and a stripped Sample.plist that drops all disabled entries and stripped of comments. The Sample.plist in DarwinOCPkg has a Kernel Patch for Ventura (13+) to fix PCIe Enumeration. Without the usage of DarwinOCPkg, you may be required to create all these files on your own. For those on Proxmox or Unraid, following the steps to create the latest OpenCore disk image from scratch, can be a great resource for those who want to update the EFI partition without waiting on DarwinOCPkg. |
| **Placement of Files** | A quick overview of all the folders and contents of those folders in an OpenCore EFI. This ensures that you are properly configuring the layout of the image before we continue and configure the config file itself. |
| **ProperTree Usage** | This page goes over how to use ProperTree to configure OpenCore itself. The cross-platform Python property list editor is tailored for the purest form of editing of OpenCore format property lists. We'll go over how to read and set options for OpenCore by explaining the ProperTree UI. |
| **OpenCore Configurations** | It's now time to go through the <code>config.plist</code> with ProperTree and configure it to present the QEMU Q35 machine as the required Mac Pro Model for the desired OS X / macOS install. |
| **Fetching Installer** | The tool for this section will be DarwinFetch. You'll now have to decide on an offline or recoveryOS based installation. Essentially, you need to properly get a fresh vanilla copy of the operating system that has not been modified by anyone. No reuploads or dumps are supported here. If using a modern enough release, you can use recoveryOS which is a reduced version of macOS that can restore an Intel Mac by downloading the rest of the OS from Apples CDN and install it. This is essentially the same thing as entering Internet Recovery on a real Mac. This is why Networking was required earlier. If you are targeting an older OS X release, your only options may be an official DVD dump of the OS X install discs or media. Most users are here for modern macOS. |
| **Final Overview** | Now that we've created our image, configured its layout, configured the config file itself, have gotten the required recoveryOS files or Offline installer, we are ready to make sure we have everything we need in the proper places and move on to Virt-Manager configuration. |

<p align="center">Each section will guide you through the necessary steps to ensure a smooth configuration experience while also intending to teach you as much information as possible.</p>

<br>
<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../hypervisor/08-Guest-Target-Decision/01-x86_64">&larr; Back Page</a>
    <a class="nav-button" href="../02-ImageCreation/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
