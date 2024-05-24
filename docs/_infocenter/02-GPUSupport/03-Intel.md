---
layout: default
title: Intel
parent: GPU Compatibility Chart
nav_order: 3
---

# macOS Intel iGPU Support Table
#### This section has been derived from various sources.

<br>

{: .warning }
This sections is currently a work in progress, and information here may be incorrect. (There is def incorrect info still.) If you seem to spot an error or have better information, please feel free to make a pull request for this page! Intel experts needed for validity/sanity check.

{: .headsup }
This support table does not indicate whether or not iGPU passthrough is possible on a given generation. This support table simply aims to store a local copy of supported iGPUs within various Mac OS X / macOS releases. If managed to be passed through to a guest, they should *theoretically* work. Be aware it will still require the usual configuration within OpenCore.

# Ice Lake

{: .note }
Most iGPUs in the generation have support (except the unsupported "UHD Graphics" G1)

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Iris Plus G4 | Catalina (10.15.4) | Sonoma (14) |  |
| Iris Plus G7 | Catalina (10.15.4) | Sonoma (14) |  |

# Kaby/Coffee/Whiskey/Comet Lake (Refresh/Non-Refresh)

{: .note }
Most iGPUs are supported here (except the UHD 610 in the i5-10200H), though pay attention as the i3-8100 and i3-8350K use a [different UHD 630](https://en.wikipedia.org/wiki/Intel_Graphics_Technology#Kaby_Lake_Refresh_/_Amber_Lake_/_Coffee_Lake_/_Whiskey_Lake) (184 shader units vs 192 shader units) than the rest of the CPU family which requires spoofing for support in High Sierra and above.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| UHD 615 | High Sierra (10.13.6) | Sonoma (14) |  |
| UHD 617 | High Sierra (10.13.6) | Sonoma (14) |  |
| UHD 620 | High Sierra (10.13.6) | Sonoma (14) |  |
| UHD 630 | High Sierra (10.13.6) | Sonoma (14) |  |
| Iris Plus 645 | High Sierra (10.13.6) | Sonoma (14) |  |
| Iris Plus 655 | High Sierra (10.13.6) | Sonoma (14) |  |

# Skylake

{: .note }
Ventura (13) dropped support for Skylake iGPUs. However, since Skylake and Kaby Lake iGPUs are so similar, Skylake iGPUs can be spoofed as Kaby Lake in order to make use of the Kaby Lake kexts, which are still present in Sonoma.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 515 | El Capitan (10.11.4) | Monterey (12) |  |
| HD 520 | El Capitan (10.11.4) | Monterey (12) |  |
| HD 530 | El Capitan (10.11.4) | Monterey (12) |  |
| HD P530 | El Capitan (10.11.4) | Monterey (12) |  |
| Iris 540 | El Capitan (10.11.4) | Monterey (12) |  |
| Iris 550 | El Capitan (10.11.4) | Monterey (12) |  |
| Iris Pro 580 | El Capitan (10.11.4) | Monterey (12) |  |
| Iris Pro P555 | El Capitan (10.11.4) | Monterey (12) |  |
| Iris Pro P580 | El Capitan (10.11.4) | Monterey (12) |  |

# Broadwell

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 5300 | Yosemite (10.10.2) | Monterey (12) |  |
| HD 5500 | Yosemite (10.10.2) | Monterey (12) |  |
| HD 5600 | Yosemite (10.10.2) | Monterey (12) |  |
| HD 6000 | Yosemite (10.10.2) | Monterey (12) |  |
| HD 6100 | Yosemite (10.10.2) | Monterey (12) |  |
| HD 6200 | Yosemite (10.10.2) | Monterey (12) |  |
| Iris Pro P6300 | Yosemite (10.10.2) | Monterey (12) |  |

# Haswell

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 4200 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 4400 | Mountain Lion (10.8) | Monterey (12) | Needs device-id spoof to 0x0412 |
| HD 4600 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 5000 | Mountain Lion (10.8) | Monterey (12) |  |
| HD 5100 | Mountain Lion (10.8) | Monterey (12) |  |

# Ivy Bridge

| Card | Initial Support | Latest Support | Notes |
| -- | --- | --- | ---- |
| HD 2500 | Lion (10.7) | Big Sur (11) | Partial support for Quick Sync features. Requires a dGPU.  |
| HD 4000 | Lion (10.7) | Big Sur (11) |  |
| HD P4000 | Lion (10.7) | Big Sur (11) |  |

# Sandy Bridge

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 2000 | Snow Leopard (10.6) | High Sierra (10.13.6) | Partial support for Quick Sync features. Requires a dGPU. |
| HD 3000 | Snow Leopard (10.6) | High Sierra (10.13.6) | Requires various files including but not limited to AppleIntelHD3000Graphics.kext |
| HD P3000 | Snow Leopard (10.6) | High Sierra (10.13.6) | Would assume works OOB, or spoofed as HD 3000 (0x0116) |

# Westmere

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD Graphics | Snow Leopard (10.6) | High Sierra (10.13.6) | Apparently, this is really how they all appear named... |

# 4th Gen GMA iGPUs

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GMA 3000 | Leopard (10.5) | Lion (10.7) |  |
| GMA X3000 | Leopard (10.5) | Lion (10.7) |  |
| GMA X3500 | Leopard (10.5) | Lion (10.7) |  |
| GMA 4500 | Leopard (10.5) | Lion (10.7) |  |
| GMA 4500MHD | Leopard (10.5) | Lion (10.7) |  |
| GMA X4500 | Leopard (10.5) | Lion (10.7) |  |
| GMA X4500HD | Leopard (10.5) | Lion (10.7) |  |

# 3rd Gen GMA iGPUs

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GMA 950 | Tiger (10.4) | Lion (10.7) |  |
| GMA 900 | Tiger (10.4) | Lion (10.7) | Partial support in 10.6 and 10.7, however acceleration issues are common |
| GMA X3100 | Tiger (10.4) | Lion (10.7) | Only Mobile models (ie. 965 Express Chipset Family) |

# Unsupported iGPUs

## ARC Series

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| A310 | None | None |  |
| A380 | None | None |  |
| A580 | None | None |  |
| A750 | None | None |  |
| A770 | None | None |  |
| A350M | None | None |  |
| A370M | None | None |  |
| A550M | None | None |  |
| A730M | None | None |  |
| A770M | None | None |  |
| A30M | None | None |  |
| A40 | None | None |  |
| A50 | None | None |  |

## Xe Series

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Intel® Iris® Xe graphics | None | None | Applies to all Xe based iGPUs |

## UHD Series

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| UHD 600 | None | None | Gemini Lake |
| UHD 605 | None | None | Gemini Lake |
| UHD 610 | None | None | Kaby/Coffee/Whiskey/Comet Lake |
| UHD Graphics for 10th Gen | None | None | Ice Lake |
| UHD Graphics for 11th Gen | None | None | Tiger/Rocket Lake |
| UHD Graphics for 12th Gen | None | None | Alder/Rocket Lake |
| UHD Graphics for 13th Gen | None | None | Raptor Lake |
| UHD Graphics for 14th Gen | None | None | Raptor Lake |

## HD Series

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| HD 400 | None | None | Braswell |
| HD 405 | None | None | Braswell |
| HD 500 | None | None | Apollo Lake |
| HD 505 | None | None | Apollo Lake |
| HD 510 | None | None | Skylake |
| HD 610 | None | None | Kaby Lake / Pentium G4560. |

## 3rd Gen GMA iGPUs

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GMA 3100 | None | None |  |
| GMA 3150 | None | None | GMA 3150's can be spoofed for support, however proper acceleration is missing |
