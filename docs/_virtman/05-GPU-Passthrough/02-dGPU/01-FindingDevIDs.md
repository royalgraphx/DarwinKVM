---
layout: default
title: Finding Device IDs
parent: Dual GPU Passthrough
grand_parent: GPU Passthrough
nav_order: 1
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

<br>
<h2 align="center"><b>Finding PCIe Device IDs</b></h2>
<h4 align="center">Take note to use for later.</h4>
<br>

<p align="center">To proceed, you'll need to take note of your secondary GPUs Device IDs for all of its accompanying objects.</p>

```bash
lspci -nn
```

<p align="center">I've isolated the intended GPU below so it's easier to see.</p>
<p align="center">Example Output:</p>

```bash
[royalgraphx@hypervisor ~]$ lspci -nn
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data Fabric: Device 18h; Function 0 [1022:1440]
01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Black SN750 / PC SN730 / Red SN700 NVMe SSD [15b7:5006]

04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF100 [GeForce GTX 470] [10de:06cd] (rev a3)
04:00.1 Audio device [0403]: NVIDIA Corporation GF100 High Definition Audio Controller [10de:0be5] (rev a1)

05:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller 980 [144d:a809]
07:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3] (rev 02)
08:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch [1002:1478] (rev c7)
09:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c7)
0a:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
0b:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Function [1022:148a]
```

<p align="center">Take note of the Device ID's as seen below:</p>

```bash
NVIDIA Corporation GF100 [GeForce GTX 470] [10de:06cd]
NVIDIA Corporation GF100 High Definition Audio Controller [10de:0be5]
```

```
10de:06cd,10de:0be5
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-KernelParameters/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
