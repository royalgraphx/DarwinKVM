---
layout: default
title: Kexts
parent: OpenCore Files Overview
nav_order: 4
---

# Kexts
#### This section has been derived from the <a href="https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts">Kexts</a> section via <a href="https://dortania.github.io/OpenCore-Install-Guide/ktext.html">Gathering files</a>. It may be out of date. Please refer to latest documentation when possible.

Here is a basic chart of a Kext, its use, and the status of the requirement. 

For those starting off, it's highly recommended to only use the following kexts to simply boot and install Mac OS X / macOS.

| Kext | Target | Description |
| ----- | ----- | ----- |
| [AppleMCEReporterDisabler](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip) | MacPro7,1 | Required on macOS 12.3 and later on AMD systems and dual-socket Intel systems, and on KVM VMs. |
| [Lilu](https://github.com/acidanthera/Lilu) | All Configurations | A "patch engine", a lot of kexts depend on it for patching frameworks at kernel runtime. Required for AppleALC, WhateverGreen, VirtualSMC and many other kexts. Without Lilu, they will fail to inject. |

**Once you've reached the desktop and are preparing for GPU Passthrough**, come back and check with the hardware you'll be passing through if you need any Kexts. 

For example, Samsung NVMe should be using NVMeFix.kext for better voltage and temperature management by macOS.

| Kext  | Status | Description |
| ----- | ----- | ----- |
| [Lilu](https://github.com/acidanthera/Lilu) | Required | A "patch engine", a lot of kexts depend on it for patching frameworks at kernel runtime. Required for AppleALC, WhateverGreen, VirtualSMC and many other kexts. Without Lilu, they will fail to inject. |
| [AppleMCEReporterDisabler](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip) | Required | Required on macOS 12.3 and later on AMD systems and dual-socket Intel systems, and on KVM VMs. |
| [VMHide](https://github.com/Carnations-Botanica/VMHide) | Required | This must be used if you are planning to run macOS Sequoia. Apple ID will not work without this. |
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | Recommended | Used for graphics patching, DRM fixes, board ID checks, framebuffer fixes, etc; mostly only NVIDIA GPUs and older AMD GPUs (GCN 1-3, Polaris, maybe Vega) benefit from this kext. |
| [NootRX](https://github.com/ChefKissInc/NootRX) | Recommended | Used for patching rDNA 2 GPUs, this should not be mixed with WhateverGreen. |
| [NVMeFix](https://github.com/acidanthera/NVMeFix) | Optional | NVMeFix is a set of patches for the Apple NVMe storage driver, IONVMeFamily. Its goal is to improve compatibility and power management with non-Apple SSDs. |
| [RestrictEvents](https://github.com/acidanthera/RestrictEvents) | Optional | Lilu plugin for blocking unwanted processes causing compatibility issues on different hardware and unlocking the support for certain features restricted to other hardware. We will use it for changing the name of the CPU cosmetically and fixing Bluetooth support on macOS Sonoma. |
| [VirtualSMC](https://github.com/acidanthera/VirtualSMC) | Optional | Emulates the SMC chip found on real macs, but we are already emulating it from the XML file, only use it for kexts that send temperature info to the SMC, like SMCRadeonGPU. |
| [RadeonSensor](https://github.com/NootInc/RadeonSensor) | Optional | Kext and Gadget to show AMD GPU temperature on macOS. |
| [AppleALC](https://github.com/acidanthera/AppleALC) | Optional | Used for [Motherboard Audio](../../../writeups/05-MotherboardAudio/index), Additional setup required! |

## You can now continue to the next <a href="../04-Tools">page</a>.
