---
layout: default
title: Docs Layout Overview
description: "Follow along with the DarwinKVM structure to easily build a fresh Hypervisor with OS X / macOS guests."
parent: Welcome
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
  <img width="650" height="200" src="../../assets/Headers/HeaderDocsLayout.png">
</p>

<h3 align="center">Overview of the DarwinKVM process is as follows</h3>
<br>

{: .note }
Welcome to the Table of Contents! You can scroll and browse through to get an idea of every page in DarwinKVM. Open a section by clicking the arrow. To go to any page, click on the title!

<br>
<details markdown="block">
<summary>Welcome Area</summary>

- [About This Project](01-About)
- [Requirements](02-Requirements)
- [Setting Expectations](03-SettingExpectations)
- [Docs Layout Overview](04-DocsExplained) <- You are currently here!

</details>

<br>
<details markdown="block">
<summary>Host Hardware</summary>

- [Hardware Limitations](../../host/01-HardwareLimitations)
- [Know Your Hardware](../../host/02-KnowYourHardware)
- [Compatibility Charts](../../host/03-CompatibilityCharts/index)
  - [CPU Support Check](../../host/03-CompatibilityCharts/01-CPU)
  - [GPU Support Check](../../host/03-CompatibilityCharts/02-GPU/index)
    - [AMD GPU Support Chart](../../host/03-CompatibilityCharts/02-GPU/01-AMD)
    - [NVIDIA GPU Support Chart](../../host/03-CompatibilityCharts/02-GPU/02-NVIDIA)
- [Post-Check Recap](../../host/04-PostCheck)

</details>

<br>
<details markdown="block">
<summary>Hypervisor Configuration</summary>

- [Understanding Tasks](../../hypervisor/00-Introduction/)
- [Cloning the Repo](../../hypervisor/01-Git-Clone-Recursive/)
- [BIOS Configuration](../../hypervisor/02-BIOS-Settings/)
- [Kernel Parameters](../../hypervisor/03-Kernel-Parameters/index/)
  - [GRUB Configuration](../../hypervisor/03-Kernel-Parameters/01-GRUB/)
  - [systemd-boot Configuration](../../hypervisor/03-Kernel-Parameters/02-SysDBoot/)
- [Package Installation](../../hypervisor/04-Package-Install/index/)
  - [Arch Based](../../hypervisor/04-Package-Install/01-Arch/)
  - [Debian Based](../../hypervisor/04-Package-Install/02-Debian/)
  - [Fedora Based](../../hypervisor/04-Package-Install/03-Fedora/)
  - [Nobara Project](../../hypervisor/04-Package-Install/04-Nobara/)
- [Package Configuration](../../hypervisor/05-Package-Configuration/)
- [Networking Configuration](../../hypervisor/06-Networking-Configuration/)
- [IOMMU Viability](../../hypervisor/07-IOMMU-Viability/)
- [Guest Target Architecture](../../hypervisor/08-Guest-Target-Decision/index/)
  - [i386/x86_64](../../hypervisor/08-Guest-Target-Decision/01-x86_64/)
  - [PowerPC](../../hypervisor/08-Guest-Target-Decision/02-PowerPC/)

</details>

<br>
<details markdown="block">
<summary>OpenCore Configuration</summary>

- [Understanding Tasks](../../opencore/01-Introduction/)
- [Disk Image Creation](../../opencore/02-ImageCreation/index/)
  - [Using Terminal](../../opencore/02-ImageCreation/01-Terminal/index/)
    - [Package Installation](../../opencore/02-ImageCreation/01-Terminal/01-PackageInstallation/)
    - [Creation and Management](../../opencore/02-ImageCreation/01-Terminal/02-CreateAndManagement/)
  - [Using DiskProvision](../../opencore/02-ImageCreation/02-DiskProvision/index)
    - [Image Creation](../../opencore/02-ImageCreation/02-DiskProvision/01-Image-Creation/)
    - [<i>Extended Info</i>](../../opencore/02-ImageCreation/02-DiskProvision/02-Extended-Usage/)
- [Disk Image Contents](../../opencore/03-ImageContents/index/)
  - [Using OpenCorePkg](../../opencore/03-ImageContents/01-OpenCorePkg/index/)
    - [Sourcing OpenCorePkg](../../opencore/03-ImageContents/01-OpenCorePkg/01-SourceOCPKG/)
    - [Base Changes for config.plist](../../opencore/03-ImageContents/01-OpenCorePkg/02-ConfigurationChanges)
  - [Using DarwinOCPkg](../../opencore/03-ImageContents/02-DarwinOCPkg)
