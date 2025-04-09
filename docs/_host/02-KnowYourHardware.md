---
layout: default
title: Know Your hardware
description: "How to inspect and take note of the hardware present in your system on Linux."
nav_order: 2
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
  <img width="650" height="200" src="../../assets/Headers/HeaderKnowYourHardware.png">
</p>

<h2 align="center">Get ready to keep note of all your hardware!</h2>
<br>

<p align="center">We'll start by writing down the CPU, Motherboard, and GPU information. It’s essential to check that your storage devices, such as NVMe drives, are recognized and perform well with macOS as well if you are interested in passing them through to an OS X / macOS guest. Physical storage passthrough is not required, but you'll be prepared for any situation by knowing all of your machine hardware.</p>

<p align="center">Ensuring compatibility with Wi-Fi & Bluetooth (if you plan to use it in the guest for Continuity), and Motherboard Audio chipsets is also important for a smooth experience when it comes to properly configuring your Hypervisor. In many cases it still makes sense to check how old your motherboard firmware (BIOS) is, and update it if necessary. This reduces the chances of future updates breaking or modifying your IOMMU groups (You'll learn what IOMMU is later!)</p>

<br>

{: .note }
You only need to open one of the following sections of instructions. Either manually search for the information using your Terminal, or use DarwinKVM's Main Menu options to use System Profiler.

<br>
<hr>
<details markdown="block">
<summary align="center">Using Terminal</summary>

{: .note }
The commands below should work regardless of the distribution of Linux you are using! There are multiple ways to get the same information, so if you are missing a package or a command does not work for you, try using the others in the intended section as a last resort.

<br>
<h2 id="finding-cpu-name" align="center">Finding CPU Name</h2>
<br>

<p align="center">The command below will probe /proc/cpuinfo and pretty print you the info you need</p>

```bash
grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f2 | xargs
```

<p align="center">This one is pretty simple, and should give you something like so:</p>

```bash
AMD Ryzen 7 3700X 8-Core Processor
```

<hr>
<h2 id="finding-gpu-name" align="center">Finding GPU Information</h2>
<br>

<p align="center">We'll need to know a decent amount about our Graphics Processing Units. You may have more than one in your system, please note that Integrated and Dedicated GPUs both count and will appear, you will want to know plenty for both. We'll get the GPU Name, the Vendor and Device ID as well. In this section, you'll also get the PCI location of the GPU, in case you require it later to disable non supported GPUs from being visible in OS X / macOS</p>

```bash
lspci -nn | grep -i -E 'vga|3d|2d|display'
```

<p align="center">The above command will search using LSPCI to gather all GPUs with the extended information like the PCI location, and the Vendor/Device ID. Example output is as follows:</p>

```bash
06:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c7)
```

- ``06:00.0`` is the PCI location

- ``Navi 23 [Radeon RX 6600/6600 XT/6600M]`` is the Generation and GPU Name

- ``[1002:73ff]`` is the Vendor and Device ID data

<hr>
<h2 id="finding-motherboard-chipset" align="center">Finding Motherboard Name/Chipset</h2>
<br>

<p align="center">This one is a bit trickier, as the information is not directly exposed in a command typically. Below we will start with the most universal option using Cat and reading from the filesystem.</p>

```bash
cat /sys/devices/virtual/dmi/id/board_vendor
cat /sys/devices/virtual/dmi/id/board_name
```

<p align="center">These two individual commands should print out something similar to below:</p>

```bash
[user@host ~]$ cat /sys/devices/virtual/dmi/id/board_vendor
ASUSTeK COMPUTER INC.
[user@host ~]$ cat /sys/devices/virtual/dmi/id/board_name
ROG STRIX B550-F GAMING
```

<p align="center">The command below is simply an easier way to execute both commands at the same time, to pretty print the information to write down.</p>

```bash
echo "$(cat /sys/devices/virtual/dmi/id/board_vendor) $(cat /sys/devices/virtual/dmi/id/board_name)"
```

<p align="center">If you have <code>dmidecode</code> installed, you can use the following command:</p>

```bash
sudo dmidecode -t baseboard | grep -E 'Manufacturer|Product'
```

<hr>
<h2 id="finding-storage-name" align="center">Finding Storage Name/Model/Type</h2>
<br>

<p align="center">Most, if not all Linux installations come with lsblk. We can use it to specifically find out what type of storage we have, and the Product Name/Model of it.</p>

```bash
lsblk -d -o NAME,MODEL
```

<p align="center">You should get something similar to the output below:</p>

```bash
NAME    MODEL
nvme0n1 WDS100T3X0C-00SJG0
nvme2n1 Samsung SSD 980 1TB
```

<hr>
<h2 id="finding-nic-controller" align="center">Finding Networking Controllers</h2>
<br>

<p align="center">We can again leverage LSPCI to parse out information related to Networking, and all types available on your system.</p>

```bash
lspci -nn | grep -i -E 'ethernet|network'
```

<p align="center">You may or may not getting something like the following:</p>

```bash
09:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3]
03:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6E(802.11ax) AX210/AX1675* 2x2 [Typhoon Peak] [8086:2725]
```

<p align="center">Let's break down the information.</p>

- ``09:00.0`` is the PCI location
- ``03:00.0`` is the PCI location

- ``Intel Corporation Ethernet Controller I225-V`` is the Brand, Type, and Chipset
- ``Intel Corporation Wi-Fi 6E(802.11ax) AX210/AX1675`` is the Brand, Type, and Chipset

- ``[8086:15f3]`` is the Vendor and Device ID data
- ``[8086:2725]`` is the Vendor and Device ID data

<hr>
<h2 id="finding-audio-chipset" align="center">Finding Sound Controller and Codecs</h2>
<br>

<p align="center">Like the motherboard information, finding out the specific Codec in use by your Sound Controller is a tad tricky and may require additional packages but, we'll try the universal methods first.</p>

```bash
lspci -nn | grep -i 'audio'
```

<p align="center">We start by getting all Audio Controllers on the system like so:</p>

```bash
06:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
0c:00.4 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD Audio Controller [1022:1487]
```

<p align="center">I'm sure by now, you understand how to read the command, let's get straight to figuring out the Codec in use right now.</p>

```bash
cat /proc/asound/card*/codec* | grep -m 1 "Codec"
```

<p align="center">This would give something similar to the following:</p>

```bash

```

<br>
<p align="center">If you cannot use the above method, and have the <code>aplay</code> command available on your system, you can use the following:</p>

```bash
aplay -l | grep -i codec
```

<p align="center">Where you may get similar output to below.</p>

```bash
card 1: Generic [HD-Audio Generic], device 0: ALC1220 Analog [ALC1220 Analog]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 1: Generic [HD-Audio Generic], device 1: ALC1220 Analog [ALC1220 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

<p align="center">We're looking for something similar to <code>ALC1220</code>. That is the Codec.</p>

</details>

<hr>

<details markdown="block">
<summary align="center">Using DarwinKVM's Menu</summary>

{: .internalnote }
This feature is still not available.

</details>

<hr>
<br>
<p align="center">Now that we've written all of that down, we can now go ahead and see if the hardware is supported.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-HardwareLimitations">&larr; Back Page</a>
    <a class="nav-button" href="../03-CompatibilityCharts/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
