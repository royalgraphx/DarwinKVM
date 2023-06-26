---
layout: default
title: Part 6 - NVRAM
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 7
---

# NVRAM

<p align="center">
  <img src="../../../assets/OpenCoreNVRAM.png">
</p>

## Add


{: .highlight }
7C436110-AB2A-4BBB-A880-FE41995C9F82

We can use this dictionary to modify boot-args. Use the chart below for various arguments that possibly be useful later in the future. For the Recovery and Installation, before the GPU passthrough, you don't need to modify this section.

### General Boot-Args

| boot-arg | Description | 
| ----- | ----- |
| -v | This enables verbose mode, which shows all the behind-the-scenes text that scrolls by as you're booting instead of the Apple logo and progress bar. It's invaluable to any Hackintosher, as it gives you an inside look at the boot process, and can help you identify issues, problem kexts, etc. |
| debug=0x100	 | This disables macOS's watchdog which helps prevents a reboot on a kernel panic. That way you can hopefully glean some useful info and follow the breadcrumbs to get past the issues. |
| keepsyms=1 | This is a companion setting to debug=0x100 that tells the OS to also print the symbols on a kernel panic. That can give some more helpful insight as to what's causing the panic itself. |

### GPU Related Boot-Args

| boot-arg | Description | 
| ----- | ----- |
| agdpmod=pikera | Used for disabling board ID checks on some Navi GPUs (RX 5000 & 6000 series), without this you'll get a black screen. Don't use if you don't have Navi (ie. Polaris and Vega cards shouldn't use this) |
| -radcodec	| Used for allowing officially unsupported AMD GPUs (spoofed) to use the Hardware Video Encoder |
| radpg=15 | Used for disabling some power-gating modes, helpful for properly initializing AMD Cape Verde based GPUs |
| unfairgva=1 | Used for fixing hardware DRM support on supported AMD GPUs |

## Delete

Forcibly rewrites NVRAM variables, do note that Add will not overwrite values already present in NVRAM so values like boot-args should be left alone.

## LegacyOverwrite

For us, we can leave it to the default value of ``False``.

## LegacySchema

Used for assigning NVRAM variables, used with OpenVariableRuntimeDxe.efi. Only needed for systems without native NVRAM. The values under this can be deleted safely.

## WriteFlash

Enables writing to flash memory for all added variables.

| Key  | Type | Value | 
| ----- | ----- | ----- |
| WriteFlash | Boolean | True |

## You can now continue to the next <a href="07-PlatformInfo.html">page</a>.