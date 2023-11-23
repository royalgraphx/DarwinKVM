---
layout: default
title: AMD
parent: GPU Compatibility Chart
nav_order: 1
---

# macOS AMD GPU Support Table
#### This section has been derived from various sources.

# Navi 10

{: .note }

Must add agdpmod=pikera to get a display out.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 5500 | Catalina (10.15.1) | Sonoma (14) |  |
| RX 5500 XT | Catalina (10.15.1) | Sonoma (14) |  |
| RX 5600 | Catalina (10.15.1) | Sonoma (14) |  |
| RX 5600 XT | Catalina (10.15.1) | Sonoma (14) |  |
| RX 5700 | Catalina (10.15.1) | Sonoma (14) |  |
| RX 5700 XT | Catalina (10.15.1) | Sonoma (14) |  |
| Radeon Pro W5500 | Catalina (10.15.1) | Sonoma (14) |  |
| Radeon Pro W5700 | Catalina (10.15.1) | Sonoma (14) |  |

# Navi 21

{: .note }
NootRX is recommended for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6800 | Big Sur (11) | Sonoma (14) |  |
| RX 6800 XT | Big Sur (11) | Sonoma (14) |  |
| RX 6900 XT | Big Sur (11) | Sonoma (14) |  |
| RX 6900 XTXH | Big Sur (11) | Sonoma (14) | |

# Navi 22

{: .note }
NootRX is necessary for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6700 | Monterey (12) | Sonoma (14) |  |
| RX 6700 XT | Monterey (12) | Sonoma (14) |  |
| RX 6750 XT | Monterey (12) | Sonoma (14) |  |
| RX 6750 GRE | Monterey (12) | Sonoma (14) |  |

# Navi 23

{: .note }
NootRX is recommended for these GPUs.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6600 | Monterey (12) | Sonoma (14) |  |
| RX 6600 XT | Monterey (12) | Sonoma (14) |  |
| RX 6650 XT | Monterey (12) | Sonoma (14) |  |

# Vega 20

{: .note }
All Vega based dedicated GPUs are natively supported in macOS with Vega 20 GPUs starting in Mojave. In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon VII | Mojave (10.14.5) | Sonoma (14) |  |

# Vega 10

{: .note }
Vega 10 GPUs are natively supported in macOS. In this case, they do work on the latest macOS and you can proceed. The only brand of GPUs to avoid with Vega 10 is XFX, due to VBIOS communication issues, which can't be easily solved with a reference BIOS as the Vega's powerplay table interacts with the OS and GPU differently.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Vega 56 | High Sierra (10.13) | Sonoma (14) |  |
| Vega 64 | High Sierra (10.13) | Sonoma (14) |  |
| Radeon Pro: Vega Frontier Edition | High Sierra (10.13) | Sonoma (14) |  |
| Radeon Pro WX 9100 | High Sierra (10.13) | Sonoma (14) |  |

# Polaris 10 and 20

{: .note }
For Polaris, basically every model is supported. The only brands you should avoid with the Polaris series would be XFX, PowerColor, HIS and VisionTek as many users have had bootloader and macOS boot issues. In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 460 | Sierra (10.12) | Sonoma (14) |  |
| RX 470 | Sierra (10.12) | Sonoma (14) |  |
| RX 470D | Sierra (10.12) | Sonoma (14) |  |
| RX 480 | Sierra (10.12) | Sonoma (14) |  |
| RX 550 | Sierra (10.12) | Sonoma (14) |  |
| RX 560 | Sierra (10.12) | Sonoma (14) |  |
| RX 560X | Sierra (10.12) | Sonoma (14) |  |
| RX 570 | Sierra (10.12) | Sonoma (14) |  |
| RX 570X | Sierra (10.12) | Sonoma (14) |  |
| RX 580 | Sierra (10.12) | Sonoma (14) |  |
| RX 580X | Sierra (10.12) | Sonoma (14) |  |
| RX 590 | Sierra (10.12) | Sonoma (14) |  |
| Radeon Pro: E9550 | Sierra (10.12) | Sonoma (14) |  |
| Radeon Pro: WX 4100 | Sierra (10.12) | Sonoma (14) |  |
| Radeon Pro: WX 5100 | Sierra (10.12) | Sonoma (14) |  |
| Radeon Pro: WX 7100 | Sierra (10.12) | Sonoma (14) |  |

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

# Unsupported GPU's

{: .important }
While there are other GPU's that are supported up to Monterey and Big Sur, this guide focuses on the latest macOS, and unfortunately these cards below and others not mentioned, will not work in this guide without the user doing more manual modification, even as far as flashing custom VBIOS' which is out of the scope of this guide.

## Navi 2X and Navi 3X

{: .note }
While Navi 21, 22 and Navi 23 are supported, Navi 24 and Navi 3X based graphic cards are not at the time of writing. No guarantee can be made for future support.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6400 | None | None |  |
| RX 6500 XT | None | None |  |
| RX 7900 XT | None | None |  |
| RX 7900 XTX | None | None |  |

<h1>Take me <a href="../../../">back</a>!</h1>
