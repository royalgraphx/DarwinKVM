---
layout: default
title: Virtio IO Threads
description: "Placeholder"
has_children: true
has_toc: true
nav_order: 5
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderVirtIOThreads.png">
</p>

This simple guide explains how to find your first core and utilize it as an IO Thread! This is useful for those who do not pass through an NVMe drive and want to feel some overall speed improvement when using Virtio virtual disks. Install the ``hwloc`` package to be able to use ``lstopo`` to identify pins.
