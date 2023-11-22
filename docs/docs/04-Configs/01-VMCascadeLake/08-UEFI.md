---
layout: default
title: Part 8 - UEFI
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 9
---

# UEFI

<p align="center">
  <img src="../../../assets/OpenCoreUEFI.png">
</p>

## APFS

By default, OpenCore only loads APFS drivers from macOS Big Sur and newer. If you are booting macOS Catalina or earlier, you may need to set a new minimum version/date. Not setting this can result in OpenCore not finding your macOS partition! For us, running Monterey, Ventura, or even Sonoma, we can skip this section.

## Audio

Related to AudioDxe settings, for us we'll be ignoring (leave as default). This is unrelated to audio support in macOS. This is mainly for adding back the Chime sound when macOS starts on bare metal situations.

## ConnectDrivers

Forces .efi drivers, change to NO will automatically connect added UEFI drivers. This can make booting slightly faster, but not all drivers connect themselves. E.g. certain file system drivers may not load. Leave it as default for our use case.

## Drivers

This section of the config is meant to expose the various Drivers in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## Input

Related to boot.efi keyboard passthrough used for FileVault and Hotkey support, leave everything here as default as we have no use for these quirks.

## Output

Relating to OpenCore's visual output, leave everything here as default as we have no use for these quirks.

## ProtocolOverrides

Mainly relevant for Virtual Machines, legacy Macs and FileVault users. leave everything here as default as we have no use for these quirks.

## Quirks

Relating to quirks with the UEFI environment, leave everything here as default as we have no use for these quirks.

## ReservedMemory

Used for exempting certain memory regions from OSes to use, mainly relevant for Sandy Bridge iGPUs or systems with faulty memory. Use of this quirk is not covered in this guide. We also won't be needing it anyways, safely ignore.

## You can now continue to the next <a href="09-Complete.html">page</a>.
