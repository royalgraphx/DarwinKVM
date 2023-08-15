---
layout: default
title: Part 7 - PlatformInfo
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 8
---

# Platform Info

<p align="center">
  <img src="../../../assets/OpenCorePlatformInfo.png">
</p>

{: .new }
Did you know? Hexley, DarwinKVM's Discord bot, can generate Platform Information! Join the server to make this and many other tools easily accessible, everywhere Discord is!

## Automatic

Leave as default.

## CustomMemory

Can be ignored for now. Documentation in progress.

## Generic

At this point in the guide, you'll need to open a terminal and an instance of [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Select option 1 for downloading MacSerial and Option 3 for generating SMBIOS. For this Cascade Lake example, we'll choose the MacPro7,1 SMBIOS.

This will give us output similar to the following:

```
  #######################################################
 #               MacPro7,1 SMBIOS Info                 #
#######################################################

Type:         MacPro7,1
Serial:       F0000000000M
Board Serial: F0000000000000000F
SmUUID:       90000006-3009-4004-B001-800000000008
Apple ROM:    000000000005

Press [enter] to return...
```

{: .warning }
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

## You can now continue to the next <a href="08-UEFI.html">page</a>.
