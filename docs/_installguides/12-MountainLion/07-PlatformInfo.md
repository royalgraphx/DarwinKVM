---
layout: default
title: PlatformInfo
parent: Mountain Lion
nav_order: 8
---

# Platform Info

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreProMacPlatformInfo.png"><img src="../../../assets/OpenCoreProMacPlatformInfo.png" alt=""></a>

## Automatic

Leave as default.

## CustomMemory

Can be ignored for now. Documentation in progress.

## Generic

At this point in the guide, you'll need to open a terminal and an instance of [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Select option 1 for downloading MacSerial and Option 3 for generating SMBIOS. For this Westmere example, we'll choose the MacPro5,1 SMBIOS.

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

{: .headsup }
Make sure that you are using an invalid serial number! When visiting the [Check Device Coverage](https://checkcoverage.apple.com/) page on Apple's website, your serial number should not report an exising Mac, and you should get an error message such as "Please enter a valid serial number".

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

## You can now continue to the next <a href="../08-UEFI">page</a>.
