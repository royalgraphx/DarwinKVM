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
| EnableWriteUnprotector | False | This quirk and RebuildAppleMemoryMap can commonly conflict, recommended to enable the latter on newer platforms and disable this entry. |
| RebuildAppleMemoryMap | True | Rebuilds the memory map to a macOS-compatible one. |
| SetupVirtualMap | False | Fixes SetVirtualAddresses calls to virtual addresses, VMs don't require it. |
| SyncRuntimePermissions | True | Fixes MAT table alignment and required to boot Windows and Linux with MAT tables, also recommended for macOS. Mainly relevant for RebuildAppleMemoryMap users. |

## You can now continue to the next <a href="03-DeviceProperties.html">page</a>.