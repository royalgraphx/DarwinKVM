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
| [Lilu](https://github.com/acidanthera/Lilu/releases) | Required | A kext to patch many processes, required for AppleALC, WhateverGreen, VirtualSMC and many other kexts. Without Lilu, they will not work. |
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen/releases) | Required | Used for graphics patching, DRM fixes, board ID checks, framebuffer fixes, etc; all GPUs benefit from this kext. |
| [AppleMCEReporterDisabler](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip) | Required | Required on macOS 12.3 and later on AMD systems and dual-socket Intel systems, and on KVM. |
| [RestrictEvents](https://github.com/acidanthera/RestrictEvents/releases) | Recommended | Lilu plugin for blocking unwanted processes causing compatibility issues on different hardware and unlocking the support for certain features restricted to other hardware. Serves as a workaround for "Memory Modules Misconfigured" warning, among other issues. Can be used cosmetically for changing the name of the CPU. |
| [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases) | Optional | Emulates the SMC chip found on real macs, but we are already emulating it from the XML file, this might be useful for kexts that send temperature info to the SMC, like SMCRadeonGPU. |
| [AppleALC](https://github.com/acidanthera/AppleALC) | Optional | Used for [Front Panel Audio](../../writeups/04-FrontPanelAudio/index), Additional setup required! |
| [NVMeFix](https://github.com/acidanthera/NVMeFix/releases) | Optional | NVMeFix is a set of patches for the Apple NVMe storage driver, IONVMeFamily. Its goal is to improve compatibility with non-Apple SSDs. It may be used both on Apple and non-Apple computers. Note: Does not work on Sonoma as of now. |
| [RadeonSensor](https://github.com/NootInc/RadeonSensor/releases) | Optional | Kext and Gadget to show AMD GPU temperature on macOS. |
| [AGPMInjector](https://github.com/Pavo-IM/AGPMInjector/releases) | Optional | Injects AGPM (Apple Graphics Power Management) to our non-Apple GPUs. |

## You can now continue to the next <a href="04-Tools.html">page</a>.
