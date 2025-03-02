---
layout: default
title: Setting Expectations
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
  <img width="650" height="200" src="../../assets/Headers/HeaderSettingExpectations.png">
</p>

<h2 align="center">Virtual or Bare Metal?</h2>
<h5 align="center">A Virtual Machine is no different but carries several advantages for those on AMD CPU's as it is possible to spoof to an Intel CPU Vendor String, fixing several issues that can occur with software such as Discord or various Adobe applications. If you are on an Intel CPU, but find that you are on an unsupported generation or have hardware on your motherboard that you cannot get around, utilizing DarwinKVM will allow you to simply require a supported GPU.</h5>
<br>

<h2 align="center">What are the differences between this and other similar projects?</h2>
<h5 align="center">The major distinction is that this is not something you can use right away, as you must read a fair amount first. Virt-Manager, QEMU, GPU Passthrough, OpenCore, Kexts, config.plist, OVMF... these things already exist. They're all either software/files, guides, or concepts of Linux/macOS. We're putting all of these things together.</h5>
<br>

<h2 align="center">What are the differences between QEMU and other programs such as VirtualBox, VMWare, and Hyper-V?</h2>
<h5 align="center">If you are on a Windows host, you at the moment like others on other operating systems, have a choice when it comes to hosting virtual machines. The program you decide to use, has a Type. The idea of a Type 1 or Type 2 hypervisor, is simply the level of granular control you have over the guest. There is much debate on what defines a Type 1 hypervisor. Regardless of your opinion on what makes a Type 1 or 2 hypervisor specifically that, we are all unanimously in agreement that VirtualBox and VMWare Player/Workstation, are Type 2 hypervisors.</h5>

<h5 align="center">QEMU is a Type 1 hypervisor program. What this means for programs that are Type 2, is that you lack a very crucial feature: PCI Object/Device Passthrough. When you're creating virtual machines, we want to keep in mind that they are full machines. They have their own motherboard, their own CPU, their own RAM, their own disk drives, their own ethernet controller, their own USB Controllers. When you start a Machine in a program like VirtualBox, you are given a Machine that has its set of hardware. The most notable here is the Virtual Display. This is what you're seeing in the Window. A fake emulated display/screen, is connected to an emulated graphics card or device.</h5>

<h5 align="center">This is what is limiting everyone on Type 2. macOS, has never had kexts for your emulated graphics card. Programs like VMWare Workstation, have VMWare Tools that actually have drivers/kexts written by VMWare for OS X / macOS that adds support for their emulated graphics card, the "VMWare SVGA-II". This allows VMWare to provide what is called a "Basic Framebuffer". This is a step above No Acceleration. Unfortunately, that is as far as that can go, because you still lack Metal API support.</h5>

<h5 align="center">So here's where Linux and QEMU step in. On Linux, every device you have can potentially be PCI/PCIe based. Which means it appears in your systems IOMMU table. Devices in this table, can be given to Virtual Machines! This is thanks to many Linux Kernel Modules such as VFIO. This opens the world for us to create some incredibly powerful virtual machines, by giving them physical hardware! We can now take an emulated Virtual Machine, accelerate it with KVM (Kernel-Based Virtual Machine) so that it becomes Virtualization, and then we give it real physical devices! The most obvious is a real AMD dGPU. This immediately gives your Virtual Machine real full acceleration, it's genuinely a speck of dust away from native. Other non typical devices you wouldn't expect are USB Controllers! Yes, QEMU and many other programs have emulated USB Controllers, but they are unfortunately not USB Compliant, and lack the ability to transfer complex data, such as that from the Lighting to USB-C/USB cable from an iPhone for syncing!</h5>
<br>

<h2 align="center">Do I have to read everything then?</h2>
<h5 align="center">The Docs are broken up into nice sections for easily going through the process. In the next page you'll learn more about how to use the information here! It is not possible to say that you'll need to read all of them, as it will heavily depend on your harware but for the most part, the standardization of DarwinKVM allows for minimal post-setup.</h5>
<br>

<h2 align="center">How does DarwinKVM work on the latest macOS?</h2>

<h5 align="center"><b>In this repository you're provided with:</b></h5>