- [EFI Layout Config](../../opencore/04-FilePlacement/index/)
  - [ACPI](../../opencore/04-FilePlacement/01-ACPI/)
  - [Drivers](../../opencore/04-FilePlacement/02-Drivers)
  - [Kexts](../../opencore/04-FilePlacement/03-Kexts)
  - [Resources](../../opencore/04-FilePlacement/04-Resources)
  - [Tools](../../opencore/04-FilePlacement/05-Tools)
- [ProperTree Usage](../../opencore/05-ProperTreeUI/)
- [OpenCore Configurations](../../opencore/06-OpenCoreConfigurations/index/)
  - [MacPro7,1](../../opencore/06-OpenCoreConfigurations/01-MacPro71/index/)
  - [MacPro5,1 or Older](../../opencore/06-OpenCoreConfigurations/02-MacPro51/index/)
- [Fetching Installer](../../opencore/07-FetchingInstaller/index/)
  - [recoveryOS](../../opencore/07-FetchingInstaller/01-recoveryOS/index/)
  - [Full / Offline](../../opencore/07-FetchingInstaller/02-Full/index/)
  - [PowerPC](../../opencore/07-FetchingInstaller/03-PowerPC/)

</details>

<br>
<details markdown="block">
<summary>Virtual Machine Manager Configuration</summary>

- [Understanding Tasks](../../virtman/01-Introduction/)
- [First VMM Launch](../../virtman/02-VMM-First-Launch/)
- [XML Importer](../../virtman/03-XML-Importer/)
- [Initial Configuration](../../virtman/04-Initial-Configuration/index/)
  - [MacPro7,1](../../virtman/04-Initial-Configuration/01-MacPro71/index/)
    - [Configuring Display](../../virtman/04-Initial-Configuration/01-MacPro71/01-ConfigDisplay/)
    - [Configuring Storage Drives](../../virtman/04-Initial-Configuration/01-MacPro71/02-ConfigDrives/)
    - [Configure NIC](../../virtman/04-Initial-Configuration/01-MacPro71/03-ConfigNIC/)
    - [Finished Overview](../../virtman/04-Initial-Configuration/01-MacPro71/04-Review/)
  - [MacPro5,1 or Older](../../virtman/04-Initial-Configuration/02-MacPro51/index/)
    - [Configuring Display](../../virtman/04-Initial-Configuration/02-MacPro51/01-ConfigDisplay/)
    - [Configuring Storage Drives](../../virtman/04-Initial-Configuration/02-MacPro51/02-ConfigDrives/)
    - [Configure NIC](../../virtman/04-Initial-Configuration/02-MacPro51/03-ConfigNIC/)
    - [Finished Overview](../../virtman/04-Initial-Configuration/02-MacPro51/04-Review/)
- [GPU Passthrough](../../virtman/05-GPU-Passthrough/index/)
  - [Single GPU Passthrough](../../virtman/05-GPU-Passthrough/01-sGPU/index/)
    - [Script Installation](../../virtman/05-GPU-Passthrough/01-sGPU/01-Installation/)
    - [Hook Modification](../../virtman/05-GPU-Passthrough/01-sGPU/02-HookModification/)
    - [Configuring Virt-Manager](../../virtman/05-GPU-Passthrough/01-sGPU/03-VirtManConf/)
    - [Complete!](../../virtman/05-GPU-Passthrough/01-sGPU/04-Finish/)
  - [Dual GPU Passthrough](../../virtman/05-GPU-Passthrough/02-dGPU/index/)
    - [Finding Device IDs](../../virtman/05-GPU-Passthrough/02-dGPU/01-FindingDevIDs/)
    - [Setting Kernel Parameters](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/index/)
      - [GRUB Configuration](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/01-GRUB/)
      - [systemd-boot Configuration](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/02-SysDBoot/)
    - [Configuring modprobe](../../virtman/05-GPU-Passthrough/02-dGPU/03-ModProbeConf/)
    - [Configuring Virt-Manager](../../virtman/05-GPU-Passthrough/02-dGPU/04-VirtManConf/)
    - [Complete!](../../virtman/05-GPU-Passthrough/02-dGPU/05-Finish/)

</details>

<br>
<details markdown="block">
<summary>Virtual Machine Manager Configuration</summary>

