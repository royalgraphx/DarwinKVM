---
layout: default
title: Welcome to DarwinKVM
nav_order: 1
description: "An advanced guide to run the latest macOS on QEMU/KVM with libvirtd/Virt-Manager, Includes GPU Passthrough, and various write-ups for deep customization."
permalink: /
---

<style>
  .alignment_img {
    position: relative;
    top: +7px;
    left: -4px;
  }

  .alignment_img_alt {
    position: relative;
    left: -5px;
    bottom: +10px;
  }
</style>

<p align="center">
  <img src="./assets/DarwinKVMLogo.png" width="40%" height="40%" class="alignment_img">
</p>

<p align="center">
  <img width="650" height="200" src="./assets/HeaderTextOnly.png" class="alignment_img_alt">
</p>

<h2 align="center">Focused on helping create the best experience.</h2>

<h1 align="center">Requirements</h1>

* A compatible graphics card. <b>This is a must, don't bother if you're not getting GPU Accel.</b> please reference this <a href="docs/11-GPUSupport/01-AMD">chart</a> to verify.
  * There are some exceptions, if you're crazy and want to use a legacy NVIDIA GPU, please reference this <a href="docs/11-GPUSupport/02-NVIDIA">chart</a> to check macOS/OCLP compatibility. If it's supported, there is a writeup for Legacy NVIDIA Patching.

* A modern Linux distribution. E.g. Arch Based for the latest packages. My personally tested and working list is:
  * EndeavourOS
  * ArcoLinuxB Plasma
  * Pure Arch

* A CPU with Intel VT-x or AMD SVM support is required (`grep -e vmx -e svm /proc/cpuinfo`)

* A CPU with SSE4.1 support is required for >= macOS Sierra

* A CPU with AVX2 support is required for >= macOS Ventura; but you can bypass the limitation with CryptexFixup as of now.

* Previous experience creating an EFI for your bare metal system and/or reading/understanding the [Dortania OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/).

* Various Software/Packages. some optional, some not.

* <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for completing it!</b>

<h1 align="center">Support</h1>

<p align="center">If you run into any issues, you can join the DarwinKVM Discord server! Feel free to ping the @Helpers role within a help channel for support, and <a href="https://github.com/royalgraphx/Hexley">Hexley</a>, the one and only bot provides our discord users with a multitude of commands to assist anyone who may need specific actions performed.</p>

<div style="display: flex; justify-content: center; align-items: center;">
    <iframe src="https://discord.com/widget?id=1131552514412654683&theme=dark" width="400" height="300" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
</div>

<h2 align="center">You can now proceed to the <a href="docs/01-About.html">About</a> section!</h2>