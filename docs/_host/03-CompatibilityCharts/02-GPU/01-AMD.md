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
| RX 6800S | Monterey (12) | Tahoe (26) | Theoretically. This is a mobile dGPU. |
| RX 6700S | Monterey (12) | Tahoe (26) | Theoretically. This is a mobile dGPU. |
| RX 6650 XT | Monterey (12) | Tahoe (26) | Needs device-id spoof to 0x73ff.<br> NootRX changes the Device-ID. |
| RX 6600 XT | Monterey (12) | Tahoe (26) | Does not require any kexts to work |
| RX 6600 LE | Monterey (12) | Tahoe (26) | Does not require any kexts to work |
| RX 6600S | Monterey (12) | Tahoe (26) | Does not require any kexts to work |
| RX 6600 | Monterey (12) | Tahoe (26) | Does not require any kexts to work |
| RX 6600M | Monterey (12) | Tahoe (26) | Rare on Laptops, but **does** work. |
| Radeon Pro W6600X | Monterey (12) | Tahoe (26) | May require a device-id spoof |
| Radeon PRO W6600 | Monterey (12) | Tahoe (26) | May require a device-id spoof |

## Navi 22

{: .headsup }
NootRX is required for these GPUs to function, they have no native macOS support.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6750 GRE | Monterey (12) | Tahoe (26) |  |
| RX 6750 XT | Monterey (12) | Tahoe (26) |  |
| RX 6750 | Monterey (12) | Tahoe (26) |  |
| RX 6700 XT | Monterey (12) | Tahoe (26) |  |
| RX 6700 | Monterey (12) | Tahoe (26) |  |

## Navi 21

{: .note }
WhateverGreen is recommended for these GPUs in the case of DRM issues.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon RX 6900 XTX | Big Sur (11) | Tahoe (26) |  |
| RX 6950 XT | Big Sur (11) | Tahoe (26) | Needs device-id spoof to 0x73bf.<br> NootRX changes the Device-ID. |
| RX 6900 XTXH | Big Sur (11) | Tahoe (26) | |
| RX 6900 XT | Big Sur (11) | Tahoe (26) |  |
| RX 6800 XT | Big Sur (11) | Tahoe (26) |  |
| Radeon PRO V620 | Big Sur (11) | Tahoe (26) | Theoretically. |
| Radeon PRO W6900X | Big Sur (11) | Tahoe (26) |  |
| Radeon PRO W6800 | Big Sur (11) | Tahoe (26) |  |
| RX 6800 | Big Sur (11) | Tahoe (26) |  |
| Radeon Pro W6800X Duo | Big Sur (11) | Tahoe (26) |  |
| Radeon Pro W6800X | Big Sur (11) | Tahoe (26) |  |

## Navi 14

{: .note }
WhateverGreen is required for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 5500M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| RX 5500 XT | Catalina (10.15.1) | Tahoe (26) |  |
| RX 5500/OEM | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5500X | Catalina (10.15.1) | Tahoe (26) | Apple's device in MPX form factor |
| Radeon Pro W5500M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| Radeon Pro W5500 | Catalina (10.15.1) | Tahoe (26) |  |
| Radeon Pro 5500 XT | Catalina (10.15.1) | Tahoe (26) |  |
| Radeon Pro 5500M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| RX 5300M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| RX 5300 XT OEM | Catalina (10.15.1) | Tahoe (26) |  |
| RX 5300/OEM | Catalina (10.15.1) | Tahoe (26) |  |
| Radeon Pro W5300M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| Radeon Pro 5300M | Catalina (10.15.1) | Tahoe (26) | Theoretically |
| Radeon Pro 5300 | Catalina (10.15.1) | Tahoe (26) |  |

## Navi 10

{: .note }
WhateverGreen is required for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon Pro W5700X | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5700 XT 50th Anniversary | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5700 XT | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5700XT | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5700 | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5700 | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5600 XT | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5600/OEM | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| Radeon Pro 5700 | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |
| RX 5600 | Catalina (10.15.1) | Tahoe (26) | Add agdpmod=pikera boot flag. |

## Vega 20

{: .note }
All Vega based dedicated GPUs are natively supported in OS X and macOS with support for Vega 20 GPUs starting in Mac OS X Mojave.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon Instinct MI60 | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon VII | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon Instinct MI50 | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon Pro Vega II Duo | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon Pro Vega II | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon Pro VII | Mojave (10.14.5) | Tahoe (26) |  |
| Radeon Pro V420 | Mojave (10.14.5) | Tahoe (26) |  |

## Vega 10

