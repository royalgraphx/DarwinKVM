---
layout: default
title: DeviceProperties
description: "Placeholder"
parent: MacPro5,1
grand_parent: OpenCore Configurations
nav_order: 4
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-DeviceProperties.png">
</p>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreDeviceProperties.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreProMacDevProps.png"><img src="../../../assets/OpenCoreProMacDevProps.png" alt=""></a>

## Add

This allows you to add properties to various devices using its PciRoot address. For now, and in most cases we can ignore this. 

An example would be: overriding an ethernet controller to appear as built-in so that macOS allows iServices to work. This is mainly for baremetal though, and is irrelevent here.

On Virtual Machines, we only need to override/add properties to passed-through devices, like GPUs or audio controllers. For our initial setup, we will leave this section empty. There are dedicated pages to explaining how to do various overrides, this section doesn't have to include that info right now.

## Delete

This allows you to delete properties of various devices using its PciRoot address. For now, and in most cases we can ignore this.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-Booter">&larr; Back Page</a>
    <a class="nav-button" href="../04-Kernel">Next Page &rarr;</a>
  </div>
  <br>
</h2>
