---
layout: default
title: Finding Device ID's
parent: Dual GPU Passthrough
nav_order: 1
---

# Finding PCIe Device ID's
#### Take note to use for later.

To proceed, you'll need to take note of your secondary GPU's Device ID's for all of its accompanying objects.

```bash
lspci -nn
```

I've isolated the intended GPU below so it's easier to see.
Example Output:

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

Take note of the Device ID's as seen below:


```bash
NVIDIA Corporation GF100 [GeForce GTX 470] [10de:06cd]
NVIDIA Corporation GF100 High Definition Audio Controller [10de:0be5]
```

```
10de:06cd,10de:0be5
```

## You can now continue to the next <a href="../02-KernelParameters/index">page</a>.