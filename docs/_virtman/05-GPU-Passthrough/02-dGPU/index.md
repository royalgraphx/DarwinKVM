---
layout: default
title: Dual GPU Passthrough
description: "Placeholder"
parent: GPU Passthrough
has_children: true
has_toc: false
nav_order: 2
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-dGPU-PT.png">
</p>

<h2 align="center">Current Tasks</h2>

| **Step** | **Quick Description** |
| --- | --- |
| **Finding Device IDs** | To begin blocking kernel modules from loading onto your desired passthrough hardware, you'll first need to take note of their Vendor and Device IDs. This data is used later to blacklist them from loading with specific kernel modules on boot. |
| **Setting Kernel Parameters** | Now it's time to choose your bootloader and update the kernel parameters like the first time, but now you've got to add a line that defines what devices should use <code>vfio-pci</code> kernel module, to have it automatically load if possible. |
| **Configuring modprobe** | More than likely, another kernel module will load before <code>vfio-pci</code> can hook your hardware. For this reason, we'll manually check which kernel module that is, and blacklist it from loading, until only <code>vfio-pci</code> loads on it. |
| **Configuring Virt-Manager** | It's now ready to be added to your DarwinKVM machine! This setup is a tad tricky when it comes to Dual GPU setups, because you need to figure out your keyboard and mouse situation here or later. This also makes Audio tricky, when trying to use multiple OSs at the same time, i.e Linux and OS X / macOS, you'll want enough hardware for both or a physical KVM switch. |
| **Complete!** | Once done, you can now boot this virtual machine and enjoy acceleration via the GPU output on a secondary monitor! |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index">&larr; Back Page</a>
    <a class="nav-button" href="../01-FindingDevIDs">Next Page &rarr;</a>
  </div>
  <br>
</h2>
