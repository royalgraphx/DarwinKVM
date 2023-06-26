---
layout: default
title: Welcome
nav_order: 1
description: "Landing page for DarwinKVM Documentation!"
permalink: /
---

<style>
  .alignment_img {
    position: relative;
    left: -10px;
  }

  .alignment_img_alt {
    position: relative;
    left: -8px;
    bottom: +15px;
  }
</style>

<p align="center">
  <img src="./assets/DarwinKVMLogo.png" width="40%" height="40%" class="alignment_img">
</p>

<p align="center">
  <img width="650" height="200" src="./assets/HeaderTextOnly.png" class="alignment_img_alt">
</p>

<h4 align="center">Features: Clean EFI Template for maximum customizability before boot, Compatibility with RisingPrism's Single GPU Passthrough, DisplayOverrides for repairing incompatible monitors, Custom Memory Mapping, Custom USB Mapping, Fake Core Count for incompatible CPU Topology, Host CPU Overclocking, Host Network Bridge for VM visibility, AMD GPU Zero-RPM Disable and custom sPPT Fan Curve! as well as many more advanced tutorials ready to further perfect your experience!</h4>

<h1 align="center">Requirements</h1>

* A compatible graphics card. <b>This is a must, don't bother if you're not getting GPU Accel.</b> please reference this [list](https://dortania.github.io/GPU-Buyers-Guide/) to verify.
  * There are some exceptions, if you're crazy and want to use a legacy NVIDIA GPU, please reference this [list](https://elitemacx86.com/threads/nvidia-gpu-compatibility-list-for-macos.614/) to check macOS/OCLP compatibility. If it's supported, there is a section down for Legacy NVIDIA Patching.

* A modern Linux distribution. E.g. Arch Based for the latest packages, my personally tested and working are:
  * EndeavourOS
  * ArcoLinuxB Plasma
  * Pure Arch

* A CPU with Intel VT-x or AMD SVM support is required (`grep -e vmx -e svm /proc/cpuinfo`)

* A CPU with SSE4.1 support is required for >= macOS Sierra

* A CPU with AVX2 support is required for >= macOS Ventura; but you can bypass the limitation with CryptexFixup as of now.

* Previous experience creating an EFI for your bare metal system and/or reading/understanding the [Dortania OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/)

* Various Software/Packages, some optional, some not:
  * qemu
  * libvirtd/virtmanager
  * Python 3 installed with the tkinter package
  * dmg2img
  * qemu-img
  * [RisingPrism's Single GPU Passthrough Scripts](https://gitlab.com/risingprismtv/single-gpu-passthrough)
  * [ProperTree](https://github.com/corpnewt/ProperTree)
  * [GenSMBios](https://github.com/corpnewt/GenSMBIOS)
  * [Hackintool](https://github.com/benbaker76/Hackintool)
  * [SSDTTime](https://github.com/corpnewt/SSDTTime)

<br>

* <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for completing it!</b>

<h1 align="center">Table of Contents</h1>


- What is this for?

- Who is this for?

- Host Preparations
  - Part 1 - BIOS Settings
  - Part 2 - GRUB Configuration
  - Part 3 - Bridge Networking
    - A. Goal Examples
    - B. Prerequisites to the script
  - Part 4 - Package Installation
  - Part 5 - Libvirtd Configuration
    - A. Modifying Files
    - B. Libvirt Services

- OpenCore Configuration
  - Part 0 - Image Creation
  - Part 1 - ACPI Tables
  - Part 2 - Drivers
  - Part 3 - Kexts
  - Part 4 - Tools

- Config.plist Configuration
  - Part 0 - Required Tools / Brief Overview
  - Part 1 - ACPI
  - Part 2 - Booter
  - Part 3 - Device Properties
  - Part 4 - Kernel
  - Part 5 - Misc
  - Part 6 - NVRAM
  - Part 7 - Platform Info
  - Part 8 - UEFI

- Congratulations! EFI Complete

- Fetching BaseSystem.dmg
  - Part 0 - Required Tools / Brief Overview
  - Part 1 - Usage

- Installing macOS
  - Part 0 - Importing the XML to Virt-Manager
  - Part 1 - Configure VirtIO Display
  - Part 2 - Configure OpenCore VirtIO Drive
  - Part 3 - Configure VirtIO NIC
  - Part 4 - Review!
  - Part 5 - Installation

- Single GPU Passthrough
  - Part 1 - Installation
  - Part 2 - Hook Modification
  - Part 3 - Virt-Manager Modifications

- Thanks for reading!


<h1>You can now proceed to the <a href="docs/01-About.html">About</a> section!</h1>