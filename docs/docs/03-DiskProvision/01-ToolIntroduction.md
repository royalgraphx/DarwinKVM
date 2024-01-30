---
layout: default
title: Introduction
parent: DiskProvision
nav_order: 1
---

# Why DiskProvision?
#### Created for DarwinKVM, works universally.
#### This section has been derived from the <a href="https://github.com/royalgraphx/DiskProvision">DiskProvision</a> Github.

{: .new }
Legacy Bash Scripts have been re-added! Please use those in the meantime.

DiskProvision is a set of bash scripts that are in the process of being made into an actual standalone program. It's main use is in DarwinKVM, <span style="color: #ffab52;">to quickly create disk images</span> that work between Windows, Linux, and macOS systems <span style="color: #ffab52;">by preformatting them as FAT32, mimicking USB Drives.</span> In this context, it allows us to create an OpenCore bootable image for our Virtual Machine to use as an EFI.

There are plenty of ways to do this manually! If you for whatever reason run into issues with DiskProvision, or its Legacy Bash Scripts, please refer to the [source code](https://github.com/royalgraphx/DiskProvision) on Github!

## You can now continue to the next <a href="02-ImageCreation">page</a>.