---
layout: default
title: AMD
parent: GPU Compatibility Chart
nav_order: 1
---

# macOS AMD GPU Support Table
#### This section has been derived from various sources.

# Navi 23

{: .note }
Not much to say, this card has native support OOB.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6600 | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6600 XT | Monterey (12) | Sequoia (15) | Does not require any kexts to work |
| RX 6650 XT | Monterey (12) | Sequoia (15) | Needs device-id spoof to 0x73ff, <br> NRX negates this though. |

# Navi 22

{: .headsup }
NootRX is required for these GPUs to function, they have no native macOS support. Be thankful!

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6700 | Monterey (12) | Sequoia (15) |  |
| RX 6700 XT | Monterey (12) | Sequoia (15) |  |
| RX 6750 XT | Monterey (12) | Sequoia (15) |  |
| RX 6750 GRE | Monterey (12) | Sequoia (15) |  |

# Navi 21

{: .note }
NootRX is recommended for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6800 | Big Sur (11) | Sequoia (15) |  |
| RX 6800 XT | Big Sur (11) | Sequoia (15) |  |
| RX 6900 XT | Big Sur (11) | Sequoia (15) |  |
| RX 6900 XTXH | Big Sur (11) | Sequoia (15) | |
| RX 6950 XT | Big Sur (11) | Sequoia (15) | Needs device-id spoof to 0x73bf, <br> NRX negates this though. |

# Navi 10

{: .note }

WhateverGreen is required for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 5500 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5500 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5600 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5600 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5700 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| RX 5700 XT | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5500 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |
| Radeon Pro W5700 | Catalina (10.15.1) | Sequoia (15) | Add agdpmod=pikera boot flag. |

# Vega 20

{: .note }
All Vega based dedicated GPUs are natively supported in macOS with Vega 20 GPUs starting in Mojave. In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon VII | Mojave (10.14.5) | Sequoia (15) |  |

# Vega 10

{: .note }
Vega 10 GPUs are natively supported in macOS. In this case, they do work on the latest macOS and you can proceed. The only brand of GPUs to avoid with Vega 10 is XFX, due to VBIOS communication issues, which can't be easily solved with a reference BIOS as the Vega's powerplay table interacts with the OS and GPU differently.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Vega 56 | High Sierra (10.13) | Sequoia (15) |  |
| Vega 64 | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro: Vega Frontier Edition | High Sierra (10.13) | Sequoia (15) |  |
| Radeon Pro WX 9100 | High Sierra (10.13) | Sequoia (15) |  |

# Polaris 10 and 20

{: .note }
For Polaris, basically every model is supported. The only brands you should avoid with the Polaris series would be XFX, PowerColor, HIS and VisionTek as many users have had bootloader and macOS boot issues. In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 460 | Sierra (10.12) | Sequoia (15) |  |
| RX 470 | Sierra (10.12) | Sequoia (15) |  |
| RX 470D | Sierra (10.12) | Sequoia (15) |  |
| RX 480 | Sierra (10.12) | Sequoia (15) |  |
| RX 550 | Sierra (10.12) | Sequoia (15) |  |
| RX 560 | Sierra (10.12) | Sequoia (15) |  |
| RX 560X | Sierra (10.12) | Sequoia (15) |  |
| RX 570 | Sierra (10.12) | Sequoia (15) |  |
| RX 570X | Sierra (10.12) | Sequoia (15) |  |
| RX 580 | Sierra (10.12) | Sequoia (15) |  |
| RX 580X | Sierra (10.12) | Sequoia (15) |  |
| RX 590 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro: E9550 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro: WX 4100 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro: WX 5100 | Sierra (10.12) | Sequoia (15) |  |
| Radeon Pro: WX 7100 | Sierra (10.12) | Sequoia (15) |  |

## Lexa core based GPUs

{: .note }
Lexa based GPUs require a device-id property spoof to get the accelerator to match, the driver itself actually supports these cards yet there's no accelerator class.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 540 | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 540X | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 550 | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| RX 550X | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| WX 2100 | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |
| WX 3100 | None | None | Needs device-id spoof to 0x67FF, WhateverGreen's no-gfx-spoof propetry will also have to be enabled |

# Legacy GCN

{: .note }
Apple dropped the following GPUs at macOS Monetery

## GCN 3

{: .note }
Several other GPUs deriving from the Tonga architecture can likely be spoofed, to do so, use the device id `0x6939`

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

## GCN 2

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

## GCN 1

{: .note }
Several other GPUs deriving from the Tahiti/Pitcairn architecture can likely be spoofed, to do so, use the device id `0x6818` for Pitcairn and `0x6790` for Tahiti

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| FirePro W7000 | Yosemite (10.10) | Monterey (12) |  |

# Unsupported GPUs

## Older AMD GPU's and Non-mentioned Cards

{: .important }
While there are other GPU's that are supported, unfortunately cards not mentioned, will not work in this guide without the user doing more manual modification, even as far as flashing custom VBIOS' which is out of the scope of this guide. This is due to older AMD cards potentially not having UEFI, thus GPU Passthrough via VFIO is not viable. Solutions like adding UEFI GOP to ROMs of older AMD GPU's are also out of the scope of the guide, but no discouragement is in order, it may work! If tested, these cards can be added to the support table once confirmed working.

## Navi 2X and Navi 3X

{: .note }
While Navi 21, 22 and Navi 23 are supported, Navi 24 and Navi 3X based graphic cards are not at the time of writing. No guarantee can be made for future support. No Steam Deck for u.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6400 | None | None |  |
| RX 6500 XT | None | None |  |
| RX 7900 XT | None | None |  |
| RX 7900 XTX | None | None |  |
