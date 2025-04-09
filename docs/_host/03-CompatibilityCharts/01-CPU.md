---
layout: default
title: CPU Support Check
parent: Compatibility Charts
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

  .intel-next-button-container {
    text-align: right;
  }

  .intel-next-button {
    margin: 10px;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../../../assets/Headers/HeaderCPUSupportCheck.png">
</p>

<p align="center">The chart below already ensures the CPU has VT-x or SVM for virtualization of Virtual Machines</p>

| **Minimum macOS Version** | **Required Instruction Set** | **Intel (Earliest CPU with VT-x)** | **AMD (Earliest CPU with AMD-V/SVM)** |
|:---------------------------|:-----------------------------|:------------------------------------|:---------------------------------------|
| **Tiger (10.4) or later** | SSE3 | **Pentium 4 (Prescott, 2004)** | Athlon 64 (Rev E, 2005) |
| **Sierra (10.12) or later** | SSE4 | **Core 2 Duo E8xxx series** (2008) | Phenom II (Deneb/Thuban, 2009) |
| **Mojave (10.14) or later** | SSE4.1 | **Core 2 Duo E8xxx series** (2008) | Bulldozer (2011) |
| **Ventura (13) or later** | AVX2 | Haswell (4th Gen, 2013) | Excavator (Carrizo, 2015) |

<p align="center">Essentially, any CPU that has Virtualization and meets the minimum instruction set feature version for the desires OS X / macOS can run DarwinKVM. CryptexFixup has the ability to bypass AVX2 for booting, but cannot bypass AMD GPU kernel extensions that require AVX2 for Graphics Acceleration. If you are using an older AMD dGPU that does not use AVX2 but is supported on Ventura or newer (13+) with CF, it may work but is untested/unreported in the Discord yet.</p>

<p align="center">If your Host CPU does not have the above required CPU Instruction Set Extensions required to boot a specific OS release, then the Guest OS will also not be able to boot that OS X / macOS release. Any modern (post-2016) CPU from AMD or Intel should run the entirety of DarwinKVM as expected with full Guest support! This means being able to run Tiger (10.4) -> Latest macOS with a time period correct dedicated GPU to give to the guest.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-GPU/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
