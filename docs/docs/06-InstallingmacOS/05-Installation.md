---
layout: default
title: Part 5 - Installing via recoveryOS
parent: Installing macOS
nav_order: 6
---

# Installing macOS via recoveryOS
#### You should now be ready to install macOS!

OpenCore Menu, shows recoveryOS detected.

<p align="center">
  <img src="../../assets/OpenCoreVMBootRecovery.png">
</p>

macOS Ventura recoveryOS booting

<p align="center">
  <img src="../../assets/BootingRecovery.png">
</p>

macOS Ventura Disk Utility showing OpenCore drive.

<p align="center">
  <img src="../../assets/macOSRecoveryDiskUtility.png">
</p>

{: .highlight }
From here on out, the screenshots will show macOS Sonoma because I had the USB prepared nearby and wanted to test everything working still even in Sonoma. This won't make a difference for you, it's the same for macOS Ventura.

<p align="center">
  <img src="../../assets/OpenCoreSonomaRecoveryBoot.png">
</p>

Open Disk Utility, and format the target drive to APFS.

<p align="center">
  <img src="../../assets/macOSRecoveryFormatInstallTarget.png">
</p>

<p align="center">
  <img src="../../assets/macOSRecoveryFormatInstallTarget2.png">
</p>

<p align="center">
  <img src="../../assets/macOSRecoveryFormatInstallTarget3.png">
</p>

You are now ready to proceed to the installation!

<p align="center">
  <img src="../../assets/OpenCoreSonomaRecoveryInstallation1.png">
</p>

<p align="center">
  <img src="../../assets/OpenCoreSonomaRecoveryInstallation2.png">
</p>

Second Boot Phase

<p align="center">
  <img src="../../assets/OpenCoreSonomaSecondBootPhase.png">
</p>

Third Boot Phase, further unpacking.

<p align="center">
  <img src="../../assets/OpenCoreSonomaThirdBootPhase.png">
</p>

{: .note }
You may get a fourth reboot, if not, eventually, you will the proper name of your drive:

<p align="center">
  <img src="../../assets/OpenCoreSonomaInstallationComplete.png">
</p>

Here we are at the desktop of our Virtual Machine.

<p align="center">
  <img src="../../assets/macOSSonomaDesktop.png">
</p>

Our OpenCore image is mounted easily and recognized by macOS. Allowing easy modification within and out of the Virtual Machine. Any changes made here, can easily be viewed by mounting on the host. This can be useful for moving small files.

<p align="center">
  <img src="../../assets/macOSSonomaNoMountEFIneeded.png">
</p>

<h1>You can now proceed to the <a href="../07-SingleGPUPassthrough/">Single GPU Passthrough</a> section! More support being added.</h1>