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

{: .headsup }
Booting from the RecoveryOS image on the OpenCore Disk Image, is known to take anywhere from a few seconds, to 2 minutes to load! You are not frozen. Simply wait for macOS to finish loading. OpenCore is copying the DMG to RAM, and this process can take a while.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreVMBootRecovery.png"><img src="../../../../assets/OpenCoreVMBootRecovery.png" alt=""></a>

macOS Ventura recoveryOS booting, vm_shared_region warnings can be ignored.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/BootingRecovery.png"><img src="../../../../assets/BootingRecovery.png" alt=""></a>

macOS Ventura Disk Utility showing OpenCore drive.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSRecoveryDiskUtility.png"><img src="../../../../assets/macOSRecoveryDiskUtility.png" alt=""></a>

{: .highlight }
From here on out, the screenshots will show macOS Sonoma because I had the USB prepared nearby and wanted to test everything working still even in Sonoma. This won't make a difference for you, it's the same for macOS Ventura.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaRecoveryBoot.png"><img src="../../../../assets/OpenCoreSonomaRecoveryBoot.png" alt=""></a>

Open Disk Utility, and format the target drive to APFS.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSRecoveryFormatInstallTarget.png"><img src="../../../../assets/macOSRecoveryFormatInstallTarget.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSRecoveryFormatInstallTarget2.png"><img src="../../../../assets/macOSRecoveryFormatInstallTarget2.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSRecoveryFormatInstallTarget3.png"><img src="../../../../assets/macOSRecoveryFormatInstallTarget3.png" alt=""></a>

You are now ready to proceed to the installation!

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaRecoveryInstallation1.png"><img src="../../../../assets/OpenCoreSonomaRecoveryInstallation1.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaRecoveryInstallation2.png"><img src="../../../../assets/OpenCoreSonomaRecoveryInstallation2.png" alt=""></a>

Second Boot Phase

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaSecondBootPhase.png"><img src="../../../../assets/OpenCoreSonomaSecondBootPhase.png" alt=""></a>

Third Boot Phase, further unpacking.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaThirdBootPhase.png"><img src="../../../../assets/OpenCoreSonomaThirdBootPhase.png" alt=""></a>

{: .note }
You may get a fourth reboot, if not, eventually, you will the proper name of your drive:

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreSonomaInstallationComplete.png"><img src="../../../../assets/OpenCoreSonomaInstallationComplete.png" alt=""></a>

Here we are at the desktop of our Virtual Machine.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSSonomaDesktop.png"><img src="../../../../assets/macOSSonomaDesktop.png" alt=""></a>

Our OpenCore image is mounted easily and recognized by macOS. Allowing easy modification within and out of the Virtual Machine. Any changes made here, can easily be viewed by mounting on the host. This can be useful for moving small files.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/macOSSonomaNoMountEFIneeded.png"><img src="../../../../assets/macOSSonomaNoMountEFIneeded.png" alt=""></a>

<h2 align="center">Now that macOS is installed, we can now do GPU Passthrough!</h2>

<h3 align="center"><a href="../../../08-sGPUpt/index">Single GPU Passthrough</a></h3>

<h3 align="center"><a href="../../../09-dGPUpt/index">Dual GPU Passthrough</a></h3>