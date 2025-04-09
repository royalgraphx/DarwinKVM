---
layout: default
title: AMD
parent: GPU Support Chart
grand_parent: Compatibility Charts
nav_order: 1
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
</style>

<p align="center">
  <img width="650" height="200" src="../../../../assets/Headers/HeaderAMDGPUSupport.png">
</p>

## Navi 23

{: .note }
Not much to say, this generation has native support OOB without the need for kexts.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6800S | Monterey (12) | Sequoia (15) | Theoretically. This is a mobile dGPU. |
| RX 6700S | Monterey (12) | Sequoia (15) | Theoretically. This is a mobile dGPU. |
| RX 6650 XT | Monterey (12) | Sequoia (15) | Needs device-id spoof to 0x73ff.<br> NootRX changes the Device-ID. |
| RX 6600 XT | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6600 LE | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6600S | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6600 | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6600M | Monterey (12) | Sequoia (15) | Rare on Laptops, but **does** work. |
| Radeon Pro W6600X | Monterey (12) | Sequoia (15) | May require a device-id spoof |
| Radeon PRO W6600 | Monterey (12) | Sequoia (15) | May require a device-id spoof |

## Navi 22

{: .headsup }
NootRX is required for these GPUs to function, they have no native macOS support.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6750 GRE | Monterey (12) | Sequoia (15) |  |
| RX 6750 XT | Monterey (12) | Sequoia (15) |  |
| RX 6700 XT | Monterey (12) | Sequoia (15) |  |
| RX 6700 | Monterey (12) | Sequoia (15) |  |

## Navi 21

{: .note }
WhateverGreen is recommended for these GPUs in the case of DRM issues.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon RX 6900 XTX | Big Sur (11) | Sequoia (15) |  |
| RX 6950 XT | Big Sur (11) | Sequoia (15) | Needs device-id spoof to 0x73bf.<br> NootRX changes the Device-ID. |
| RX 6900 XTXH | Big Sur (11) | Sequoia (15) | |
| RX 6900 XT | Big Sur (11) | Sequoia (15) |  |
| RX 6800 XT | Big Sur (11) | Sequoia (15) |  |
| Radeon PRO V620 | Big Sur (11) | Sequoia (15) | Theoretically. |
| Radeon PRO W6900X | Big Sur (11) | Sequoia (15) |  |
| Radeon PRO W6800 | Big Sur (11) | Sequoia (15) |  |
| RX 6800 | Big Sur (11) | Sequoia (15) |  |
| Radeon Pro W6800X Duo | Big Sur (11) | Sequoia (15) |  |
| Radeon Pro W6800X | Big Sur (11) | Sequoia (15) |  |

## Navi 10

{: .note }
WhateverGreen is required for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon Pro W5700X | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5700 XT 50th Anniversary | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5700 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5700XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5700 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5700 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5600 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5600 OEM | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro 5700 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5600 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5500 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5500 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5500 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |

## Vega 20

{: .note }
All Vega based dedicated GPUs are natively supported in OS X and macOS with support for Vega 20 GPUs starting in Mac OS X Mojave.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon Instinct MI60 | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon VII | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon Instinct MI50 | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon Pro Vega II Duo | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon Pro Vega II | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon Pro VII | Mojave (10.14.5) | Sequoia (15) |  |
| Radeon Pro V420 | Mojave (10.14.5) | Sequoia (15) |  |

## Vega 10

{: .note }
Vega 10 GPUs are natively supported in macOS. The only brand of GPUs to avoid with Vega 10 is XFX, due to VBIOS communication issues, which can't be easily solved with a reference BIOS flash as the Vega's PowerPlay Table interacts with the OS and GPU differently.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX Vega 64 Liquid Cooling | High Sierra (10.13) | Sequoia (15) |  |
| Vega Frontier Edition | High Sierra (10.13) | Sequoia (15) | Watercooled variant included |
| RX Vega Nano | High Sierra (10.13) | Sequoia (15) |  |
| RX Vega 64 Limited Edition | High Sierra (10.13) | Sequoia (15) |  |
| RX Vega 64 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro WX 9100 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro WX 8200 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro WX 8100 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro V340 8 GB | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro V340 16 GB | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro V320 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro SSG | High Sierra (10.13) | Sequoia (15) | Theoretically. |
| Radeon Instinct MI25 | High Sierra (10.13) | Sequoia (15) | Theoretically. |
| RX Vega 56 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro Vega 64X | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro Vega 64 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro Vega 56 | High Sierra (10.13) | Sequoia (15) | Theoretically. |
| Radeon Pro Vega 48 | High Sierra (10.13) | Sequoia (15) | Theoretically. |

