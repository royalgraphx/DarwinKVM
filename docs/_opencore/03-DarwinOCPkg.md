---
layout: default
title: Using DarwinOCPkg
description: "This page goes over the differences between OpenCorePkg and DarwinOCPkg provided by Carnations Botanica."
nav_order: 3
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
  <img width="650" height="200" src="../../../assets/Headers/Header-DarwinOCPkg.png">
</p>

{: .warning }
The screenshots in this page are currently out of date, and do not accurately depict the new structure containing ACPI SSDTs in <code>Docs/</code>. Please make sure you are reading the written instructions to ensure you are properly placing files where they are expected to be! The screenshots are similar enough to use, but will be updated when possible.

{: .important }
> The mentioned files and content on this page can be found at 
> <code>/DarwinKVM/extras/DarwinOCPkg/</code>
> 
> Please ensure that you are reading carefully, as what files you move to your OpenCore disk will depend heavily on the target OS you wish to run. Do <b>NOT</b> mix <code>HfsPlus.efi</code> and <code>HfsPlusLegacy.efi</code>!
> 

<p align="center">Welcome, you'll now learn how to properly unpack and use DarwinOCPkg to build a bootable OpenCore EFI on the previously created Disk image. This page includes information to properly determine what files you will need based on the Mac Pro Model as described earler.</p>

<hr>

<h2 align="center">Root of Repository Overview</h2>
<p align="center">When you first head to the root of DarwinOCPkg, you will be greeted with a familiar folder structure that of OpenCorePkg. Some things have slightly changed: There is no x86 version of DarwinOCPkg, and the Docs folder contains the ACPI SSDTs in a loose-leaf way. The Sample configuration property list has also been updated to include a Kernel Patch required for Q35 machines running Ventura (13+) or newer. Below is an image of the contents. Be aware this screenshot can be outdated!</p>

<br>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/RepositoryRoot.png" alt="Placeholder Image"></a></p>

<h2 align="center">Copying EFI folder to Disk Image</h2>
<p align="center">Make sure you have two File Explorers open! You'll need to head into <code>DarwinOCPkg/X64/</code> and drag the <code>EFI/</code> folder into the root of your previously created OpenCore image.</p>

<br>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/DiskProvisionOCPkgInstallation.png" alt="Placeholder Image"></a></p>

<h2 align="center">Docs Folder Contents</h2>
<p align="center">You'll need to head into <code>DarwinOCPkg/Docs/</code> on a File Explorer window. On the following page, you will now begin to configure the actual OpenCore EFI that is now on your Disk. Sections in the next page will require files from this folder. To continue to the next page, make sure you move <code>Sample.plist</code> to the root of your <code>OPENCORE-DISK/EFI/OC</code> and rename it to <code>config.plist</code>.</p>

<br>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/DocsRoot.png" alt="Placeholder Image"></a></p>

<br>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/DiskProvisionOCPkgConfigInstall.png" alt="Placeholder Image"></a></p>

<p align="center">You are now ready to configure your OpenCore Disk EFI contents. Head to the next page to begin.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-DiskProvision/01-Image-Creation">&larr; Back Page</a>
    <a class="nav-button" href="../04-FilePlacement/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
