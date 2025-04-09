---
layout: default
title: Installing via recoveryOS
parent: recoveryOS
grand_parent: Fetching Installer
nav_order: 4
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-recoveryOS-Example.png">
</p>

{: .headsup }
Booting from the recoveryOS <code>.dmg</code> on the OpenCore disk image is known to take anywhere from a few seconds, to 5 minutes to load! You are not frozen. OpenCore is copying the DMG to RAM, and this process can take a while depending on your host CPU speed.

{: .important }
This is not a page where you are actively doing anything. Your task is to simply read and understand this page before continuing. The information below in this page will explain the recoveryOS process so that you are not surprised later when going through it. **READING ONLY PAGE.** This page will appear much later when it's actually time to do the installation.

<h3 align="center">OpenCore showing recoveryOS detected</h3>

<p align="center"><a href=""><img src="../../../../assets/OpenCore/OpenCoreVMBootRecovery.png" alt=""></a></p>

<h3 align="center">macOS Sonoma recoveryOS booting, vm_shared_region warnings can be ignored.</h3>

<a href=""><img src="../../../../assets/DarwinFetch/BootingRecovery.png" alt=""></a>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaRecoveryBoot.png" alt=""></a>

Open Disk Utility, and format the target drive to APFS.

<a href=""><img src="../../../../assets/macOS/macOSRecoveryFormatInstallTarget.png" alt=""></a>

<a href=""><img src="../../../../assets/macOS/macOSRecoveryFormatInstallTarget2.png" alt=""></a>

<a href=""><img src="../../../../assets/macOS/macOSRecoveryFormatInstallTarget3.png" alt=""></a>

You are now ready to proceed to the installation!

<a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaRecoveryInstallation1.png" alt=""></a>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaRecoveryInstallation2.png" alt=""></a>

Second Boot Phase

<a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaSecondBootPhase.png" alt=""></a>

Third Boot Phase, further unpacking.

<a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaThirdBootPhase.png" alt=""></a>

{: .note }
You may get a fourth reboot, if not, eventually, you will the proper name of your drive:

<p align="center"><a href=""><img src="../../../../assets/OpenCore/OpenCoreSonomaInstallationComplete.png" alt=""></a></p>

<h3 align="center">Desktop Post-Install</h3>

<a href=""><img src="../../../../assets/macOS/macOSSonomaDesktop.png" alt=""></a>

<p align="center">Our OpenCore image, being a standard FAT32 formatted disk is mounted automatically and recognized by macOS / OS X. This allows for easy modification within and out of the Virtual Machine.</p>

<a href=""><img src="../../../../assets/macOS/macOSSonomaNoMountEFIneeded.png" alt=""></a>

<p align="center">You're ready to get started! Head to the next page to import DarwinKVM on Virt-Manager and begin configuring and installing OS X / macOS!</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-Add-To-OpenCore">&larr; Back Page</a>
    <a class="nav-button" href="../../../../virtman/01-Introduction">Next Page &rarr;</a>
  </div>
  <br>
</h2>