## Polaris 10 and 20

{: .note }
For Polaris, basically every model is supported. The only brands you should avoid with the Polaris series would be XFX, PowerColor, HIS and VisionTek as many users have had bootloader and macOS boot issues.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 590 GME | Sierra (10.12) | Sequoia (15) |  |
| RX 580X | Sierra (10.12) | Sequoia (15) |  |
| RX 580 | Sierra (10.12) | Sequoia (15) |  |
| RX 580G | Sierra (10.12) | Sequoia (15) |  |
| RX 580 2048SP | Sierra (10.12) | Sequoia (15) | Requires custom VBIOS to appear as non SP variant. ID Spoofing will not resolve this. |
| Radeon RX 570X | Sierra (10.12) | Sequoia (15) |  |
| RX 570 | Sierra (10.12) | Sequoia (15) |  |
| RX 570 X2 | Sierra (10.12) | Sequoia (15) |  |
| RX 580 OEM | Sierra (10.12) | Sequoia (15) |  |
| Radeon RX 480 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro WX 7100 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro V7350X2 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro V7300X | Sierra (10.12) | Sequoia (15) |  |
| Radeon E9560 PCIe | Sierra (10.12) | Sequoia (15) | Theoretically, with a device-id spoof. |
| Radeon Instinct MI6 | Sierra (10.12) | Sequoia (15) |  |
| RX 560 XT | Sierra (10.12) | Sequoia (15) |  |
| RX 470D | Sierra (10.12) | Sequoia (15) |  |
| RX 470 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro 580X | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro 580 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro 570X | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro 570 | Sierra (10.12) | Sequoia (15) |  |
| Radeon E9390 PCIe | Sierra (10.12) | Sequoia (15) | Theoretically, with a device-id spoof. |
| Radeon Pro WX 5100 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro Duo Polaris | Sierra (10.12) | Sequoia (15) |  |

## Lexa Core based GPUs

{: .note }
Lexa based GPUs require a device-id property spoof to get the accelerator to match, the driver itself actually supports these cards yet there's no accelerator class.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 550X | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 550 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 540 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon 550X | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon 550X 640SP | Unknown | Unknown | Theoretically... |
| Radeon 550 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon Pro WX 3100 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon Pro WX 2100 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |

## Legacy GCN

### GCN 3

{: .note }
Several other GPUs deriving from the Tonga architecture can likely be spoofed. To do so, use the `0x6939` device-id property.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| R9 FURY X | Yosemite (10.10.4) | Monterey (12) | Unsure about actual support start version |
| R9 NANO | Yosemite (10.10.4) | Monterey (12) | Unsure about actual support start version |
| R9 FURY | Yosemite (10.10.4) | Monterey (12) | Unsure about actual support start version |
| R9 M395/M395X Mac Edition | Yosemite (10.10) | Monterey (12) | Tonga |
| R9 M295X | Yosemite (10.10) | Monterey (12) |  |
| R9 380X | Yosemite (10.10) | Monterey (12) |  |
| R9 285 | Yosemite (10.10) | Monterey (12) |  |
| R9 380 | Yosemite (10.10) | Monterey (12) |  |

### GCN 2

{: .note }
Several other GPUs deriving from the Bonaire/Hawaii architecture can likely be spoofed, to do so, use the device id `0x6640` for Bonaire and `0x67B0` for Hawaii

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro M6100 | Yosemite (10.10) | Monterey (12) |  |
| R9 390X | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 290X | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 360 | Yosemite (10.10) | Monterey (12) |  |
| R9 260 | Yosemite (10.10) | Monterey (12) |  |
| R9 M280X | Yosemite (10.10) | Monterey (12) |  |
| R9 M270X | Yosemite (10.10) | Monterey (12) |  |
| R9 M270X | Yosemite (10.10) | Monterey (12) |  |
| R7 360 | Yosemite (10.10) | Monterey (12) |  |
| R7 2XX (0x665D) | Yosemite (10.10) | Monterey (12) | Must have 0x665D dev id to qualify |
| HD 8930M | Yosemite (10.10) | Monterey (12) |  |
| HD 8770 | Yosemite (10.10) | Monterey (12) |  |
| HD 7790 | Yosemite (10.10) | Monterey (12) |  |

### GCN 1

{: .note }
Several other GPUs deriving from the Tahiti/Pitcairn architecture can likely be spoofed, to do so, use the device id `0x6818` for Pitcairn and `0x6790` for Tahiti

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro W7000 | Yosemite (10.10) | Monterey (12) |  |