{: .note }
Vega 10 GPUs are natively supported in macOS. The only brand of GPUs to avoid with Vega 10 is XFX, due to VBIOS communication issues, which can't be easily solved with a reference BIOS flash as the Vega's PowerPlay Table interacts with the OS and GPU differently.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX Vega 64 Liquid Cooling | High Sierra (10.13) | Tahoe (26) |  |
| Vega Frontier Edition | High Sierra (10.13) | Tahoe (26) | Watercooled variant included |
| RX Vega Nano | High Sierra (10.13) | Tahoe (26) |  |
| RX Vega 64 Limited Edition | High Sierra (10.13) | Tahoe (26) |  |
| RX Vega 64 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro WX 9100 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro WX 8200 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro WX 8100 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro V340 8 GB | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro V340 16 GB | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro V320 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro SSG | High Sierra (10.13) | Tahoe (26) | Theoretically. |
| Radeon Instinct MI25 | High Sierra (10.13) | Tahoe (26) | Theoretically. |
| RX Vega 56 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro Vega 64X | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro Vega 64 | High Sierra (10.13) | Tahoe (26) |  |
| Radeon Pro Vega 56 | High Sierra (10.13) | Tahoe (26) | Theoretically. |
| Radeon Pro Vega 48 | High Sierra (10.13) | Tahoe (26) | Theoretically. |

## Polaris 20, 21 & 30 (RX 500 Series)

{: .note }
Most are natively supported, but watch out for XFX, PowerColor, HIS, and VisionTek brands which may cause boot issues due to non-stock VBIOS (If you already own said brand, simply try, but do not outright purchase a mentioned brand).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 590 GME | Sierra (10.12) | Tahoe (26) | Polaris 20 (Rebranded RX 580) |
| RX 590 | Mojave (10.14.3) | Tahoe (26) | Polaris 30 |
| RX 580X | Sierra (10.12) | Tahoe (26) |  |
| RX 580 | Sierra (10.12) | Tahoe (26) | Polaris 20 |
| RX 580 OEM | Sierra (10.12) | Tahoe (26) |  |
| RX 580G | Sierra (10.12) | Tahoe (26) |  |
| RX 580 2048SP | Sierra (10.12) | Tahoe (26) | Requires custom VBIOS to appear as non SP variant. ID Spoofing will not resolve this. |
| Radeon RX 570X | Sierra (10.12) | Tahoe (26) |  |
| RX 570 | Sierra (10.12) | Tahoe (26) | Polaris 20 |
| RX 570 X2 | Sierra (10.12) | Tahoe (26) |  |
| RX 560 XT | Sierra (10.12) | Tahoe (26) | Polaris 20/10 Cut-down |
| RX 560 | Sierra (10.12) | Tahoe (26) | Baffin Core (Polaris 21) |
| RX 560D | Sierra (10.12) | Tahoe (26) | Baffin Core (Polaris 21) |
| RX 560X | Sierra (10.12) | Tahoe (26) | Baffin Core (Polaris 21) |
| Radeon Pro 580X | Sierra (10.12) | Tahoe (26) |  |
| Radeon Pro 580 | Sierra (10.12) | Tahoe (26) | Polaris 20 |
| Radeon Pro 575X | Sierra (10.12) | Tahoe (26) |  |
| Radeon Pro 575 | Sierra (10.12) | Tahoe (26) |  |
| Radeon Pro 570X | Sierra (10.12) | Tahoe (26) |  |
| Radeon Pro 570 | Sierra (10.12) | Tahoe (26) | Polaris 20 |

## Polaris 10 & 11 (RX 400 & Pro Series)

{: .note }
This chart includes the original Polaris 10 (Ellesmere) and Polaris 11 (Baffin) cards.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon RX 480 | Sierra (10.12) | Tahoe (26) | Polaris 10 |
| RX 470D | Sierra (10.12) | Tahoe (26) | Polaris 10 |
| RX 470 | Sierra (10.12) | Tahoe (26) | Polaris 10 |
| RX 460 | Sierra (10.12) | Tahoe (26) | Baffin Core (Polaris 11) |
| Radeon Pro WX 7100 | Sierra (10.12) | Tahoe (26) | Polaris 10 |
| Radeon Pro WX 5100 | Sierra (10.12) | Tahoe (26) | Polaris 10 |
| Radeon Pro WX 4100 | Sierra (10.12) | Tahoe (26) | Polaris 11 (Baffin) |
| Radeon Pro Duo Polaris | Sierra (10.12) | Tahoe (26) | Dual Polaris 10 |
| Radeon Pro V7350X2 | Sierra (10.12) | Tahoe (26) |  |
| Radeon Pro V7300X | Sierra (10.12) | Tahoe (26) |  |
| Radeon E9560 PCIe | Sierra (10.12) | Tahoe (26) | Theoretically, with a device-id spoof. (Polaris 10) |
| Radeon E9390 PCIe | Sierra (10.12) | Tahoe (26) | Theoretically, with a device-id spoof. (Polaris 10) |
| Radeon Instinct MI6 | Sierra (10.12) | Tahoe (26) | Polaris 10 |

