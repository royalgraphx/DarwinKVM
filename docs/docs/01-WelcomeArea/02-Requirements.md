---
layout: default
title: Requirements
parent: Welcome
nav_order: 3
---

<style>
  .welcome-text {
      text-align: center;
      top: -30px;
  }

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
  <img width="650" height="200" src="../../assets/Headers/HeaderRequirements.png">
</p>

<h2 class="welcome-text">While running macOS is possible on a variety of hardware, for DarwinKVM you will require most, if not all of the following:</h2>

1. **A Compatible Graphics Card.**
   - <span style="color: #bfa6ff;">This is a must, don't bother if you're not getting GPU Acceleration, it's not worth it.</span>
     - Eventually we will add support for those without supported GPU's, but highly experimental.
   - [AMD GPU Support Table](../../infocenter/02-GPUSupport/01-AMD/) - Recommended for all, runs latest macOS and older OS X releases.
   - [NVIDIA GPU Support Table](../../infocenter/02-GPUSupport/02-NVIDIA/) - For Legacy OS X. <span style="color: #bfa6ff;">Highest Supported Version: High Sierra</span> 
   - [Intel iGPU Support Table](../../infocenter/02-GPUSupport/03-Intel) - For Intel Laptops/Desktops with GVT-d/IOMMU/MUX Support

2. **A Host running a Linux Distribution.**
   - For best results, an Arch based distribution is recommended.
   - Some confirmed working hosts are as follows:
     - [Arch Linux](https://archlinux.org/download/)
     - [EndeavourOS](https://endeavouros.com/)
     - [ArcoLinux Plasma](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/)
     - [Fedora Linux](https://fedoraproject.org/workstation/)

3. **CPU Minimum Requirements:**
   - Virtualization Support
     - Intel VT-x Enabled in BIOS
     - AMD SVM Enabled in BIOS
   - CPU Instruction Set Support
     - SSE4 for >= Sierra
     - SSE4.1 for >= Mojave
     - <span style="color: #bfa6ff;">AVX2 support is required for >= macOS Ventura</span>
       - You can bypass the limitation with [CryptexFixup](https://github.com/acidanthera/CryptexFixup) as of now.

4. **Previous OpenCore Experience is helpful!**
   - Experience creating an EFI for your baremetal system.
   - Reading/Understanding of the config.plist by OpenCore.

4. **Patience! Lots of it.**<span style="color: #bfa6ff;"> **It's worth it.**</span>

<br>
<h2 class="welcome-text">If you're interested in DarwinPPC, the following is enough:</h2>

1. **A Host capable of running qemu-system-ppc.**
   - Virtualization (KVM Mode) only supported on PowerPC Hosts. Yes, they still exist. 
   - For best results, an Arch based distribution is recommended.
   - <span style="color: #bfa6ff;">Utilizing Virt-manager is optional</span>, this means <span style="color: #bfa6ff;">Windows hosts can use the CLI instructions</span>.
   - Sound is known to not work and slow down emulation.

2. **Previous PowerMac and QEMU Experience is helpful!**
   - Experience using legacy OS X releases for PowerPC in general.
   - Understanding the management of drives in Virt-Manager/CLI.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="01-About.html">&larr; Back</a>
    <a class="nav-button" href="03-SettingExpectations.html">Next Page &rarr;</a>
  </div>
  <br>
</h2>
