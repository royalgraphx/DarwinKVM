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
| RX 5500 | Catalina (10.15.1) | Ventura (13) |  |
| RX 5500 XT | Catalina (10.15.1) | Ventura (13) |  |
| RX 5600 | Catalina (10.15.1) | Ventura (13) |  |
| RX 5600 XT | Catalina (10.15.1) | Ventura (13) |  |
| RX 5700 | Catalina (10.15.1) | Ventura (13) |  |
| RX 5700 XT | Catalina (10.15.1) | Ventura (13) |  |
| Radeon Pro W5500 | Catalina (10.15.1) | Ventura (13) |  |
| Radeon Pro W5700 | Catalina (10.15.1) | Ventura (13) |  |

# Navi 21

{: .note }
Must add agdpmod=pikera to get a display out.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6800 | Big Sur (11.4) | Ventura (13) |  |
| RX 6800 XT | Big Sur (11.4) | Ventura (13) |  |
| RX 6900 XT | Big Sur (11.4) | Ventura (13) |  |
| RX 6900 XTXH | Big Sur (11.4) | Ventura (13) | If your card has Device ID: 0x73AF, spoofing device-id to 0x73BF will allow support. |

# Navi 23

{: .note }
Must add agdpmod=pikera to get a display out.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6600 | Monterey (12.1) | Ventura (13) |  |
| RX 6600 XT | Monterey (12.1) | Ventura (13) |  |

# Vega 20

{: .note }
All Vega based dedicated GPUs are natively supported in macOS with Vega 20 GPUs starting in Mojave. In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Radeon VII | Mojave (10.14.5) | Ventura (13) |  |

# Vega 10

{: .highlight }
> Vega 10 GPUs are natively supported in macOS. In this case, they do work on the latest macOS and you can proceed. 
> "The only brand of GPUs to avoid with Vega 10 is XFX. The reason is VBIOS communication issues which can't be easily solved with a reference BIOS due to how Vega's powerplay table interacts with the OS and GPU."

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Vega 56 | High Sierra (10.13) | Ventura (13) |  |
| Vega 64 | High Sierra (10.13) | Ventura (13) |  |
| Radeon Pro: Vega Frontier Edition | High Sierra (10.13) | Ventura (13) |  |
| Radeon Pro WX 9100 | High Sierra (10.13) | Ventura (13) |  |

# Polaris 10 and 20

{: .warning }
"Regarding Polaris, basically every model of card is supported as long as it’s running either a Polaris or Baffin core. Lower end cards like the RX 550 may run a Lexa core, meaning no support in macOS, the only brands you should avoid with the Polaris series would be XFX (460/560 models), PowerColor, HIS and VisionTek as many users have had bootloader and macOS boot issues". In this case, they do work on the latest macOS and you can proceed.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 460 | Sierra (10.12) | Ventura (13) |  |
| RX 470 | Sierra (10.12) | Ventura (13) |  |
| RX 470D | Sierra (10.12) | Ventura (13) |  |
| RX 480 | Sierra (10.12) | Ventura (13) |  |
| RX 550 | Sierra (10.12) | Ventura (13) | Baffin Core |
| RX 560 | Sierra (10.12) | Ventura (13) |  |
| RX 560X | Sierra (10.12) | Ventura (13) |  |
| RX 570 | Sierra (10.12) | Ventura (13) |  |
| RX 570X | Sierra (10.12) | Ventura (13) |  |
| RX 580 | Sierra (10.12) | Ventura (13) |  |
| RX 580X | Sierra (10.12) | Ventura (13) |  |
| RX 590 | Sierra (10.12) | Ventura (13) |  |
| Radeon Pro: E9550 | Sierra (10.12) | Ventura (13) |  |
| Radeon Pro: WX 4100 | Sierra (10.12) | Ventura (13) |  |
| Radeon Pro: WX 5100 | Sierra (10.12) | Ventura (13) |  |
| Radeon Pro: WX 7100 | Sierra (10.12) | Ventura (13) |  |

# Unsupported GPU's

{: .important }
While there are other GPU's that are supported up to Monterey and Big Sur, this guide focuses on the latest macOS, and unfortunately these cards below and others not mentioned, will not work in this guide without the user doing more manual modification, even as far as flashing custom VBIOS' which is out of the scope of this guide.

## Navi 2X and Navi 3X

{: .note }
While Navi 21 and Navi 23 are supported, Navi 22, Navi 24 and Navi 3X based graphic cards are not at the time of writing. No guarantee can be made for future support.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 6400 | None | None |  |
| RX 6500 XT | None | None |  |
| RX 6700 XT | None | None |  |
| RX 6750 XT | None | None |  |
| RX 7900 XT | None | None |  |
| RX 7900 XTX | None | None |  |

## Lexa Cores

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RX 540 | None | None |  |
| RX 540X | None | None |  |
| RX 550 | None | None | Lexa Core Variant is Unsupported |
| RX 550X | None | None | Lexa Core Variant is Unsupported |
| WX 2100 | None | None |  |
| WX 3100 | None | None |  |

<h1>Take me <a href="../../../">back</a>!</h1>