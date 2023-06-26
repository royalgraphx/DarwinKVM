---
layout: default
title: Part 3 - Device Properties
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 4
---

# Device Properties

<p align="center">
  <img src="../../../assets/OpenCoreDeviceProperties.png">
</p>

## Add

This allows you to add properties to various devices using its PciRoot address. For now, and in most cases we can ignore this. An example would be: overriding an ethernet controller to appear as built-in so that macOS allows iServices to work. On Virtual Machines, we rarely have to override.

## Delete

This allows you to delete properties of various devices using its PciRoot address. For now, and in most cases we can ignore this.

## You can now continue to the next <a href="04-Kernel.html">page</a>.