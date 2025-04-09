---
layout: default
title: Kernel
description: "Placeholder"
parent: MacPro5,1
grand_parent: OpenCore Configurations
nav_order: 5
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-Kernel.png">
</p>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreKernel.png" alt=""></a>

## Add

This section of the config is meant to expose the various Kexts in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## Block

Blocks certain Kexts from loading. Not relevant for us.

## Emulate

Needed for spoofing unsupported CPUs like Pentiums and Celerons. We won't need those options. Set DummyPowerManagement to True.

| Key  | Type | Value |
| Cpuid1Data | Data | <> |
| Cpuid1Mask | Data | <> |
| DummyPowerManagement | Boolean | True |

## Force

Used for loading Kexts off system volume, only relevant for older operating systems where certain kexts are not present in the cache, i.e IONetworkingFamily in 10.6.

For us, we can ignore.

## Patch

Patches both the kernel and Kexts. We can ignore this section.

## Quirks

Don't skip over this section, we'll be changing the following:

| Quirk  | Value | Description | 
| ----- | ----- | ----- |
| DisableLinkeditJettison | False | This option lets Lilu.kext, and possibly other kexts, function in macOS Big Sur at their best performance levels without requiring the keepsyms=1 boot argument. |
| PanicNoKextDump | True | Disables dumping of the loaded kexts when a kernel panic occurs, greatly helps with reading the panic output and debugging. |
| PowerTimeoutKernelPanic | True | Helps fix kernel panics relating to power timeouts with Apple drivers in OS X Catalina and above, most notably with digital audio. |
| ProvideCurrentCpuInfo | True | Provides current CPU info to the kernel. On KVM and other hypervisors it provides precomputed MSR 35h values to avoid some kernel panics. |

## Scheme

Settings related to legacy booting, but we can change the following.

| Key  | Type | Value | Description | 
| ----- | ----- | ----- | | ----- |
| CustomKernel | Boolean | False | Loads a custom kernel, usually used for unsupported CPUs. Here we spoof the CPU with QEMU so we do not require this. |
| FuzzyMatch | Boolean | True | Improves Mac OS X 10.6 (Snow Leopard) booting times by utilizing a different algorithm |
| KernelArch | String | x86_64 | Slightly improves boot performance by hardcoding that we're booting the kernel in AMD64 mode instead of x86. |
| KernelCache | String | Auto | Specifies the kernel cache type used, on modern macOS versions, this can be hardcoded to Prelinked to speed up boot times. |

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../03-DeviceProperties">&larr; Back Page</a>
    <a class="nav-button" href="../05-Misc">Next Page &rarr;</a>
  </div>
  <br>
</h2>
