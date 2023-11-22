---
layout: default
title: Part 3 - Kexts
parent: Gathering Files
nav_order: 4
---

# Kexts
#### This section has been derived from the <a href="https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts">Kexts</a> section via <a href="https://dortania.github.io/OpenCore-Install-Guide/ktext.html">Gathering files</a>. It may be out of date. Please refer to latest documentation when possible.

Here is a basic chart of a Kext, its use, and the status of the requirement. Check with the hardware you'll be passing through if you need any Kexts. For example, Samsung NVMe should be using NVMeFix.kext for better voltage and temperature management by macOS.

| Kext  | Status | Description | 
| ----- | ----- | ----- |
| [Lilu](https://github.com/acidanthera/Lilu) | Required | A "patch engine", a lot of kexts depend on it for patching frameworks at kernel runtime. Required for AppleALC, WhateverGreen, VirtualSMC and many other kexts. Without Lilu, they will fail to inject. |
| [AppleMCEReporterDisabler](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip) | Required | Required on macOS 12.3 and later on AMD systems and dual-socket Intel systems, and on KVM VMs. |
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | Recommended | Used for graphics patching, DRM fixes, board ID checks, framebuffer fixes, etc; mostly only NVIDIA GPUs and older AMD GPUs (GCN 1-3, Polaris, maybe Vega) benefit from this kext. |
| [NootRX](https://github.com/ChefKissInc/NootRX) | Recommended | Used for patching rDNA 2 GPUs, this should not be mixed with WhateverGreen. |
| [NVMeFix](https://github.com/acidanthera/NVMeFix) | Recommended | NVMeFix is a set of patches for the Apple NVMe storage driver, IONVMeFamily. Its goal is to improve compatibility and power management with non-Apple SSDs. |
| [RestrictEvents](https://github.com/acidanthera/RestrictEvents) | Recommended | Lilu plugin for blocking unwanted processes causing compatibility issues on different hardware and unlocking the support for certain features restricted to other hardware. We will mainly use it for changing the name of the CPU cosmetically. |
| [VirtualSMC](https://github.com/acidanthera/VirtualSMC) | Optional | Emulates the SMC chip found on real macs, but we are already emulating it from the XML file, only use it for kexts that send temperature info to the SMC, like SMCRadeonGPU. |
| [RadeonSensor](https://github.com/NootInc/RadeonSensor) | Optional | Kext and Gadget to show AMD GPU temperature on macOS. |
| [AppleALC](https://github.com/acidanthera/AppleALC) | Optional | Used for [Motherboard Audio](../../writeups/04-MotherboardAudio/index), Additional setup required! |

## You can now continue to the next <a href="04-Tools.html">page</a>.