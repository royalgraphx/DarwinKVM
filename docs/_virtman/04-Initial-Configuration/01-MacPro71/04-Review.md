---
layout: default
title: Finished Example
parent: MacPro7,1
grand_parent: Initial Configuration
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

  .top-button {
    margin: 10px;
    align: center;
  }
</style>

<br>
<h2 align="center"><b>Finished Example</b></h2>
<br>

<a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManExampleReadyToInstall.png" alt=""></a>

<p align="center">Notice the left-hand panel now has everything properly defined to use via Virt-Manager.</p>

<p align="center">Using the recoveryOS or Offline Installer, you may now proceed to installing the OS. <span style="color: #bfa6ff;"><b>Please do not continue until you reach the desktop of your Guest OS</b></span>. You can scroll past this page to view the preferred method of installation with MacPro7,1 which is recoveryOS.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../03-ConfigNIC">&larr; Back Page</a>
    <a class="nav-button" href="../../../05-GPU-Passthrough/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>

<hr>

<p align="center">
  <img width="650" height="200" src="../../../../assets/Headers/Header-recoveryOS-Example.png">
</p>

{: .headsup }
Booting from the recoveryOS <code>.dmg</code> on the OpenCore disk image is known to take anywhere from a few seconds, to 5 minutes to load! You are not frozen. OpenCore is copying the DMG to RAM, and this process can take a while depending on your host CPU speed.

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

<h2 align="center">
  <br>
  <div>
    <a class="top-button" href="#">&uarr; Go to the Top &uarr;</a>
  </div>
  <br>
</h2>