1. [**DarwinKVM.xml**](https://github.com/royalgraphx/DarwinKVM/blob/main/DarwinKVM.xml), which is a prepared Virt-Manager importable XML.
   - Uses latest Q35 Machine Type provided by QEMU.
   - Uses Intel Cascade Lake CPU Vendor String.
   - Added Apple SMC chip for DSMOS, with it's key.
   - Stripped of redundant controllers and devices.
   - Disabled ACPI PCI Hotplug with Bridge Support.
   - Instructions for maximizing performance for your system.

2. [**DarwinOCPkg**](https://github.com/royalgraphx/DarwinOCPkg), a fork of [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg) for KVM's.
   - ACPI Folder preconfigured with SSDT's for QEMU Q35 Virtual Machines.
   - OpenHfs+ shipped by default, but can swap out to [Hfs+](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi)
   - Config.plist contains patches for QEMU/KVM Q35 Virtual Machines.

3. [**DiskProvision**](https://github.com/royalgraphx/DiskProvision/)
   - Tool to create, delete, mount, and unmount FAT32 .img/qcow2 files.
   - Supports Linux hosts, and macOS hosts for easy virtual disk management.

4. [**DarwinFetch**](https://github.com/royalgraphx/DarwinFetch), an all-in-one Mac OS installer downloader and image builder.
   - Has support for downloading recoveryOS and Offline Installation disks.
   - Maintains a list of direct download links of Apple's CDN for OS X / macOS files.

<h5 align="center">We are creating a Cascade Lake Virtual Machine, which will use an OpenCore EFI .img we create with DiskProvision, that will then allow us to boot our custom Virtual Machine configuration and install macOS. Even though we are all following the same general outline... difference in hardware will still exist. Different GPU's, Audio Controllers, Host OS, Displays, IOMMU Groups... various things can and will be different so we must go in and further refine our machine. If for whatever reason you find something is broken on your system, take the time and effort to read the write-ups to continue perfecting your Virtual Machine.</h5>
<br>

<h2 align="center">How does DarwinKVM work on legacy Mac OS X?</h2>

<h5 align="center">In this repository depending on the architecture...</h5>
<br>

<h3 align="center"><b>For x86_64</b></h3>

1. [**DarwinLegacyKVM.xml**](https://github.com/royalgraphx/DarwinKVM/blob/main/DarwinLegacyKVM.xml), which is a prepared Virt-Manager importable XML.
   - Uses latest Q35 Machine Type provided by QEMU.
   - Uses Intel Westmere E56XX CPU Vendor String.
   - Can swap for Intel Celeron (Conroe/Merom) CPU Vendor String.
   - Added Apple SMC chip for DSMOS, with it's key.
   - Stripped of redundant controllers and devices.
   - Disabled ACPI PCI Hotplug with Bridge Support.
   - Requires the use of custom OvmfPkg for Legacy Darwin targets.

2. [**DarwinOCPkg**](https://github.com/royalgraphx/DarwinOCPkg), a fork of [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg) for KVM's.
   - ACPI Folder preconfigured with SSDT's for QEMU Q35 Virtual Machines.

3. [**DarwinUDK**](https://github.com/royalgraphx/DarwinUDK), a fork of [AUDK](https://github.com/acidanthera/audk) for KVM's.
   - Relaxed security settings which allow for loading of older OS X boot.efi's which are seen as unsafe to boot. This can be built without modification by DarwinKVM contributors.
   - Custom Boot Splash Icon for DarwinKVM representation.
   - Supports both Arch and Debian based distributions, comes with both Pacman and APT packages!

4. [**DarwinFetch**](https://github.com/royalgraphx/DarwinFetch), an all-in-one Mac OS installer downloader and image builder.
   - Has support for downloading older Legacy Offline Installation disks.
   - Maintains a list of direct download links of Apple's CDN for OS X / macOS files.

<h5 align="center">We are creating a Westmere E56XX (or Celeron Conroe/Merom) based Virtual Machine, which will use an OpenCore EFI .img we create with DiskProvision, that will then allow us to boot our custom Virtual Machine configuration and install legacy Mac OS X releases. Even though we are all following the same general outline... difference in hardware will still exist. Different GPU's, Audio Controllers, Host OS, Displays, IOMMU Groups... various things can and will be different so we must go in and further refine our machine. If for whatever reason you find something is broken on your system, take the time and effort to read the write-ups to continue perfecting your Virtual Machine.</h5>

<br>
<h3 align="center"><b>For PowerPC</b></h3>

1. [**DarwinPPC.xml**](https://github.com/royalgraphx/DarwinKVM/blob/main/DarwinPPC.xml), which is a prepared Virt-Manager importable XML.
   - Due to libvirtd's XML validation, lots of configuration has been moved to qemu:args.
   - Machine type set to mac99 for PowerMac3,1 SMBIOS information.
   - Stripped of redundant controllers and devices.
   - Instructions for defining disk images and variables.

2. [**DarwinFetch**](https://github.com/royalgraphx/DarwinFetch), an all-in-one Mac OS installer downloader and image builder.
   - Has support for downloading Mac OS X PowerPC Installation disks.
   - Maintains a list of known good bootable PowerPC disk images.

3. [**DiskProvision**](https://github.com/royalgraphx/DiskProvision/)
   - Tool to create, delete, mount, and unmount FAT32 .img/qcow2 files.
   - Supports Linux hosts, and macOS hosts for easy virtual disk management.

4. **DarwinPPC CLI Templates**
   - Folder containing templates for all PowerPC releases.
   - Preconfigured to load Installation Media provided by DarwinFetch
   - In-depth overview for user customizabilty

<h5 align="center">Simply put, we can utilize Virt-Manager or CLI QEMU to organize multiple PowerPC versions, we utilize the mac99 machine type to boot various validated install images that boot properly. Includes information for manually running in CLI and customizing variables of the virtual machine in Virt-Manager.</h5>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="02-Requirements.html">&larr; Back</a>
    <a class="nav-button" href="04-DocsExplained.html">Next Page &rarr;</a>
  </div>
  <br>
</h2>
