---
layout: default
title: Requirements
description: "While running macOS is possible on a variety of hardware... DarwinKVM will require most, if not all of the following for proper usage."
parent: Welcome
nav_order: 2
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

<h2 class="welcome-text">While running macOS is possible on a variety of hardware...</h2>
<h3 class="welcome-text">DarwinKVM will require most, if not all, of the following for proper usage:</h3>

1. **Compatible Dedicated Graphics Card.**
   - **<span style="color: #fa2819;">This is a must. If you are not on a Desktop, you cannot use DarwinKVM.</span>**
     - Read more on this requirement later when checking your dGPUs support chart.
   - [AMD GPU Support Table](../../host/03-CompatibilityCharts/02-GPU/01-AMD/) - Recommended <span style="color: #bfa6ff;">(Runs Legacy OS X and modern macOS)</span>
   - [NVIDIA GPU Support Table](../../host/03-CompatibilityCharts/02-GPU/02-NVIDIA/) - For Legacy OS X <span style="color: #bfa6ff;">(High Sierra (10.13) or older)</span>

2. **A Desktop/PC Host running a Linux Distribution.**
   - For best results, an Arch based distribution is recommended for latest packages.
   - Usage of a Desktop is due to the dedicated GPU needing to be wired via PCIe
   - Some Laptops have hardware MUX switches, which will reroute the display.
   - Some confirmed working hosts are as follows:
     - [Arch Linux](https://archlinux.org/download/)
     - [Debian](https://www.debian.org/)
     - [Ubuntu](https://ubuntu.com/)
     - [Linux Mint](https://linuxmint.com/)
     - [Fedora Linux](https://fedoraproject.org/workstation/)
     - [Nobara Project](https://nobaraproject.org/)

3. **Host CPU Features Minimum Requirements:**
   - Confirm Virtualization Support enabled in BIOS
     - Intel VT-x
     - AMD SVM
   - CPU Instruction Set Support:
     - SSE4 for >= Sierra (10.12)
     - SSE4.1 for >= Mojave (10.14)
     - <span style="color: #bfa6ff;">AVX2 for >= Ventura (13)</span>
       - You can bypass the limitation with [CryptexFixup](https://github.com/acidanthera/CryptexFixup) as of now.
       - Usage of CF will not bypass the requirement of AVX2 for GPU usage.

4. **Previous OpenCore Experience is helpful!**
   - Experience creating an EFI for your baremetal system.
   - Reading/Understanding of the config.plist by OpenCore.
   - Experience using the various tools in the community.

4. **Patience! lots of it.**<span style="color: #bfa6ff;"> **It's worth it.**</span>

<br>
<details markdown="block">
<summary>If you're interested in DarwinPPC for PowerMac versions, the following is enough:</summary>

1. **A Host capable of running qemu-system-ppc.**
   - Virtualization (KVM Mode) only supported on PowerPC Hosts. Yes, they still exist. 
   - For best results, an Arch based distribution is recommended.
   - <span style="color: #bfa6ff;">Utilizing Virt-manager is optional</span>, this means <span style="color: #bfa6ff;">Windows hosts can use the CLI instructions</span>.
   - Sound is known to not work and slow down emulation.

2. **Previous PowerMac and QEMU Experience is helpful!**
   - Experience using legacy OS X releases for PowerPC in general.
   - Understanding the management of drives in Virt-Manager/CLI.

</details>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="01-About.html">&larr; Back</a>
    <a class="nav-button" href="03-SettingExpectations.html">Next Page &rarr;</a>
  </div>
  <br>
</h2>
