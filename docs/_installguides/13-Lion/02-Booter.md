---
layout: default
title: Booter
parent: Lion
nav_order: 3
---

# Booter

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreProMacBooter.png"><img src="../../../assets/OpenCoreProMacBooter.png" alt=""></a>

## MmioWhitelist

This section is allowing spaces to be passthrough to macOS that are generally ignored, useful when paired with DevirtualiseMmio. We can ignore this for our Virtual Machine use cases generally.

## Patch

This contains general patches, for us, we can ignore this.

## Quirks

Don't skip over this section, we'll be changing the following:

| Quirk  | Value | Description | 
| ----- | ----- | ----- |
| AllowRelocationBlock | True | The relocation block is a scratch buffer allocated in the lower 4 GB used for loading the kernel and related structures by EfiBoot on firmware where the lower memory region is otherwise occupied by (assumed) non-runtime data |
| EnableSafeModeSlide | False | This quirk attempts to patch the boot.efi file to remove this limitation and to allow using other values (from 1 to 255 inclusive). |
| EnableWriteUnprotector | False | This option bypasses W^X permissions in code pages of UEFI runtime services by removing write protection (WP) bit from CR0 register during their execution. |
| FixupAppleEfiImages | True | Modern secure PE loaders will refuse to load boot.efi images from Mac OS X 10.4 to macOS 10.12 due to these files containing W^X errors (in all versions) and illegal overlapping sections (in 10.4 and 10.5 32-bit versions only). This quirk detects these issues and pre-processes such images in memory, so that a modern loader will accept them. |
| ProvideCustomSlide | False | Provide custom KASLR slide on low memory. |
| RebuildAppleMemoryMap | True | Generate macOS compatible Memory Map. |
| SetupVirtualMap | False | Some types of firmware access memory by virtual addresses after a SetVirtualAddresses call, resulting in early boot crashes. This quirk workarounds the problem by performing early boot identity mapping of assigned virtual addresses to physical memory. |
| SyncRuntimePermissions | True | Update memory permissions for the runtime environment. |

## You can now continue to the next <a href="../03-DeviceProperties">page</a>.