## Lexa Core based GPUs

{: .note }
Lexa based GPUs require a device-id property spoof to get the accelerator to match, the driver itself actually supports these cards yet there's no accelerator class.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 640 | Unknown | Unknown | Needs device-id spoof to 0x67FF (Baffin), may need no-gfx-spoof. |
| RX 550X | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 550 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 540 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon 550X | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon 550X 640SP | Unknown | Unknown | Theoretically... |
| Radeon 550 | Unknown | Unknown | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| Radeon Pro WX 3200 | Unknown | Unknown | Needs device-id spoof to 0x67FF or WX 4100. |
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
| R9 380X | Yosemite (10.10) | Monterey (12) | Tonga XT |
| R9 380 | Yosemite (10.10) | Monterey (12) |  |
| R9 285 | Yosemite (10.10) | Monterey (12) |  |

### GCN 2

{: .note }
WhateverGreen is recommended for these cards. Use `-raddvi` boot-arg if using DVI to fix connectors. Several other GPUs deriving from the Bonaire/Hawaii architecture can likely be spoofed, to do so, use the device id `0x6640` for Bonaire and `0x67B0` for Hawaii

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro M6100 | Yosemite (10.10) | Monterey (12) |  |
| R9 390X | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 390 | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 290X | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 290 | Yosemite (10.10) | Monterey (12) | Hawaii GPU |
| R9 360 | Yosemite (10.10) | Monterey (12) |  |
| R9 260 | Yosemite (10.10) | Monterey (12) |  |
| R7 260X | Mavericks (10.9) | Monterey (12) | Bonaire XTX |
| R9 M280X | Yosemite (10.10) | Monterey (12) |  |
| R9 M270X | Yosemite (10.10) | Monterey (12) |  |
| R7 370 | Yosemite (10.10) | Monterey (12) |  |
| R7 360X | Yosemite (10.10) | Monterey (12) |  |
| R7 360 | Yosemite (10.10) | Monterey (12) |  |
| R9 M280X | Yosemite (10.10) | Monterey (12) |  |
| R9 M270X | Yosemite (10.10) | Monterey (12) |  |
| R7 265 | Yosemite (10.10) | Monterey (12) |  |
| R7 260X | Mavericks (10.9) | Monterey (12) | Bonaire XTX |
| R9 255 | Yosemite (10.10) | Monterey (12) |  |
| R7 2XX (0x665D) | Yosemite (10.10) | Monterey (12) | Must have 0x665D dev id to qualify |
| HD 8930M | Yosemite (10.10) | Monterey (12) |  |
| HD 8770 | Yosemite (10.10) | Monterey (12) |  |
| HD 7790 | Mountain Lion (10.8.3) | Monterey (12) | Bonaire XT |

### R7 / R9 Series (GCN 1)

{: .note }
WhateverGreen is recommended for these cards. Use `radpg=15` boot-arg if initialization fails. Several other GPUs deriving from the Tahiti/Pitcairn architecture can likely be spoofed. Use `0x6818` for Pitcairn and `0x6790` for Tahiti.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro W9000 | Yosemite (10.10) | Monterey (12) | Tahiti |
| FirePro W7000 | Yosemite (10.10) | Monterey (12) | Pitcairn |
| R9 280X | Mavericks (10.9) | Monterey (12) | Tahiti XTL (Rebranded HD 7970) |
| R9 280 | Mavericks (10.9) | Monterey (12) | Tahiti Pro (Rebranded HD 7950) |
| R9 270X | Mavericks (10.9) | Monterey (12) | Pitcairn XT (Rebranded HD 7870) |
| R9 270 | Mavericks (10.9) | Monterey (12) | Pitcairn XT (Rebranded HD 7870) |
| R7 250X | Mavericks (10.9) | Monterey (12) | Cape Verde XT (Rebranded HD 7770) |
| R7 250 | Mavericks (10.9) | Monterey (12) | Oland XT (Requires FakeID) |

### HD 8000 Series (GCN)

