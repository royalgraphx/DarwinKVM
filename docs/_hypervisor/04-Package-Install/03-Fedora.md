---
layout: default
title: Fedora Based
description: "Placeholder"
parent: Package Installation
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
  <img width="650" height="200" src="../../../assets/Headers/HeaderFedoraWorkstation.png">
</p>

<p align="center">To get started, we'll use the default package manager <code>dnf</code> to install varaious packages/software including but not limited to Virt-Manager and QEMU itself.</p>

| Package | Description |
| ---- | ---- |
| ovmf | UEFI firmware for virtual machines. Without this package, you cannot use UEFI on QEMU. |
| libvirt | Toolkit to interact with virtualization capabilities of Linux. |
| qemu-utils | Additional utilities for QEMU. |
| dosfstools | Utilities for managing FAT/32 file systems. This is used for formatting our images. |
| virt-manager | GUI-based virtual machine manager for QEMU and remote VMMs. |
| bridge-utils | Tools for configuring network bridges. |
| qemu-system-x86 | QEMU system emulator and virtualizer, specifically for x86 architecture. |
| libvirt-daemon-config-network | Libvirt configuration for networking features. |

<p align="center">You can install all the necessary packages using <code>dnf</code> by running the following command:</p>

```bash
sudo dnf install qemu-system-x86 libvirt libvirt-daemon-config-network bridge-utils virt-manager dosfstools    
```


{: .new }
> <details markdown="block">
> <summary align="center">For those interested in running macOS Mojave (10.14) or older</summary>
> <p align="center">If you're interested in working with OS X / macOS releases prior to macOS Mojave (10.14), You will need to install the following package to use DarwinUDK's fork of OVMF in Virt-Manager and QEMU CLI. This build of OVMF was modified by the DarwinKVM team with <code>-D LINUX_LOADER</code> at compile time. Acidanthera's AUDK source code implements a new PE/COFF loader which can prevent the loading/execution of HfsPlusLegacy.efi which is required to create the MacPro5,1 configuration that DarwinKVM provides. This issue is not present in non-Acidanthera UEFI firmware, but we do use it here as the fork is based on AUDK, so this is a required step for the most vanilla configuration of Legacy OS X / macOS when it comes to properly loading via QEMU.</p>
> 
> <p align="center">The flag sets the image protection policy. If a bit is set, the image will be protected by DxeCore if it is aligned. The code section becomes read-only, and the data section becomes non-executable (or non-bootable), leading to issues when trying to boot older OS X / macOS. The Policy required to allow legacy, non-aligned, non-signed Apple images such as HfsPlusLegacy.efi can be set in the DSC under Ovmf, but DarwinUDK simply compiles with the flag and provides you a precompiled package to install for ease of use on any Linux distribution.</p>
> 
> <p align="center">To get started, cd to the <code>extras</code> folder at the root of DarwinKVM, and under the appropriate distribution folder to find the required package file under the DUDK-Firmware submodule.</p>
> 
> ```bash
> cd extras/DUDK-Firmware/Fedora
> ```
> 
> <p align="center">You'll now be able to use <code>rpm</code> to install the DUDK-Firmware package.</p>
> 
> ```bash
> sudo rpm -i DUDK-Firmware-1.0.0-2.fedora.rpm
> ```
> 
> <p align="center">You'll now be able to successfully import LegacyDarwinKVM.xml and use DUDK-Firmware in Virt-Manager! For those using CLI QEMU, you can find the firmware file at <code>/usr/share/DarwinUDK/DUDK_CODE.fd</code> and NVRAM at <code>/usr/share/DarwinUDK/DUDK_VARS.fd</code></p>
> 
> </details>
> 

<p align="center">If you use any other package manager on Fedora Workstation, or similarly based distributions, and would like to contribute to this page, please request a PR review for accelerated addition. It's understandable that some people may already be on an existing installation for a while now, and use entirely different package managers.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../../05-Package-Configuration">Next Page &rarr;</a>
  </div>
  <br>
</h2>

