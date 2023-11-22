---
layout: default
title: Part 2 - Booter
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 3
---

# Booter

<p align="center">
  <img src="../../../assets/OpenCoreBooterQuirks.png">
</p>

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

## You can now continue to the next <a href="03-DeviceProperties.html">page</a>.