---
layout: default
title: Table of Contents
description: "This page lets you see and navigate to any Write-Up available in DarwinKVM."
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
</style>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/Header-Write-Ups.png">
</p>

{: .internalnote }
A lot of the following write-ups are still broken. Screenshots are not loading, there are various broken links, and overall things should be fixed soon. The core DarwinKVM experience is near complete, and was worth migrating over.

<h5 align="center">Click on the name of any Write-Up to go through it!</h5>

| **Name** | **Quick Description** |
| --- | --- |
| <a href="../02-Custom-Memory-Mapping/index"><b>Custom Memory Mapping</b></a> | On Mac Pro machines, the RAM layout is to be a specific setup as is true with your own host motherboard, when doing dual channel memory. The guest, will simply place the RAM in any random order and amount and in any amount of RAM sticks. You will get either a pop-up window from the Memory Utility on older OS X, and a persistent notification on newer macOS, that your Mac Pro's Memory is misconfigured. You can use OpenCore, to set a memory map up. This will force the Darwin kernel to see the RAM as you describe, eliminating the popup and error. |
| <a href="../03-FakeCoreCount/index"><b>Fake Core Count</b></a> | On most host machines, you'll have an uneven topology to share with the guest. To remedy this, you can essentially copy the host topology and disable 2 threads to leave the primary core to the host. This boosts performance and maximizes the amount of CPU power you can squeeze, while still being able to properly boot OS X / macOS. |
| <a href="../04-ThreadPinning/index"><b>Thread Pinning</b></a> | QEMU binaries by default will jump around which host thread is currently handling the virtualization. You can essentially force the host to not move the QEMU binary across multiple and random threads, by pinning them to a specific thread. This greatly can improve multi-threaded performance and guest experience. |
| <a href="../05-VirtIOThread/index"><b>VirtIO Thread</b></a> | For those using a VirtIO disk image as their OS X / macOS install disk, it can be beneficial to create a specific thread process for handling R/W I/O from VirtIO. This can also improve guest performance by making the VirtIO disk even faster than it already is. On higher count hosts, you can add more threads dedicated to VirtIO paravirtualized hardware. |
| <a href="../06-MotherboardAudio/index"><b>Motherboard Audio</b></a> | Depending on your Single or Dual GPU configuration, you may want to set up your motherboard 3.5mm headphone audio ports. This requires that your Codec is supported by either AppleALC or VoodooHDA. This will have the same hardware requirements as a normal baremetal install. |
| <a href="../07-EvdevKBM/index"><b>Evdev Keyboard and Mouse</b></a> | This is mainly for those on Dual GPU passthrough setups that require the ability to swap their keyboard and mouse in and out of the guest using a keybind. This is practically required on Dual GPU setups that do not have a hardware KVM switch for swapping which USB port the keyboard and mouse are plugged into, i.e the Host USB controller, or the controller you passed through to the guest. |
| <a href="../08-USB-Mapping/index"><b>USB Mapping</b></a> | Required for Bluetooth and proper USB voltage control. When passing your USB Controllers in to the guest, you will still need to do the normal routine of mapping your USB ports by telling macOS or OS X what port is where and what kind it is. This is required to properly power various hardware such as charging an iPhone with your real USB controllers. |
| <a href="../09-RestrictEvents/index"><b>RestrictEvents Usage</b></a> | This page goes over useful ways to use RestrictEvents under DarwinKVM and for what purpose. |
| <a href="../10-DeviceProperties/index"><b>DeviceProperties</b></a> | This is a nice area that maintains various Device Properties that would be required for passed through harware to get it matched with its intended kernel extensions. This would mainly feature device-id examples, and spoofs of that nature. |
| <a href="../11-sPPT/index"><b>sPPT / Zero-RPM Disable</b></a> | This write-up describes how to use Windows to dump the VBIOS of your RX GPU to get it's SoftPowerPlay Table data. This data can be modified to remove the Zero-RPM Fan disable features. This is useful for those who are uncomfortable with the Fan Curve by default on AMD GPUs under macOS. Some GPUs won't spin the fans until they hit 60c! |
| <a href="../12-DisplayOverrides/index"><b>Display Overrides</b></a> | Sometimes, macOS or OS X may confuse your monitor with a TV. It can also not fully understand the High DPI resolutions the monitor can handle. You can essentially override the Display data and this section goes over how to do that and resolve Night Shift, and High DPI not working. |
| <a href="../13-Bridge/index"><b>Bridged Networking</b></a> | This is an advanced networking guide for creating host bridges. This allows guest KVMs to initialize the paravirtualized or emulated NIC connected to a bridged interface. This means you can spawn virtual machines that appear on the broader network, and have a local IP address on your LAN. This can be useful if you have multiple KVMs and SSH between them, or SSH from your other devices to your KVM guests. |
| <a href="../14-HostOC/index"><b>Host Overclocking</b></a> | This is a very small page that goes over using the Main Menu option to quickly use CPU Power Tools to set the CPU to the fastest scheduler available. Many ways to do this, and not this one is required, but its something to consider when running guests is to overclock the host CPU to maintain clock speeds. |
| <a href="../15-OCLP/index"><b>Legacy NVIDIA Patching</b></a> | There are actually many steps required to get Legacy NVDIA GPUs working under OS X. This includes setting up various Device Properties that are required to properly configure these legacy GPUs under old OS X. |

<p align="center">Each Write-Up will guide you through the necessary steps to ensure a smooth configuration experience while also intending to teach you as much information as possible.</p>

<p align="center">You don't necessarily have to do any of these besides maybe Evdev on Dual GPU Passthrough, and USB Mapping for those in Single GPU Passthrough but expanding/perfecting your experience is always worthwhile when given the time and instructions.</p>

<br>
<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../virtman/05-GPU-Passthrough/index/">&larr; Back Page</a>
  </div>
  <br>
</h2>
