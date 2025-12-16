---
layout: default
title: GPU Support Chart
parent: Compatibility Charts
nav_order: 2
has_children: true
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

  .intel-next-button-container,
  .nvidia-next-button-container {
    text-align: right;
  }

  .intel-next-button,
  .nvidia-next-button {
    margin: 10px;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../../../assets/Headers/HeaderGPUSupportCharts.png">
</p>

<h2 align="center">Important Notes!</h2>
<h2 align="center">Please make sure you read these before continuing.</h2>
<br>

{: .warning }
If you are on a Laptop, you are ineligable for DarwinKVM. Due to the nature of how Laptops are wired internally, it is unsupported as a hypervisor because the majority of mobile devices have the iGPU wired to the display, and operating systems such as Windows, use the dedicated GPU only for rendering by games and other software. If you discover your Laptop has a hardware-level MUX chip, to swap the internal display to the dedicated GPU, you may or may not be able to do PCIe passthrough. No support is given by the DarwinKVM team for Laptop configurations, please use a Desktop with a PCIe AMD dedicated GPU. We've only had one success reported from a Laptop user with an AMD RX 6600M with a hardware MUX chip.

{: .warning }
If you are wondering if you can passthrough an Intel iGPU to a guest, due to the nature of Shared VRAM/Memory and how iGPU architecture works to my understanding and taking in to account the custom QEMU build with OVMF combined with i915 firmware, it can be cumbersome to accomplish. Reports suggest that after extended usage, the guest crashes. This may be possible on other host operating systems like Proxmox or Unraid. AMD iGPU passthrough is not known to be possible, and those who have managed it, have not had success using NootedRed OOB without modification. No support is given by the DarwinKVM team for iGPU passthrough of any CPU brand. 

{: .warning }
If your card falls under the Blackwell (RTX 50XX), Hopper (Datacenter GPUs), Ada Lovelace (RTX 40XX), Ampere (RTX 30XX) or Turing (RTX 20XX / GTX 16XX) generations of NVIDIA branded GPUs, your card is completely unsupported. Your best options are using a supported Intel iGPU on baremetal, or purchasing an AMD dedicated Graphics Card if you are on an AMD CPU or Intel CPU newer than 10th Gen such as Rocket Lake. OpenCore Legacy Patcher will not solve this issue, RTX has never had any OS X or macOS support. (HS Release Date: 2017 / Turing (RTX) Release Date: 2018)

{: .headsup }
If you are intending to run macOS Tahoe (26) be aware that you will need a [custom build of WhateverGreen that the Carnations Botanica team has pushed](https://github.com/Carnations-Botanica/WhateverGreen/actions/runs/17772496735), as a quick fix for kernel panics in the recoveryOS and Update phases in the latest release. You shouldn't be using a GPU while booting recoveryOS on DarwinKVM anyways, but if you do regardless, be aware you cannot boot recoveryOS or go through the update phases with the default WhateverGreen.

{: .important }
The NVIDIA support charts are mainly here for legacy OS X users for preservation, such cases include but are not limited to: Audio Engineers, Film Editors, and Photographers using legacy licensed software. As of High Sierra (10.13), all NVIDIA GPUs were dropped from Mac OS X (except for Kepler which supported Metal 1, so was dropped after Big Sur). High Sierra is no longer viable as an operating system, and if you only have NVIDIA graphics, you cannot use modern macOS. To put it in perspective, High Sierra is 10.13 and was released in 2017. Catalina was the last 10.XX release, version 10.15 in 2019. Big Sur was 11.0 in 2020. The newest release is macOS Tahoe which released in 2025 and is version 26.0+ and barely any software supports High Sierra anymore.

{: .note }
The importance of these charts are to quickly reference what Graphics Processing Units are supported, what version they first began their support on, and the latest release that still have kernel extensions for said GPU. We also keep track of non supported GPUs to quickly reference they are not supported. This area is a major point of Pull Requests, help out if you can! We're interested in learning what GPUs work when spoofed as their supported counterparts. Please be aware that if you do not have a supported graphics card for OS X / macOS then you will be relying on VESA / VGA which is a fallback renderer.

{: .note }
When reading these support charts, keep in mind that the most powerful card of the generation is at the top, and it's sorted down by boost clock speed. When it comes to Intel iGPUs, it is similarly sorted. NVIDIA charts are also sorted by card number. This makes it really easy to quickly scroll down until you find your device.

<br>
<p align="center">Start by choosing the Brand of your GPU</p>

<h2 align="center">
  <br>
  <div class="nvidia-next-button-container">
    <a class="nvidia-next-button" href="../01-AMD">AMD &rarr;</a>
  </div>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-CPU">&larr; Back Page</a>
    <a class="nav-button" href="../02-NVIDIA">NVIDIA &rarr;</a>
  </div>
  <br>
</h2>
