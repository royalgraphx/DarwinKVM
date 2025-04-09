---
layout: default
title: Booter
description: "Placeholder"
parent: MacPro7,1
grand_parent: OpenCore Configurations
nav_order: 3
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-Booter.png">
</p>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreBooterQuirks.png" alt=""></a>

## MmioWhitelist

This section is allowing spaces to be passthrough to macOS that are generally ignored, useful when paired with DevirtualiseMmio. We can ignore this for our Virtual Machine use cases generally.

## Patch

This contains general patches, for us, we can ignore this.

## Quirks

Don't skip over this section, we'll be changing the following:

| Quirk  | Value | Description | 
| ----- | ----- | ----- |
| EnableWriteUnprotector | False | Allows modifying some instructions in the firmware runtime, since we support Memory Attribute Tables (MATs) with the emulated Q35 chipset, hence we do not require it. |
| RebuildAppleMemoryMap | True | Rebuilds the UEFI memory map to be macOS-compatible. |
| SetupVirtualMap | False | Links some virtual addresses to the physical RAM to workaround firmware bugs, we do not require it. |
| SyncRuntimePermissions | True | Syncronizes the permissions of the UEFI runtime memory map after it has been rebuilt. |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-ACPI">&larr; Back Page</a>
    <a class="nav-button" href="../03-DeviceProperties">Next Page &rarr;</a>
  </div>
  <br>
</h2>
