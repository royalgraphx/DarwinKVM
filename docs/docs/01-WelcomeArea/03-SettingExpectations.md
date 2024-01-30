---
layout: default
title: Setting Expectations
parent: Welcome to DarwinKVM!
nav_order: 4
---

<p align="center">
  <img width="650" height="200" src="../../assets/HeaderSettingExpectations.png">
</p>

<h2 align="center">Virtual or Bare Metal?</h2>

<h5 align="center">A Virtual Machine is no different but carries several advantages for those on AMD CPU's as it is possible to spoof to an Intel CPU Vendor String, fixing several issues that can occur with software such as Discord or various Adobe applications. If you are on an Intel CPU, but find that you are on an unsupported generation or have hardware on your motherboard that you cannot get around, utilizing DarwinKVM will allow you to simply require a supported GPU.</h5>

<h2 align="center">What are the differences between this and other similar projects?</h2>

<h5 align="center">The major distinction is that this is not something you can use right away, as you must read a fair amount first. Virt-Manager, QEMU, GPU Passthrough, OpenCore, Kexts, config.plist, OVMF... these things already exist. They're all either software/files, guides, or concepts of Linux/macOS. We're putting all of these things together.</h5>

<h2 align="center">Do I have to read everything then?</h2>

<h5 align="center">The Docs are broken up into nice sections for easily going through the process. In the next page you'll learn more about how to use the information here! It is not possible to say that you'll need to read all of them, as it will heavily depend on your harware but for the most part, the standardization of DarwinKVM allows for minimal post-setup.</h5>

<h2 align="center">How does DarwinKVM work on the latest macOS?</h2>

<h5 align="center">In this repository you're provided with:</h5>

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
   - Includes legacy bash scripts which can be read for manual management.

<h5 align="center">We are creating a Cascade Lake Virtual Machine, which will use an OpenCore EFI .img we create with DiskProvision, that will then allow us to boot our custom Virtual Machine configuration and install macOS. Even though we are all following the same general outline... difference in hardware will still exist. Different GPU's, Audio Controllers, Host OS, Displays, IOMMU Groups... various things can and will be different so we must go in and further refine our machine. If for whatever reason you find something is broken on your system, take the time and effort to read the write-ups to continue perfecting your Virtual Machine.</h5>

<h2 align="center">How does DarwinKVM work on legacy Mac OS X?</h2>

<h5 align="center">In this repository you're provided with:</h5>

```
// TODO
```

<h5 align="center">Thank you for reading. I wish you success in your attempt!</h5>

<h2 align="center">You can now proceed to the <a href="04-DocsExplained.html">Docs Layout</a> page!</h2>
