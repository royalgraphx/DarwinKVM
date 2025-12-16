---
layout: default
title: NVIDIA
parent: GPU Support Chart
grand_parent: Compatibility Charts
nav_order: 2
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
  <img width="650" height="200" src="../../../../assets/Headers/HeaderNVIDIAGPUSupport.png">
</p>

{: .important }
As previously mentioned, some of the cards listed can use OpenCore Legacy Patcher to get them running on Big Sur/Monterey and newer, although no support is provided for Hacs. Understand that the software is meant for real Macs, and that using OpenGL on Graphics Cards which do not support Metal when the operating system relies on Metal, is simply not a longterm solution. You are on your own in that regard. Do not create issues in relation to NVIDIA and modern macOS and do not bother the OCLP team.

## Volta

{: .note }
This one is quite interesting, NVIDIA ended up releasing a driver for some Volta cards, however, it was short lived, getting pulled due to some issues. You can find them [here](https://github.com/dortania/PatcherSupportPkg/blob/master/Universal-Binaries/WebDriver-387.10.10.10.40.140/WebDriver-387.10.10.15.15.108.pkg).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Titan V | High Sierra (10.13.6, 17G3025) | High Sierra (10.13.6, 17G3035) |  |
| Titan V CEO Edition | High Sierra (10.13.6, 17G3035) | High Sierra (10.13.6, 17G3035) |  |
| Quadro GV100 | High Sierra (10.13.6, 17G3035) | High Sierra (10.13.6, 17G3035) |  |

## Pascal

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX Titan Xp (GP102-400 core) | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX Titan X (GP102-450 core) | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1080 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1080 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1070 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1070 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1060 | Sierra (10.12.4) | High Sierra (10.13.6) | GP104/GDDR5X variants are not supported. |
| GTX 1050 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1050 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GT 1030 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GT 1010 | Sierra (10.12.4) | High Sierra (10.13.6) | Theoretically. |
| Quadro GP100 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P6000 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P5000 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P4000 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P2000 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P1000 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P620 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P600 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| Quadro P400 | Sierra (10.12.4) | High Sierra (10.13.6) |  |

## Maxwell

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX Titan X (GM100 core) | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 980 Ti | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 980 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 970 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 960 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 950 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 750 Ti | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 750 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| GTX 745 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro M6000 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro M5000 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro M4000 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro M2000 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro K2200 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro K1200 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |
| Quadro K620 | Yosemite (10.10.0) | High Sierra (10.13.6) |  |

## Kepler

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 
> As of Monterey Beta 7, Kepler support was dropped.
> 
> GTX 745, 750, and Ti variants are not Kepler based.
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX Titan (GK110 core) | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX Titan Black (GK110 core) | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX Titan Z | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 780 Ti | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 780 | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 770 | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 760 Ti | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 760 | Mountain Lion (10.8) | Big Sur (11) |  |
| GT 740 | Mountain Lion (10.8) | Big Sur (11) | GK106 core versions have a memory leak problem |
| GT 730 (GK208 core) | Mountain Lion (10.8) | Big Sur (11) |  |
| GT 720 | Mountain Lion (10.8) | Big Sur (11) |  |
| GT 710 (GK208 core) | Mountain Lion (10.8) | Big Sur (11) |  |
| GTX 690 | Mountain Lion (10.8) | Big Sur (11) | nice |
| GTX 680 | Mountain Lion (10.8) | Big Sur (11) | |
| GTX 670 | Mountain Lion (10.8) | Big Sur (11) | |
| GTX 660 Ti | Mountain Lion (10.8) | Big Sur (11) | Suffers from a memory leak problem. |
| GTX 660 | Mountain Lion (10.8) | Big Sur (11) | Needs to be a GK104 core card. Suffers from a memory leak problem. |
| GTX 650 Ti | Mountain Lion (10.8) | Big Sur (11) | Suffers from a memory leak problem |
| GTX 650 | Mountain Lion (10.8) | Big Sur (11) | GK106 core versions have a memory leak problem. |
| GTX 645 | Mountain Lion (10.8) | Big Sur (11) | GK106 core versions have a memory leak problem. |
| GT 640 (GK107/GK208 core only) | Mountain Lion (10.8) | Big Sur (11) | GF116 vs GK107 can be found in the GT 640. Ensure you have the correct GPU die. |
| GT 635 | Mountain Lion (10.8) | Big Sur (11) | |
| GT 630 (GK107/GK208 core) | Mountain Lion (10.8) | Big Sur (11) | |
| Quadro K6000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K5200 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K5000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K4200 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K4000 | Mountain Lion (10.8) | Big Sur (11) | Suffers from a memory leak problem. |
| Quadro K2000D | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K2000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K600 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K420 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro 410 | Mountain Lion (10.8) | Big Sur (11) |  |
| NVS 510 | Mountain Lion (10.8) | Big Sur (11) |  |

## Fermi 2.0 (GF11X)

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 
> This represents the second generation of Fermi cards (GF110, GF114, GF116, GF119), which improved power efficiency and performance.
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX 580 | Lion (10.7) | High Sierra (10.13.6) | GF110 |
| GTX 570 | Lion (10.7) | High Sierra (10.13.6) | GF110 |
| GTX 560 Ti | Lion (10.7) | High Sierra (10.13.6) | GF114 (448 Core variant not supported) |
| GTX 560 | Lion (10.7) | High Sierra (10.13.6) | GF114 |
| GTX 550 Ti | Lion (10.7) | High Sierra (10.13.6) | GF116 |
| GTX 550 | Lion (10.7) | High Sierra (10.13.6) | Theoretically. |
| GT 720A | Lion (10.7) | High Sierra (10.13.6) | GF117 (Rebrand) |
| GT 710 | Lion (10.7) | High Sierra (10.13.6) | GF119 (Rebrand) |
| GT 705 | Lion (10.7) | High Sierra (10.13.6) | GF119 (Rebrand) |
| GT 640 | Lion (10.7) | High Sierra (10.13.6) | GF116 variant (Most are Kepler) |
| GT 610 | Lion (10.7) | High Sierra (10.13.6) | GF119 (Rebrand of GT 520) |
| GT 520 | Lion (10.7) | High Sierra (10.13.6) | GF119 |

## Fermi 1.0 (GF10X)

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 
> This represents the first generation of Fermi cards (GF100, GF104, GF106, GF108).
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX 480 | Lion (10.7) | High Sierra (10.13.6) | GF100 |
| GTX 470 | Lion (10.7) | High Sierra (10.13.6) | GF100 |
| GTX 465 | Lion (10.7) | High Sierra (10.13.6) | GF100 |
| GTX 460 | Lion (10.7) | High Sierra (10.13.6) | GF104 |
| GT 730 | Lion (10.7) | High Sierra (10.13.6) | GF108 variant (Rebrand) |
| GT 630 | Lion (10.7) | High Sierra (10.13.6) | GF108 variant (Rebrand) |
| GT 620 | Lion (10.7) | High Sierra (10.13.6) | GF108 variant (Rebrand) |
| GT 440 | Lion (10.7) | High Sierra (10.13.6) | GF106/GF108 |
| GT 430 | Lion (10.7) | High Sierra (10.13.6) | GF108 |
| Quadro 4000 Mac Edition | Lion (10.7) | High Sierra (10.13.6) | GF100 |
| Quadro 2000 | Lion (10.7) | High Sierra (10.13.6) | GF106 |
| Quadro 600 | Lion (10.7) | High Sierra (10.13.6) | GF108 |

## Tesla

{: .note }
> Minimum High Sierra build required for the [NVIDIA Web Drivers](https://images.nvidia.com/mac/pkg/387/WebDriver-387.10.10.10.40.140.pkg) is <code>17G14042</code>.
> 
> Update your installation from the App Store or Software Update to the latest build before installing any web drivers on any version of OS X and macOS.
> 
> Use `nv_disable=1` if necessary to boot without drivers to install web drivers.
> 

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX 285 | Leopard (10.5.6) | High Sierra (10.13.6) |  |
| GTX 280 | Leopard (10.5.6) | High Sierra (10.13.6) |  |
| GTX 275 | Leopard (10.5.6) | High Sierra (10.13.6) |  |
| GTX 260 | Leopard (10.5.6) | High Sierra (10.13.6) |  |
| GTS 250 | Leopard (10.5.6) | High Sierra (10.13.6) |  |
| GT 120 | Leopard (10.5.6) | High Sierra (10.13.6) | Rebranded 9500 GT |
| 9800 GT | Leopard (10.5.2) | High Sierra (10.13.6) |  |
| 9600 GT | Leopard (10.5.2) | High Sierra (10.13.6) |  |
| 8800 GT | Leopard (10.5.2) | High Sierra (10.13.6) |  |
| 8800 GTX | Leopard (10.5.2) | High Sierra (10.13.6) |  |
| Quadro FX 5600 | Leopard (10.5.2) | High Sierra (10.13.6) |  |
| Quadro FX 4800 | Leopard (10.5.2) | High Sierra (10.13.6) |  |

## Unsupported GPUs

### Blackwell (RTX 50XX)

{: .note }
No support for these GPUs at all. No drivers were ever written for macOS.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RTX 5090 | None | None | |
| RTX 5080 | None | None | |
| RTX 5070 / Ti | None | None | |
| RTX 5060 / Ti | None | None | |
| RTX 5050 | None | None | |
| RTX PRO 6000 Blackwell | None | None | Workstation |
| RTX PRO 5000 Blackwell | None | None | Workstation |

### Hopper (H100/H200)

{: .note }
No support for these GPUs. Data Center accelerators.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| H100 | None | None | |
| H200 | None | None | |
| GH200 | None | None | Grace Hopper Superchip |

### Ada Lovelace (RTX 40XX)

{: .note }
No support for these GPUs at all. No drivers were ever written for macOS.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RTX 4090 | None | None | |
| RTX 4080 / Super | None | None | |
| RTX 4070 Ti / Super | None | None | |
| RTX 4070 / Super | None | None | |
| RTX 4060 Ti | None | None | |
| RTX 4060 | None | None | |
| RTX 6000 Ada | None | None | Workstation |
| RTX 5000 Ada | None | None | Workstation |
| RTX 4500 Ada | None | None | Workstation |
| RTX 4000 Ada | None | None | Workstation |

### Ampere (RTX 30XX)

{: .note }
No support for these GPUs at all. No drivers were ever written for macOS.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| RTX 3090 Ti | None | None | |
| RTX 3090 | None | None | |
| RTX 3080 Ti | None | None | |
| RTX 3080 | None | None | |
| RTX 3070 Ti | None | None | |
| RTX 3070 | None | None | |
| RTX 3060 Ti | None | None | |
| RTX 3060 | None | None | |
| RTX 3050 | None | None | |
| RTX A6000 | None | None | Workstation |
| RTX A5000 | None | None | Workstation |
| RTX A4000 | None | None | Workstation |

### Turing (RTX 20XX / GTX 16XX)

{: .note }
No support for these GPUs at all. No drivers were ever written for macOS.

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Titan RTX | None | None | |
| RTX 2080 Ti | None | None | |
| RTX 2080 / Super | None | None | |
| RTX 2070 / Super | None | None | |
| RTX 2060 / Super | None | None | |
| GTX 1660 Ti | None | None | |
| GTX 1660 / Super | None | None | |
| GTX 1650 / Super | None | None | |
| GTX 1630 | None | None | |
| Quadro RTX 8000 | None | None | |
| Quadro RTX 6000 | None | None | |
| Quadro RTX 5000 | None | None | |
| Quadro RTX 4000 | None | None | |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../02-GPU/index">&larr; Back Page</a>
    <a class="nav-button" href="../../../04-PostCheck">Next Page &rarr;</a>
  </div>
  <br>
</h2>
