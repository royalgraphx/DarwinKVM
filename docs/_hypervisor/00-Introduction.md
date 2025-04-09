---
layout: default
title: Understanding Tasks
description: "We'll need to quickly go over all of the current tasks to get an understanding of what we'll be doing for the remainder of the project."
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
  <img width="650" height="200" src="../../assets/Headers/HeaderCurrentTasks.png">
</p>

<h5 align="center">We'll cover how to prepare you and your host machine for running QEMU/KVM virtual machines.</h5>

| **Step** | **Quick Description** |
| --- | --- |
| **Using Git to Clone the Repository** | This seems simple enough, but we take time to ensure that all users understand how to properly download and acquire DarwinKVM from Github, along with all of its submodules, which can be double checked from DKVMs Menu, but this step is crucial to begin. |
| **BIOS Configuration** | Double checking that your motherboard settings are properly configured so that we have the best/ideal starting point for Linux + QEMU and ensuring that IOMMU is available to the system. |
| **Kernel Parameters** | These are essentially the Linux boot arguments passed to your kernel when booting Linux. We'll want to make sure we're using the appropriate boot arguments (parameters) for our system depending on Host CPU and intended GPU usage. |
| **Package Installation** | DarwinKVM supports instructions for a variety of Linux distributions. Walk through your section (or closest related section) to quickly get all of the required packages with your package manager. |
| **Package Configuration** | Various Linux distributions need to be configured in their own unique way. The goal is to properly configure Virt-Manager and its permissions, and you can follow through your related section to accomplish this. |
| **Host/Guest Networking** | Setting up the Default virtual network that shares the host internet connection to guests. This page describes in detail how this works and why we'll need networking available in OS X / macOS. More advanced networking setups are supported, such as Bridged and Passthrough of physical Wi-Fi cards for continuity features, not so much internet connectivity. |
| **IOMMU Viability** | Once the host is configured and kernel parameters are in effect, we can now view how the motherboard is laying out the IOMMU tables. Learning about how to read these tables, and determining if you are able to successfully passthrough devices to guests, is a crucial step. This can make or break your setup. Even if you have a supported GPU, if your IOMMU groups are non-viable, then you could be out of luck. |
| **Guest Install Target Type** | Selection of the intended OS X / macOS guest to configure and install. This page points to both PowerPC and Intel releases. |

<p align="center">Each section will guide you through the necessary steps to ensure a smooth configuration experience while also intending to teach you as much information as possible.</p>

<br>
<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../host/03-PostCheck">&larr; Back Page</a>
    <a class="nav-button" href="../01-Git-Clone-Recursive">Next Page &rarr;</a>
  </div>
  <br>
</h2>
