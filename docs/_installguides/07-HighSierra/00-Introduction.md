---
layout: default
title: Introduction
parent: High Sierra
nav_order: 1
---

<h2 align="center">High Sierra Configuration Guide</h2>
<h3 align="center">Download the following tools required for modifications.</h3>

| Tool  | Status | Description | 
| ----- | ----- | ----- |
| [Python](https://www.python.org/downloads/) | Required | Needed as a dependency. |
| [ProperTree](https://github.com/corpnewt/ProperTree) | Required | Software that required Python, provides GUI and Tools for config.plist |
| [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) | Required | Must generate clean SMBIOS information for iServices |
| [DarwinOCPkg](https://github.com/royalgraphx/DarwinOCPkg/blob/main/Docs/Sample.plist) | Required | Need Docs/Sample.plist renamed to config.plist in OC folder. |

<h3 align="center">Be sure you meet the following requirements to begin configuring your OC.</h3>

**1. Valid Python Install**
- Required as a dependency for ProperTree.

**2. ProperTree:**
- This will allow you to use tools like "OC Clean Snapshot" which will scan your OC folder and add the various files to your config.plist automatically and in the correct order.

**3. GenSMBIOS**
- Required to generate a serial number, you cannot log into iServices until you properly generate SMBIOS information and use that on your config.plist

**4. [Sample.plist](https://github.com/royalgraphx/DarwinOCPkg/blob/main/Docs/Sample.plist)**
- Base that you change to config.plist, and begin to modify.

## You can now continue to the next <a href="../01-ACPI">page</a>.
