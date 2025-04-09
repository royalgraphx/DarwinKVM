---
layout: default
title: Adding to OpenCore
parent: recoveryOS
grand_parent: Fetching Installer
nav_order: 3
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-Add-REOS.png">
</p>

<p align="center">DarwinFetch sorts all downloads within its respective downloads folder.</p>

<p align="center">Within that folder, you will find a named subfolder that has the version number, and the build number of whatever macOS RecoveryOS image you chose to fetch.</p>

<p align="center">Within that folder it then creates a <code>com.apple.recovery.boot</code> folder. Inside you'll find a <code>BaseSystem.dmg</code> (or <code>RecoveryImage.dmg</code>) and a <code>.chunklist</code> file which holds the recoveryOS for retrieving and installing macOS from scratch over the internet. This is the same base system that exists on real Macs as a recovery partition.</p>

<a href=""><img src="../../../../assets/DarwinFetch/DarwinFetchDirectoryRecovery.png" alt=""></a>

<p align="center">Because we'd like to maintain SecureBootModel and various other settings for security reasons, we'll want to follow the same method as using a baremetal OpenCore USB on real hardware. Drag the <code>com.apple.recovery.boot</code> folder to the root of the OpenCore image.</p>

<p align="center">With this, you can later boot <code>Base System</code> and thus, recoveryOS.</p>

<a href=""><img src="../../../../assets/DarwinFetch/BaseSystemInstallLegacyScreenshot.png" alt=""></a>

<p align="center">Now that you've completed configuring your OpenCore disk image, <span style="color: #bfa6ff;"><b>DO NOT FORGET TO UNMOUNT YOUR OPENCORE IMAGE USING DISKPROVISION</b></span> before continuing to the XML importing and OS Installation sections. You cannot have the disk image mounted when you are going to boot or use the virtual machine associated with it.</p>

<a href=""><img src="../../../../assets/DiskProvision/DiskProvisionMainMenu.png" alt=""></a>

<a href=""><img src="../../../../assets/DiskProvision/DiskProvisionOCUnmounting.png" alt=""></a>

<p align="center">You can now continue to the next page to see an example of how recoveryOS works before we go ahead and configure the actual virtual machine in Virt-Manager.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-Choosing-Target">&larr; Back Page</a>
    <a class="nav-button" href="../03-Example-Installation">Next Page &rarr;</a>
  </div>
  <br>
</h2>
