---
layout: default
title: BIOS Configuration
description: "Depending on your host hardware, you need to enable certain settings in your BIOS to ensure all options are available for later."
nav_order: 3
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
  <img width="650" height="200" src="../../assets/Headers/HeaderBIOSSettings.png">
</p>

<p align="center">Depending on your host hardware, you need to enable certain settings in your BIOS to ensure all options are available for later. Enable the settings listed in this table as needed for your CPU brand</p>

| BIOS Setting Purpose/Effect | AMD | Intel |
| ---- | ---- | ---- |
| Enables CPU Virtualization of Guests | SVM Mode | VT-x |
| Enables PCIe Object Mapping for Passthrough/Reassignment | IOMMU | VT-d |
| No Execution of Protected Guest Memory | NX Mode | XD (eXecute Disable) |

<p align="center">If you do not have any of the above settings readily visible, chances are it has been already enabled by default. Double-check that your BIOS is up to date and that your CPU and motherboard combination support virtualization and PCIe Object Mapping. No Execution Bit is important for Guest malware safety to prevent execution of marked memory, but is not required if not easily visible.</p>

<p align="center">You will now have to disable the following settings from your BIOS</p>

| BIOS Setting to Disable | Note |
| ---- | ---- |
| Above 4G Decoding | Does not work within OS X / macOS, breaks passthrough. |
| Resizable BAR | Does not work within OS X / macOS, breaks passthrough. |
| Smart Access Memory (SAM/CAM) | Can possibly be called this on Intel systems. Similar to ReBAR. |

<p align="center">There are workarounds to set the BAR size back to the default 256MB even with A4GD and RB enabled if you are someone who likes to dual-boot Windows, but at the moment no write-up has been complete for it. For now, it's recommended to disable such BIOS settings, if you cannot manually set your BAR sizes without a guide (here, currently). Once this has been resolved, most likely these warnings will be removed and will be a standard step during configuration.</p>

<p align="center">When you've rebooted and returned back to your terminal, you can issue the following command to check if Virtualization is enabled and supported on your system:</p>

```bash
lscpu | grep Virtualization
```

<p align="center">Example Output</p>

```bash
Virtualization: AMD-V
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-Git-Clone-Recursive">&larr; Back Page</a>
    <a class="nav-button" href="../03-Kernel-Parameters/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
