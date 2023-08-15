---
layout: default
title: Welcome
nav_order: 1
description: "An advanced guide to run the latest macOS on QEMU/KVM with libvirtd/Virt-Manager, Includes GPU Passthrough, and various write-ups."
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

* A compatible graphics card. <b>This is a must, don't bother if you're not getting GPU Accel.</b> please reference this <a href="docs/11-GPUSupport/01-AMD">chart</a> to verify.
  * There are some exceptions, if you're crazy and want to use a legacy NVIDIA GPU, please reference this <a href="docs/11-GPUSupport/02-NVIDIA">chart</a> to check macOS/OCLP compatibility. If it's supported, there is a writeup for Legacy NVIDIA Patching.

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

* <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for completing it!</b>

# Support

If you run into any issues, you can join the DarwinKVM Discord server! Feel free to ping the @Helpers role within a help channel for support, and [Hexley](https://github.com/royalgraphx/Hexley), the one and only bot provides our discord users with a multitude of commands to assist anyone who may need specific actions performed.

<iframe src="https://discord.com/widget?id=1131552514412654683&theme=dark" width="400" height="300" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>

<h1>You can now proceed to the <a href="docs/01-About.html">About</a> section!</h1>