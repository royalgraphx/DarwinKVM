---
layout: default
title: Installing via recoveryOS
parent: Recovery
grand_parent: Fetching Installer
nav_order: 4
---

# Example Install of macOS via recoveryOS
#### This is an example of how Recovery install works!

OpenCore Menu, shows recoveryOS detected.

<p align="center">
  <img src="../../../../assets/OpenCoreVMBootRecovery.png">
</p>

macOS Ventura recoveryOS booting

<p align="center">
  <img src="../../../../assets/BootingRecovery.png">
</p>

macOS Ventura Disk Utility showing OpenCore drive.

<p align="center">
  <img src="../../../../assets/macOSRecoveryDiskUtility.png">
</p>

{: .highlight }
From here on out, the screenshots will show macOS Sonoma because I had the USB prepared nearby and wanted to test everything working still even in Sonoma. This won't make a difference for you, it's the same for macOS Ventura.

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaRecoveryBoot.png">
</p>

Open Disk Utility, and format the target drive to APFS.

<p align="center">
  <img src="../../../../assets/macOSRecoveryFormatInstallTarget.png">
</p>

<p align="center">
  <img src="../../../../assets/macOSRecoveryFormatInstallTarget2.png">
</p>

<p align="center">
  <img src="../../../../assets/macOSRecoveryFormatInstallTarget3.png">
</p>

You are now ready to proceed to the installation!

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaRecoveryInstallation1.png">
</p>

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaRecoveryInstallation2.png">
</p>

Second Boot Phase

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaSecondBootPhase.png">
</p>

Third Boot Phase, further unpacking.

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaThirdBootPhase.png">
</p>

{: .note }
You may get a fourth reboot, if not, eventually, you will the proper name of your drive:

<p align="center">
  <img src="../../../../assets/OpenCoreSonomaInstallationComplete.png">
</p>

Here we are at the desktop of our Virtual Machine.

<p align="center">
  <img src="../../../../assets/macOSSonomaDesktop.png">
</p>

Our OpenCore image is mounted easily and recognized by macOS. Allowing easy modification within and out of the Virtual Machine. Any changes made here, can easily be viewed by mounting on the host. This can be useful for moving small files.

<p align="center">
  <img src="../../../../assets/macOSSonomaNoMountEFIneeded.png">
</p>

<h2 align="center">Now that macOS is installed, we can now do GPU Passthrough!</h2>

<h3 align="center"><a href="../../../08-sGPUpt/index">Single GPU Passthrough</a></h3>

<h3 align="center"><a href="../../../09-dGPUpt/index">Dual GPU Passthrough</a></h3>