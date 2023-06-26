---
layout: default
title: Part 4 - Kernel
parent: Virtual Machine Cascade Lake
grand_parent: Configs
nav_order: 5
---

# Kernel

<p align="center">
  <img src="../../../assets/OpenCoreKernel.png">
</p>

## Add

This section of the config is meant to expose the various Kexts in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## Block

Blocks certain Kexts from loading. Not relevant for us.

## Emulate

Needed for spoofing unsupported CPUs like Pentiums and Celerons. We are already spoofing the CPU to CascadeLake in the XML, so we won't need this.

- Cpuid1Mask: Leave this blank
- Cpuid1Data: Leave this blank

## Force

Used for loading Kexts off system volume, only relevant for older operating systems where certain kexts are not present in the cache, i.e IONetworkingFamily in 10.6.

For us, we can ignore.

## Patch

Patches both the kernel and Kexts. I've gone ahead and incorporated CaseySJ's PCI Bus Enumeration fix on KVM. For us, we can ignore this section.

## Quirks

Don't skip over this section, we'll be changing the following:

| Quirk  | Value | Description | 
| ----- | ----- | ----- |
| ForceSecureBootScheme | True | Forces the x86 scheme for IMG4 verification in Apple Secure Boot initialization. |
| PanicNoKextDump | True | Allows for reading kernel panics logs when kernel panics occur. |
| PowerTimeoutKernelPanic | True | Helps fix kernel panics relating to power changes with Apple drivers in macOS Catalina, most notably with digital audio. |
| ProvideCurrentCpuInfo | True | Provides current CPU info to the kernel. This quirk works differently depending on the CPU: For KVM and other hypervisors it provides precomputed MSR 35h values solving kernel panic with ``-cpu host``. |

## Scheme

Settings related to legacy booting, but we can change the following.

| Key  | Type | Value | 
| ----- | ----- | ----- |
| CustomKernel | Boolean | False |
| FuzzyMatch | Boolean | False |
| KernelArch | String | x86_64 |
| KernelCache | String | Prelinked |

## You can now continue to the next <a href="05-Misc.html">page</a>.