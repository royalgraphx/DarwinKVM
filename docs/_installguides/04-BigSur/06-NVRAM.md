---
layout: default
title: NVRAM
parent: Big Sur
nav_order: 7
---

# NVRAM

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreNVRAM.png"><img src="../../../assets/OpenCoreNVRAM.png" alt=""></a>

## Add


{: .highlight }
7C436110-AB2A-4BBB-A880-FE41995C9F82

We can use this dictionary to modify boot-args. Use the chart below for various arguments that possibly be useful later in the future. For the Recovery and Installation, before the GPU passthrough, you don't need to modify this section.

### General Boot-Args

| boot-arg | Description | 
| ----- | ----- |
| -v | This enables verbose mode, which shows all the behind-the-scenes text that scrolls by as you're booting instead of the Apple logo and progress bar. It's invaluable to any Hackintosher, as it gives you an inside look at the boot process, and can help you identify issues, problem kexts, etc. |
| keepsyms=1 | This is a companion setting to debug=0x100 that tells the OS to also print the symbols on a kernel panic. That can give some more helpful insight as to what's causing the panic itself. |
| debug=0x100	| This disables macOS's watchdog which helps prevents a reboot on a kernel panic. That way you can hopefully glean some useful info and follow the breadcrumbs to get past the issues. |

### GPU Related Boot-Args

| boot-arg | Description | 
| ----- | ----- |
| agdpmod=pikera | Used for disabling board ID checks on some Navi GPUs (RX 5000 & 6000 series). Don't use if you use NootRX. |

## Delete

Forcibly rewrites NVRAM variables, do note that Add will not overwrite values already present in NVRAM so values like boot-args should be left alone.

## LegacyOverwrite

For us, we can leave it to the default value of ``False``.

## LegacySchema

Used for assigning NVRAM variables, used with OpenVariableRuntimeDxe.efi. Only needed for systems without native NVRAM. The values under this can be deleted safely.

## You can now continue to the next <a href="../07-PlatformInfo">page</a>.
