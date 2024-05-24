---
layout: default
title: Device Properties
parent: Catalina
nav_order: 4
---

# Device Properties

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreDeviceProperties.png"><img src="../../../assets/OpenCoreDeviceProperties.png" alt=""></a>

## Add

This allows you to add properties to various devices using its PciRoot address. For now, and in most cases we can ignore this. An example would be: overriding an ethernet controller to appear as built-in so that macOS allows iServices to work. On Virtual Machines, we only need to override/add properties to passed-through devices, like GPUs or audio controllers. For our initial setup, we will leave this section empty.

## Delete

This allows you to delete properties of various devices using its PciRoot address. For now, and in most cases we can ignore this.

## You can now continue to the next <a href="../04-Kernel">page</a>.