- [Understanding Tasks](../../virtman/01-Introduction/)
- [First VMM Launch](../../virtman/02-VMM-First-Launch/)
- [XML Importer](../../virtman/03-XML-Importer/)
- [Initial Configuration](../../virtman/04-Initial-Configuration/index/)
  - [MacPro7,1](../../virtman/04-Initial-Configuration/01-MacPro71/index/)
    - [Configuring Display](../../virtman/04-Initial-Configuration/01-MacPro71/01-ConfigDisplay/)
    - [Configuring Storage Drives](../../virtman/04-Initial-Configuration/01-MacPro71/02-ConfigDrives/)
    - [Configure NIC](../../virtman/04-Initial-Configuration/01-MacPro71/03-ConfigNIC/)
    - [Finished Overview](../../virtman/04-Initial-Configuration/01-MacPro71/04-Review/)
  - [MacPro5,1 or Older](../../virtman/04-Initial-Configuration/02-MacPro51/index/)
    - [Configuring Display](../../virtman/04-Initial-Configuration/02-MacPro51/01-ConfigDisplay/)
    - [Configuring Storage Drives](../../virtman/04-Initial-Configuration/02-MacPro51/02-ConfigDrives/)
    - [Configure NIC](../../virtman/04-Initial-Configuration/02-MacPro51/03-ConfigNIC/)
    - [Finished Overview](../../virtman/04-Initial-Configuration/02-MacPro51/04-Review/)
- [GPU Passthrough](../../virtman/05-GPU-Passthrough/index/)
  - [Single GPU Passthrough](../../virtman/05-GPU-Passthrough/01-sGPU/index/)
    - [Script Installation](../../virtman/05-GPU-Passthrough/01-sGPU/01-Installation/)
    - [Hook Modification](../../virtman/05-GPU-Passthrough/01-sGPU/02-HookModification/)
    - [Configuring Virt-Manager](../../virtman/05-GPU-Passthrough/01-sGPU/03-VirtManConf/)
    - [Complete!](../../virtman/05-GPU-Passthrough/01-sGPU/04-Finish/)
  - [Dual GPU Passthrough](../../virtman/05-GPU-Passthrough/02-dGPU/index/)
    - [Finding Device IDs](../../virtman/05-GPU-Passthrough/02-dGPU/01-FindingDevIDs/)
    - [Setting Kernel Parameters](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/index/)
      - [GRUB Configuration](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/01-GRUB/)
      - [systemd-boot Configuration](../../virtman/05-GPU-Passthrough/02-dGPU/02-KernelParameters/02-SysDBoot/)
    - [Configuring modprobe](../../virtman/05-GPU-Passthrough/02-dGPU/03-ModProbeConf/)
    - [Configuring Virt-Manager](../../virtman/05-GPU-Passthrough/02-dGPU/04-VirtManConf/)
    - [Complete!](../../virtman/05-GPU-Passthrough/02-dGPU/05-Finish/)

</details>

<br>
<details markdown="block">
<summary>Write-Ups</summary>

{: .note }
This is the Post-Installation section of the Docs. This involves fixing up some slight cosmetic stuff, as well as optimizing the virtual machine host further by including various advanced hypervisor configuration information.

<br>

- [Table of Contents](../../writeups/01-Introduction/)
- [Custom Memory Mapping](../../writeups/02-Custom-Memory-Mapping/index/)
- [Fake Core Count](../../writeups/03-FakeCoreCount/index/)
- [Thread Pinning](../../writeups/04-ThreadPinning/index/)
- [VirtIO Threads](../../writeups/05-VirtIOThread/index/)
- [Motherboard Audio](../../writeups/06-MotherboardAudio/index/)
- [KB/M Sharing with Evdev](../../writeups/07-EvdevKBM/index/)
- [USB Mapping](../../writeups/08-USB-Mapping/index/)
- [RestrictEvents Usage](../../writeups/09-RestrictEvents/index/)
- [DeviceProperties](../../writeups/10-DeviceProperties/index/)
- [sPPT / Zero-RPM Disable](../../writeups/11-sPPT/index/)
- [Display Overrides](../../writeups/12-DisplayOverrides/index/)
- [Bridged Networking](../../writeups/13-Bridge/index/)
- [Host Overclocking](../../writeups/14-HostOC/index/)
- [Legacy NVIDIA Patching](../../writeups/15-OCLP/index/)

</details>

<br>
<h3 align="center">When you are ready to continue, you may.</h3>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="03-SettingExpectations.html">&larr; Back</a>
    <a class="nav-button" href="../../host/01-HardwareLimitations/">Next Page &rarr;</a>
  </div>
  <br>
</h2>
