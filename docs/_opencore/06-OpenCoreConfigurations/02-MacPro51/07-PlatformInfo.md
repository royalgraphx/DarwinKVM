---
layout: default
title: PlatformInfo
description: "Placeholder"
parent: MacPro5,1
grand_parent: OpenCore Configurations
nav_order: 8
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-PlatformInfo.png">
</p>

<a href=""><img src="../../../../assets/OpenCore/OpenCorePlatformInfo.png" alt=""></a>

## Automatic

Leave as default.

## CustomMemory

Can be ignored for now. Documentation in progress.

## Generic

{: .headsup }
Make sure that you are using an invalid serial number! When visiting the [Check Device Coverage](https://checkcoverage.apple.com/) page on Apple's website, your serial number should not report an exising Mac, and you should get an error message such as "Please enter a valid serial number".

{: .new }
Hexley, in the DarwinKVM Discord can generate an SMBIOS on the fly via a slash command!

At this point in the guide, you'll need to open a terminal and an instance of [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). You can do this from the Main Menu of DarwinKVMs script. Select option 1 for downloading MacSerial and Option 3 for generating SMBIOS. For this Westmere-v2 example, we'll choose the MacPro5,1 SMBIOS. If you intend to use older, that's fine too. Ensure the CPUID mask and the SMBIOS data align, i.e MacPro4,1 and Conroe in the XML.

This will give us output similar to the following:

```bash
  #######################################################
 #               MacPro5,1 SMBIOS Info                 #
#######################################################

Type:         MacPro5,1
Serial:       C000000000H
Board Serial: C00000000000V
SmUUID:       10000003-4009-4006-8005-C00000000001
Apple ROM:    600000000007

Press [enter] to return...
```

To fill out the information on your config.plist, refer to the following chart to convert across.

| GenSMBIOS | config.plist | 
| ----- | ----- |
| Board Serial | MLB |
| Apple ROM | ROM |
| Type | SystemProductName |
| Serial | SystemSerialNumber |
| SmUUID | SystemUUID |

## UpdateDataHub

Update Data Hub fields. We can leave this default.

## UpdateSMBIOS

Updates SMBIOS fields. We can leave this default.

## UpdateSMBIOSMode

Replace the tables with newly allocated EfiReservedMemoryType. We can leave this default.

## UseRawUuidEncoding

Use raw encoding for SMBIOS UUIDs. We can leave this default.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../06-NVRAM">&larr; Back Page</a>
    <a class="nav-button" href="../08-UEFI">Next Page &rarr;</a>
  </div>
  <br>
</h2>
