---
layout: default
title: Custom Memory Mapping
description: "Placeholder"
has_children: true
has_toc: true
nav_order: 2
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderCMM.png">
</p>

This write-up goes over how to use the included Memory Maps for standardized RAM sizes, as well as teaches the reader how to create their own maps from the derived information.

<p align="center">
  <img width="650" height="200" src="../../../assets/VMMemoryError.png">
</p>

This is most likely done to fix the following error shown on MacPro7,1 Virtual Machines such as the one we create here. If you do not have [RestrictEvents](https://github.com/acidanthera/RestrictEvents) set up to fix PCI, you will still have this error present and must map your memory the legacy method via the OpenCore config.
