---
layout: default
title: Welcome to DarwinKVM
nav_order: 1
description: "An advanced guide to run macOS on QEMU/KVM with libvirtd/Virt-Manager."
permalink: /
---

<style>
  .alignment_img {
    position: relative;
    top: +7px;
    left: -12px;
  }

  .alignment_img_alt {
    position: relative;
    bottom: +10px;
    left: -9px;
  }

  .tagline {
      text-align: center;
      top: -65px;
  }

  .requirements {
      text-align: center;
      top: -35px;
  }

  .support {
      text-align: center;
      top: -20px;
  }
</style>

<p align="center">
  <img src="./assets/DarwinKVMLogo.png" width="40%" height="40%" class="alignment_img">
</p>

<p align="center">
  <img width="650" height="200" src="./assets/HeaderTextOnly.png" class="alignment_img_alt">
</p>

<h3 class="tagline">An Advanced Guide for running macOS within QEMU/KVM</h3>

<h1 class="requirements">Requirements</h1>

* A compatible graphics card. <b>This is a must, don't bother if you're not getting GPU Accel.</b> please reference this <a href="docs/11-GPUSupport/01-AMD">chart</a> to verify.
  * There are some exceptions (This most likely does not apply to you, if you don't have an AMD GPU you're SOL for anything usable), if you're trying to run legacy versions of Mac OS X and want to use a legacy NVIDIA GPU, please reference this <a href="docs/11-GPUSupport/02-NVIDIA">chart</a> to check compatibility.

* A modern Linux distribution. For highest success rate, Arch Based for the latest packages. My personally tested and working list is as follows:
  * EndeavourOS
  * ArcoLinuxB Plasma
  * Pure Arch, with KDE/SDDM

* A CPU with Intel VT-x or AMD SVM support is required (`grep -e vmx -e svm /proc/cpuinfo`)

* A CPU with SSE4 for >= Sierra and SSE4.1 for >= Mojave.

* A CPU with AVX2 support is required for >= macOS Ventura; but you can bypass the limitation with CryptexFixup as of now.

* Previous experience creating an EFI for your bare metal system and/or reading/understanding the [Dortania OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/).

* Various Software/Packages. Some optional, some not.

* <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for creating it!</b>

<h1 align="center">Need Help?</h1>
<br>
<p align="center">If you run into any issues, you can join the <a href="https://discord.gg/ryQFC8Vk7b">DarwinKVM</a> Discord server! Feel free to ping the <span style="color: #d48dff;">@Helpers</span> role within a help channel for support. <a href="https://github.com/royalgraphx/Hexley">Hexley</a> provides our discord users with a multitude of commands to assist anyone who may need specific actions performed.</p>
<br>
<div style="display: flex; justify-content: center; align-items: center;">
    <iframe src="https://discord.com/widget?id=1131552514412654683&theme=dark" width="400" height="300" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
</div>

<h2 align="center">You can now proceed to the <a href="docs/01-About.html">About</a> section!</h2>
