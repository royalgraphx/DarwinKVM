---
layout: default
title: Fake Core Count
nav_order: 7
has_children: true
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderFCC.png">
</p>

This guide explains how to customize your XML to maximize Core utilization in your macOS Virtual Machines. If you've noticed, when you set improper CPU Topology you can no longer boot macOS. This is due in part, to supposedly QEMU not making a proper CPU setup in ACPI if it's not a power of 2, and some part as to the limitations of Intel CPU's used in physical Macs. This issue is most common when running AMD Hosts, as it is hard to utilize the most cores because of uneven topology, as well as other special custom topologies.

<p align="center">
  <img width="650" height="200" src="../../../assets/TerminalHTOP.png">
</p>

This write-up only explains Fake Core Count. For [CPU Pinning](../../09-CPUPinning/index), [Virtio Disk IO Threads](../../13-VirtioIOThread/index), and [Host Overclocking](../../08-HostOC/index) visit the respective write-ups to continue customizing.