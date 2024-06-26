---
layout: default
title: Booter
parent: x86_64 (OpenCore)
grand_parent: Tiger
nav_order: 3
---

# Booter

## MmioWhitelist

This section is allowing spaces to be passthrough to macOS that are generally ignored, useful when paired with DevirtualiseMmio. We can ignore this for our Virtual Machine use cases generally.

## Patch

This contains general patches, for us, we can ignore this.

## Quirks

Don't skip over this section, we'll be changing the following:

| Quirk  | Value | Description | 
| AllowRelocationBlock | True | Allows booting macOS through a relocation block. |
| EnableSafeModeSlide | False | Patch bootloader to have KASLR enabled in safe mode. |
| FixupAppleEfiImages | True | Modern secure PE loaders will refuse to load boot.efi images from Mac OS X 10.4 to macOS 10.12 due to these files containing W^X errors. |
| RebuildAppleMemoryMap | True | Generate macOS compatible Memory Map. |
| SetupVirtualMap | False | Setup virtual memory at SetVirtualAddresses. |
| SyncRuntimePermissions | True | Update memory permissions for the runtime environment. |

## You can now continue to the next <a href="../03-DeviceProperties">page</a>.