## Unsupported GPUs

### Navi 2X and Navi 3X

{: .note }
While Navi 21, 22 and Navi 23 are supported, Navi 24, Navi 3X, and the upcoming Navi 4X based graphic cards are not at the time of writing. No guarantee can be made for future support. no Steam Deck for u.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 7900 M | None | None | |
| RX 7700 M/S | None | None | |
| RX 7600 M/S (XT) | None | None | |
| RX 7900 (XT(X)) | None | None | |
| RX 7700 (XT) | None | None | |
| RX 7600 (XT) | None | None | |
| RX 6500 XT | None | None | |
| RX 6400 | None | None | |
| RX 6300 | None | None | |
| Pro W7900 | None | None | |
| Pro W7800 | None | None | |
| Pro W7700 | None | None | |
| Pro W7600 | None | None | |
| Pro W7500 | None | None | |

### Phoenix

{: .note }
No support for these GPUs at all, just like their desktop counterparts.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon 780M | None | None |  |
| Radeon 760M | None | None |  |
| Radeon 740M | None | None |  |
| Radeon(TM) Graphics | None | None | This is a generic name, always double check your Device ID to be sure. |

### Van Gogh, Rembrandt, Raphael, Granite Ridge, Dragon Range, Rembrandt+, Rembrandt-R, Mendocino, etc.

{: .note }
No support for these GPUs at all.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon 680M | None | None |  |
| Radeon 660M | None | None |  |
| Radeon 610M | None | None |  |
| Radeon(TM) Graphics | None | None | This is a generic name, always double check your Device ID to be sure. |

### Kaveri, Kabini, Mullins, Carrizo and Stoney Ridge

{: .note }
No support for these GPUs, their desktop counterparts of the CIK family are supported however. Perhaps there is still hope.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon R* Graphics | None | None | Generic name, shouldn't matter too much |
| Radeon R*E Graohics | None | None | Generic name, shouldn't matter too much |
| Radeon HD 8180 | None | None |  |
| Radeon HD 8200 | None | None |  |
| Radeon HD 8210 | None | None |  |
| Radeon HD 8210E | None | None |  |
| Radeon HD 8250 | None | None |  |
| Radeon HD 8280E | None | None |  |
| Radeon HD 8330 | None | None |  |
| Radeon HD 8330E | None | None |  |
| Radeon HD 8400 | None | None |  |
| Radeon HD 8400E | None | None |  |

### Iceland/Topaz dGPUs

{: .note }
No support for these GPUs. AMD got very creative with the naming. Very confusing. These were taken from the Windows driver.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon R7 260M | None | None |  |
| Radeon R7 M265DX | None | None | |
| Radeon R7 M260DX | None | None | |
| Radeon R6 M255DX | None | None | |
| Radeon R5 M255 | None | None | |
| Radeon R7 M360 | None | None | |
| Radeon R7 M340 | None | None | |
| Radeon R5 M315 | None | None | |
| Radeon 530 | None | None | |
| Radeon R8 M535DX | None | None | |
| Radeon 625 | None | None | |
| Radeon 620 | None | None | |

### Hainan dGPUs

{: .note }
No support for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon HD 8600M Series | None | None | |
| Radeon HD 8500M | None | None | |
| Radeon R5 M230 Series | None | None | |
| Radeon R5 M200 Series | None | None | |
| Radeon R8 M350DX | None | None | |
| Radeon R6 M340DX | None | None | |
| Radeon R6 M335DX | None | None | |
| Radeon R5 M335 | None | None | |
| Radeon R5 M330 | None | None | |
| Radeon R5 M320 | None | None | |
| Radeon R8 M435DX | None | None | |
| Radeon R6 M435DX | None | None | |
| Radeon R5 M435 | None | None | |
| Radeon R5 M430 | None | None | |
| Radeon R5 430M | None | None | |
| Radeon R5 M430 | None | None | |
| Radeon 520 | None | None | This applies to any Radeon 520. |
| Radeon 610 Series | None | None | |


### Instinct MI* (Aldebaran, Arcturus, Aqua Vanjaram, etc)

{: .note }
No support for these GPUs. Who's using a datacenter GPU in a Hac anyways?

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| AMD Radeon Instinct MI300 | None | None | |
| AMD Radeon Instinct MI300X | None | None | |
| AMD Radeon Instinct MI325X | None | None | |

<br>
<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../02-GPU/index">&larr; Back Page</a>
    <a class="nav-button" href="../../../04-PostCheck">Next Page &rarr;</a>
  </div>
  <br>
</h2>
