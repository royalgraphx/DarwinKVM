---
layout: default
title: Introduction
description: "Placeholder"
parent: MacPro5,1
grand_parent: OpenCore Configurations
nav_order: 1
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

<h2 align="center">MacPro5,1 Configuration Guide</h2>
<h3 align="center">You will require the following tools to continue.</h3>

| Tool  | Status | Description | 
| ----- | ----- | ----- |
| [Python](https://www.python.org/downloads/) | Required | Needed as a dependency. |
| [ProperTree](https://github.com/corpnewt/ProperTree) | Required | Software that required Python, provides GUI and Tools for config.plist |
| [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) | Required | Must generate clean SMBIOS information for iServices |

<h3 align="center">Be sure you meet the following requirements to begin configuring your OC.</h3>
<br>

**1. Valid Python Install**
- Required as a dependency for ProperTree.

**2. ProperTree:**
- This will allow you to use tools like "OC Clean Snapshot" which will scan your OC folder and add the various files to your config.plist automatically and in the correct order.

**3. GenSMBIOS**
- Required to generate a serial number, you cannot log into iServices until you properly generate SMBIOS information and use that on your config.plist

**4. [Sample.plist](https://github.com/royalgraphx/DarwinOCPkg/blob/main/Docs/Sample.plist)**
- Base that you change to config.plist, and begin to modify.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../01-ACPI">Next Page &rarr;</a>
  </div>
  <br>
</h2>
