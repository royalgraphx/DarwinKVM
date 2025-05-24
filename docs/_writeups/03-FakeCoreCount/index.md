---
layout: default
title: Fake Core Count
description: "This guide explains how to customize your XML to maximize Core utilization in your macOS Virtual Machines."
has_children: true
has_toc: false
nav_order: 3
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
  <img width="650" height="200" src="../../../assets/Headers/Header-Fake-Core-Count.png">
</p>

{: .headsup }
This write-up only explains Fake Core Count. For [Thread Pinning](../../02-ThreadPinning/index), [Virtio Disk IO Threads](../../03-VirtIOThread/index), and [Host CPU Clockspeed Overclocking](../../04-HostOC/index) visit the respective write-ups to continue customizing.

This write-up explains how to customize your XML to maximize Core utilization in your macOS Virtual Machines. If you've noticed, when you set improper CPU Topology you can no longer boot macOS. This is due in part, to supposedly QEMU not making a proper CPU setup in ACPI if it's not a power of 2, and some part as to the limitations of Intel CPU's used in physical Macs. This issue is most common when running AMD Hosts, as it is hard to utilize the most cores because of uneven topology, as well as other special custom topologies.

<p align="center">
  <img width="650" height="200" src="../../../assets/DarwinKVM/Host-HTOP-Example.png">
</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../01-Prerequisites">Next Page &rarr;</a>
  </div>
  <br>
</h2>
