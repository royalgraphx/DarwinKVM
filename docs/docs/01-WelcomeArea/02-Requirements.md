---
layout: default
title: Requirements
parent: Welcome to DarwinKVM!
nav_order: 3
---

<style>
  .welcome-text {
      text-align: center;
      top: -30px;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../assets/HeaderRequirements.png">
</p>

<h2 class="welcome-text">While running macOS is possible on a variety of hardware, for DarwinKVM you will require most, if not all of the following:</h2>

1. **A Compatible Graphics Card.**
   - <span style="color: #ffab52;">This is a must, don't bother if you're not getting GPU Acceleration, it's not worth it.</span>
     - Eventually we will add support for those without supported GPU's, but highly experimental.
   - [AMD GPU Support Table](../../infocenter/02-GPUSupport/01-AMD/) - Recommended for all, runs latest macOS.
   - [NVIDIA GPU Support Table](../../infocenter/02-GPUSupport/01-AMD/) - For Legacy OS X. <span style="color: #ffab52;">Highest Supported Version: High Sierra</span>

2. **A Host running a Linux Distribution.**
   - For best results, an Arch based distribution is recommended.
   - Some confirmed working hosts are as follows:
     - [Arch Linux](https://archlinux.org/download/)
     - [EndeavourOS](https://endeavouros.com/)
     - [ArcoLinux Plasma](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/)

3. **CPU Minimum Requirements:**
   - Virtualization Support
     - Intel VT-x Enabled in BIOS
     - AMD SVM Enabled in BIOS
   - CPU Instruction Set Support
     - SSE4 for >= Sierra
     - SSE4.1 for >= Mojave
     - <span style="color: #ffab52;">AVX2 support is required for >= macOS Ventura</span>
       - You can bypass the limitation with [CryptexFixup](https://github.com/acidanthera/CryptexFixup) as of now.

4. **Previous OpenCore Experience is helpful!**
   - Experience creating an EFI for your baremetal system.
   - Reading/Understanding of the config.plist by OpenCore.

4. **Patience! Lots of it.**<span style="color: #ffab52;"> **It's worth it.**</span>

<h2 align="center">You can now proceed to the <a href="03-SettingExpectations.html">Setting Expectations</a> section!</h2>
