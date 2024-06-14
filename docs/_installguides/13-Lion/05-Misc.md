---
layout: default
title: Misc
parent: Lion
nav_order: 6
---

# Misc

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreProMacMisc.png"><img src="../../../assets/OpenCoreProMacMisc.png" alt=""></a>

## BlessOverride

To be filled with plist string entries containing absolute UEFI paths to customised bootloaders such as \EFI\debian\grubx64.efi for the Debian bootloader. As our VM is strictly macOS only, we do nothing here, nor will we ever.

## Boot

Don't skip over this section, we'll be changing the following:

| Key  | Type | Value | 
| ----- | ----- | ----- |
| HibernateMode | String | RTC |

## Debug

Helpful for debugging OpenCore boot issues.
Don't skip over this section, we'll be changing the following:

| Key  | Type | Value | 
| ----- | ----- | ----- |
| AppleDebug | Boolean | True |
| ApplePanic | Boolean | True |
| DisableWatchDog | Boolean | True |
| Target | Number | 67 |

## Entries

Used for specifying irregular boot paths that can't be found naturally with OpenCore. We do nothing here, nor will we ever.

## Security

Security is pretty self-explanatory, <b>do not skip</b>. We'll be changing the following:

{: .warning }
Optional is a word, you must type it out. It IS case-sensitive.

| Key  | Type | Value | 
| ----- | ----- | ----- |
| AllowSetDefault | Boolean | True |
| ExposeSensitiveData | Number | 15 |
| ScanPolicy | Number | 0 |
| SecureBootModel | String | Disabled |
| Vault | String | <span style="color:red">Optional</span> |

## Serial

Used for serial debugging (Leave everything as default).

## Tools

This section of the config is meant to expose the various Tools in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## You can now continue to the next <a href="../06-NVRAM">page</a>.
