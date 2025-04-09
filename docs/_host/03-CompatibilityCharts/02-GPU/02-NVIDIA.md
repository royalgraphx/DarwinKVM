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
As previously mentioned, most of the cards listed can use OpenCore Legacy Patcher to get them running on Big Sur/Monterey and newer, although no support is provided for Hacs. Understand that the software is meant for real Macs, and that using OpenGL on Graphics Cards when the operating system relies on Metal, is simply not a longterm solution. You are on your own.

## Volta

{: .note }
This one is quite interesting, NVIDIA ended up releasing a driver for some Volta cards, however, it was short lived, getting pulled due to some issues. You can find them [here](https://github.com/dortania/PatcherSupportPkg/blob/master/Universal-Binaries/WebDriver-387.10.10.10.40.140/WebDriver-387.10.10.15.15.108.pkg).

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| Titan V | High Sierra (10.13.6, 17G3025) | High Sierra (10.13.6, 17G3035) |  |
| Titan V CEO Edition | High Sierra (10.13.6, 17G3035) | High Sierra (10.13.6, 17G3035) |  |
| Quadro GV100 | High Sierra (10.13.6, 17G3035) | High Sierra (10.13.6, 17G3035) |  |

## Pascal

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX Titan Xp (GP102-400 core) | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX Titan X (GP102-450 core) | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1080 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1080 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1070 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1070 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1060 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1050 Ti | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GTX 1050 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GT 1030 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
| GT 1010 | Sierra (10.12.4) | High Sierra (10.13.6) |  |
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
| GTX 660 Ti | Mountain Lion (10.8) | Big Sur (11) | |
| GTX 660 | Mountain Lion (10.8) | Big Sur (11) | Needs to be a GK104 core card. |
| GTX 650 Ti | Mountain Lion (10.8) | Big Sur (11) | Suffers from a memory leak problem |
| GTX 650 | Mountain Lion (10.8) | Big Sur (11) | GK106 core versions have a memory leak problem |
| GTX 645 | Mountain Lion (10.8) | Big Sur (11) | GK106 core versions have a memory leak problem |
| GT 640 (GK107/GK208 core) | Mountain Lion (10.8) | Big Sur (11) | |
| GT 635 | Mountain Lion (10.8) | Big Sur (11) | |
| GT 630 (GK107/GK208 core) | Mountain Lion (10.8) | Big Sur (11) | |
| Quadro K6000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K5200 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K5000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K4200 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K4000 | Mountain Lion (10.8) | Big Sur (11) | Suffers from a memory leak problem |
| Quadro K2000D | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K2000 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K600 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro K420 | Mountain Lion (10.8) | Big Sur (11) |  |
| Quadro 410 | Mountain Lion (10.8) | Big Sur (11) |  |
| NVS 510 | Mountain Lion (10.8) | Big Sur (11) |  |

## Fermi (Rebranded)

| Card | Initial Support | Latest Support | Notes |
| --- | --- | --- | --- |
| GTX 480 | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 730 (GF108 core) | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 720A | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 710 (GF119 core) | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 705 | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 640 (GF108/GF116 core) | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 630 (GF108 core) | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 620 | Lion (10.7) | High Sierra (10.13.6) |  |
| GT 610 | Lion (10.7) | High Sierra (10.13.6) |  |
| Quadro 4000 Mac Edition | Lion (10.7) | High Sierra (10.13.6) |  |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../02-GPU/index">&larr; Back Page</a>
    <a class="nav-button" href="../../../04-PostCheck">Next Page &rarr;</a>
  </div>
  <br>
</h2>
