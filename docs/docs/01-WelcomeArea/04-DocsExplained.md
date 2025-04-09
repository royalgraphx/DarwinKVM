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
This is the Table of Contents! You can scroll through to get an idea of every page in DarwinKVM.

<h2><b>Welcome Area</b></h2>
- [About This Project](01-About)
- [Requirements](02-Requirements)
- [Setting Expectations](03-SettingExpectations)
- [Docs Layout Overview](04-DocsExplained) <- You are currently here!

<h2><b>1. Host Hardware</b></h2>
- [Hardware Limitations]()
- [Know Your Hardware]()
- [Compatibility Charts]()
  - [CPU Support Check]()
  - [GPU Support Check]()
    - [AMD GPU Support Chart]()
    - [NVIDIA GPU Support Chart]()
- [Post-Check Recap]()

<h2><b>2. Hypervisor Configuration</b></h2>
- [Understanding Tasks]()
- [Cloning the Repo]()
- [BIOS Configuration]()
- [Kernel Parameters]()
  - [GRUB Configuration]()
  - [systemd-boot Configuration]()
- [Package Installation]()
  - [Arch Based]()
  - [Debian Based]()
  - [Fedora Based]()
  - [Nobara Project]()
- [Package Configuration]()
- [Networking Configuration]()
- [IOMMU Viability]()
- [Guest Target Architecture]()
  - [i386/x86_64]()
  - [PowerPC]()

<h2><b>3. OpenCore Configuration</b></h2>
- [Understanding Tasks]()
- [DiskProvision]()
  - [Image Creation]()
  - [<i>Extended Info</i>]()
- [Using DarwinOCPkg]()
- [EFI Layout Config]()
  - [ACPI]()
  - [Drivers]()
  - [Kexts]()
  - [Resources]()
  - [Tools]()
- [ProperTree Usage]()
- [OpenCore Configurations]()
  - [MacPro7,1]()
  - [MacPro5,1 or Older]()
- [Fetching Installer]()
  - [recoveryOS]()
  - [Full / Offline]()
  - [PowerPC]()

<h2><b>4. Virtual Machine Manager Configuration</b></h2>
- [Understanding Tasks]()
- [First VMM Launch]()
- [XML Importer]()
- [Initial Configuration]()
  - [MacPro7,1]()
    - [Configuring Display]()
    - [Configuring Storage Drives]()
    - [Configure NIC]()
    - [Finished Overview]()
  - [MacPro5,1 or Older]()
    - [Configuring Display]()
    - [Configuring Storage Drives]()
    - [Configure NIC]()
    - [Finished Overview]()
- [GPU Passthrough]()
  - [Single GPU Passthrough]()
    - [Script Installation]()
    - [Hook Modification]()
    - [Configuring Virt-Manager]()
    - [Complete!]()
  - [Dual GPU Passthrough]()
    - [Finding Device IDs]()
    - [Setting Kernel Parameters]()
      - [GRUB Configuration]()
      - [systemd-boot Configuration]()
    - [Configuring modprobe]()
    - [Configuring Virt-Manager]()
    - [Complete!]()

<hr>

{: .note }
This is the Post-Installation section of the Docs. This involves fixing up some slight cosmetic stuff, as well as optimizing the virtual machine further.

<h2><b>Write-Ups</b></h2>
- [Table of Contents]()
- [Custom Memory Mapping]()
- [Fake Core Count]()
- [Thread Pinning]()
- [VirtIO Threads]()
- [Motherboard Audio]()
- [KB/M Sharing with Evdev]()
- [USB Mapping]()
- [RestrictEvents Usage]()
- [DeviceProperties]()
- [sPPT / Zero-RPM Disable]()
- [Display Overrides]()
- [Bridged Networking]()
- [Host Overclocking]()
- [Legacy NVIDIA Patching]()

<h3 align="center">When you are ready to continue, you may.</h3>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="03-SettingExpectations.html">&larr; Back</a>
    <a class="nav-button" href="../../host/01-HardwareLimitations/">Next Page &rarr;</a>
  </div>
  <br>
</h2>