{: .note }
WhateverGreen is recommended for these cards. Use `radpg=15` boot-arg if initialization fails. The HD 8000 series are primarily OEM rebrands of the HD 7000 series.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 8970 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8950 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8890 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8870 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8850 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8760 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 8740 | Mountain Lion (10.8) | Monterey (12) |  |

### HD 7000 Series (GCN)

{: .note }
WhateverGreen is recommended for these cards. Use `radpg=15` boot-arg if initialization fails. HD 7790 is technically GCN 2 (Bonaire).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro D700 | Mavericks (10.9) | Monterey (12) | Mac Pro (Trashcan) Exclusive |
| FirePro D500 | Mavericks (10.9) | Monterey (12) | Mac Pro (Trashcan) Exclusive |
| FirePro D300 | Mavericks (10.9) | Monterey (12) | Mac Pro (Trashcan) Exclusive |
| FirePro W5100 | Mountain Lion (10.8) | Monterey (12) | Bonaire |
| HD 7990 | Mountain Lion (10.8.3) | Monterey (12) | Dual GPU (Malta) |
| HD 7970 / GHz | Mountain Lion (10.8) | Monterey (12) | Tahiti XT |
| HD 7950 / Boost | Mountain Lion (10.8) | Monterey (12) | Tahiti Pro |
| HD 7870 XT | Mountain Lion (10.8) | Monterey (12) | Tahiti LE |
| HD 7870 | Mountain Lion (10.8) | Monterey (12) | Pitcairn XT |
| HD 7850 | Mountain Lion (10.8) | Monterey (12) | Pitcairn Pro |
| HD 7790 | Mountain Lion (10.8) | Monterey (12) | Bonaire XT (GCN 2) |
| HD 7770 | Mountain Lion (10.8) | Monterey (12) | Cape Verde XT |
| HD 7750 | Mountain Lion (10.8) | Monterey (12) | Cape Verde Pro |
| HD 7730 | Mountain Lion (10.8) | Monterey (12) | Cape Verde LE |

### TeraScale 2 & 3 (HD 6000 Series)

{: .note }
The HD 6000 series uses the TeraScale 2 or TeraScale 3 architecture. Metal support is NOT available. Support ended with macOS High Sierra (10.13.6).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 6990 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Dual GPU (Antilles XT) |
| HD 6970 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Cayman XT |
| HD 6950 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Cayman Pro |
| HD 6930 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Cayman CE |
| HD 6870 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Barts XT |
| HD 6790 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Barts LE |
| HD 6770 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Juniper XT |
| HD 6750 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Juniper Pro |
| HD 6670 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Turks XT |
| HD 6610 | Snow Leopard (10.6.7) | High Sierra (10.13.6) |  |
| HD 6570 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Turks Pro |
| HD 6570 (OEM)​ | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Turks Pro |
| HD 6510 | Snow Leopard (10.6.7) | High Sierra (10.13.6) |  |
| HD 6450 | Snow Leopard (10.6.7) | High Sierra (10.13.6) | Caicos |
| HD 6350 | Snow Leopard (10.6.7) | High Sierra (10.13.6) |  |
| HD 6250 | Snow Leopard (10.6.7) | High Sierra (10.13.6) |  |
| HD 6230 | Snow Leopard (10.6.7) | High Sierra (10.13.6) |  |

### TeraScale 2 (HD 5000 Series)

{: .note }
The HD 5000 series uses the TeraScale 2 architecture. Metal support is NOT available. Support ended with macOS High Sierra (10.13.6).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 5970 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Dual GPU (Hemlock) |
| HD 5870 Eyefinity Edition | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5870 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Cypress XT |
| HD 5850 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Cypress Pro |
| HD 5830 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Cypress LE |
| HD 5770 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Juniper XT |
| HD 5750 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Juniper Pro |
| HD 5730 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5690 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5670 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Redwood XT |
| HD 5630 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5610 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5570 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5550 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5470 | Snow Leopard (10.6.4) | High Sierra (10.13.6) |  |
| HD 5450 | Snow Leopard (10.6.4) | High Sierra (10.13.6) | Cedar Pro |

### TeraScale 1 (HD 4000 Series)

{: .note }
The HD 4000 series uses the TeraScale 1 architecture. Metal support is NOT available. Support ended with macOS High Sierra (10.13.6).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 4890 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV790 |
| HD 4870 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV770 XT |
| HD 4850 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV770 PRO |
| HD 4830 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV770 LE |
| HD 4670 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV730 XT |
| HD 4650 | Snow Leopard (10.6) | High Sierra (10.13.6) | RV730 PRO |

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
