---
layout: default
title: Part 0 - Introduction
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 1
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderCascadeLake.png">
</p>

# Introduction / Overview
#### Download the following tools needed for modifications.

| Tool  | Status | Description | 
| ----- | ----- | ----- |
| [Python](https://www.python.org/downloads/) | Required | Needed as a dependency. |
| [ProperTree](https://github.com/corpnewt/ProperTree) | Required | Software that required Python, provides GUI and Tools for config.plist |
| [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) | Required | Must generate clean SMBIOS information for iServices |
| [DarwinOCPkg](https://github.com/royalgraphx/DarwinOCPkg/blob/main/Docs/Sample.plist) | Required | Need Docs/Sample.plist renamed to config.plist in OC folder. |

We'll first need a valid Python installation on our host. You'll then need to get your hands on ProperTree. This will allow you to use tools like "OC Clean Snapshot" which will scan your OC folder and add the various files to your config.plist automatically and in the correct order. This is especially true when dealing with kext loading order. Essentially, you cannot load a dependency before the main Kext that needs it, is loaded... so to make sure we don't run into any issues we use the officially recommended method of OC Clean Snapshot and regular OC Snapshot when updating things in our folders. 

GenSMBIOS will be very important because the Sample.plist does not contain any serial number. Meaning you cannot log into iServices until you properly generate MacPro7,1 SMBIOS information and use that on your config.plist

Of course, the repository includes a custom Sample.plist that has been cleaned up and peer-reviewed for the proper configuration needed for QEMU/KVM. There is still a Config guide you must follow for the Virtual Machine platform, but it will do the same thing as the main Dortania guide Configs: teach you what makes your hack work.

## You can now continue to the next <a href="01-ACPI.html">page</a>.