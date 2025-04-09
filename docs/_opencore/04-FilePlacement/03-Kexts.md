---
layout: default
title: Kexts
description: "Placeholder"
parent: EFI Layout Config
nav_order: 3
has_children: false
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

  .top-button {
    margin: 10px;
    align: center;
  }

</style>

<p align="center">
  <img width="650" height="200" src="../../../assets/Headers/Header-Kexts.png">
</p> 

<p align="center">For those starting off, it's highly recommended to only use the following kexts to simply boot and install OS X / macOS until you reach the desktop. Below are the most basic required Kexts.</p>

| Kext | Target | Description |
| ----- | ----- | ----- |
| [Lilu](https://github.com/acidanthera/Lilu) | All | A "patch engine", a lot of kexts depend on it for patching frameworks at kernel runtime. Required for AppleALC, WhateverGreen, VMHide and many other kexts. Without Lilu, they will fail to inject. |
| [VMHide](https://github.com/Carnations-Botanica/VMHide) | MacPro7,1 | This must be used if you are planning to run macOS Sequoia (15) or Sonoma (14). Apple ID will not work without this on Sequoia and Bluetooth won't work on Sonoma. |
| [AppleMCEReporterDisabler](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip) | MacPro7,1 | Required on macOS Monterey (12.3+ and newer) on QEMU KVM VMs. |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-Drivers">&larr; Back Page</a>
    <a class="nav-button" href="../04-Resources">Next Page &rarr;</a>
  </div>
  <br>
</h2>

<hr>
<h2 align="center">Other applicable Kexts</h2>

{: .important }
> **Once you've reached the desktop and are preparing for GPU Passthrough**, come back and check with the hardware you'll be passing through if you need any Kexts.
> 
> If this is your first time going through the Docs, you can feel free to read and learn, but you do not need to add any more kernel extensions than the above.
> 
> For example, Samsung NVMe should be using NVMeFix.kext for better voltage and temperature management by macOS.
> 

{: .note }
Kexts like NVMeFix will **NOT** make unsupported NVMes work on macOS. Ensure your chipset is supported before doing NVMe Passthrough. For NootRX, use if using an AMD RX 67XX GPU. WhateverGreen is required for Navi 10 and older.

| Kext  | Status | Description |
| ----- | ----- | ----- |
| [NootRX](https://github.com/ChefKissInc/NootRX) | Required | Used for patching rDNA 2 GPUs, this should not be mixed with WhateverGreen. This is required for AMD RX 67XX GPUs to achieve experimental acceleration. |
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | Required | Used for graphics patching, DRM fixes, board ID checks, framebuffer fixes, etc; mostly only NVIDIA GPUs and older AMD GPUs (GCN 1-3, Polaris, maybe Vega) benefit from this kext. Required by Navi 10 GPUs for Pikera patch. |
| [NVMeFix](https://github.com/acidanthera/NVMeFix) | Optional | NVMeFix is a set of patches for the Apple NVMe storage driver, IONVMeFamily. Its goal is to improve compatibility and power management with non-Apple SSDs. Will not support unsupported chipsets. |
| [AppleALC](https://github.com/acidanthera/AppleALC) | Optional | Used for [Motherboard Audio](), Additional setup required! |
| [RestrictEvents](https://github.com/acidanthera/RestrictEvents) | Optional | Lilu plugin for blocking unwanted processes causing compatibility issues on different hardware and unlocking the support for certain features restricted to other hardware. We will use it for changing the name of the CPU cosmetically and fixing Bluetooth support on macOS Sonoma (14). |

<h2 align="center">
  <div>
    <a class="top-button" href="#">&uarr; Go to Top &uarr;</a>
  </div>
  <br>
</h2>
