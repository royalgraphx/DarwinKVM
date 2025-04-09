---
layout: default
title: MacPro7,1
description: "Placeholder"
parent: OpenCore Configurations
nav_order: 1
has_children: true
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-MP71.png">
</p>

{: .important }
> With the new release of macOS Sequoia comes a boatload of new features for those on Apple Silicon Macs. Due to the Hypervisor.framework on Apple Silicon now gaining the ability to sign in to iCloud so that Xcode developers working on iCloud enabled applications that sync user data can test and debug on a Virtual Machine, Apple has implemented a new check for VMM Status to ensure that iCloud on Virtual Machine can only be used for limited usage such [as described here](https://support.apple.com/en-us/120468). 
>
> Due to the nature of Apple's implementation for this check though, they do not do something sophisticated like ensuring the VM is actually a ``VMAPPLE/2`` kernel machine, or is even running on the ARM architecture at all. This means that for anyone using Sequoia under KVM or any other VM solution, will now face issues using iCloud/iServices compared to Sonoma (or older). To get around this, you **must** use the new [VMHide](https://github.com/Carnations-Botanica/VMHide) kernel extension to appear as a baremetal machine.

{: .note }
You are about to configure OpenCore to present QEMU to macOS as a Mac Pro (2019). Ensure that the target OS you intend to install, is meant to run on MacPro7,1 or else you will be unable to boot the OS. You can visit the [x64 Decision Page](../../../../hypervisor/08-Guest-Target-Decision/01-x86_64) to see supported Guests if needed.

<h3 align="center">This Mac Pro Model targets the latest macOS!</h3>

<p align="center">You will now be guided through all of the Configuration property lists' dictionaries. Play close attention and ensure you are properly setting all options as expected. Any issues when booting can be attributed to misconfiguration. This guide also assumes you are using the latest Q35 machine, and not older types such as 6.0 or older.</p>

<p align="center">As always, make sure you understand that you will need to passthrough a physical AMD graphics card to use this Mac Pro Model. High Sierra is not supported on the 2019 Mac Pro, so you are forced to run Catalina (10.15) or newer on this configuration.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index">&larr; Back Page</a>
    <a class="nav-button" href="../00-Introduction">Next Page &rarr;</a>
  </div>
  <br>
</h2>
