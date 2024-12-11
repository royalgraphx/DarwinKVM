---
layout: default
title: Sequoia
nav_order: 1
has_children: true
has_toc: true
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderSequoia.png">
</p>

{: .warning }
> With the new release of macOS Sequoia comes a boatload of new features for those on Apple Silicon Macs. Due to the Hypervisor.framework on Apple Silicon now gaining the ability to sign in to iCloud so that Xcode developers working on iCloud enabled applications that sync user data can test and debug on a Virtual Machine, Apple has implemented a new check for VMM Status to ensure that iCloud on Virtual Machine can only be used for limited usage such [as described here](https://support.apple.com/en-us/120468). 
>
> Due to the nature of Apple's implementation for this check though, they do not do something sophisticated like ensuring the VM is actually a ``VMAPPLE/2`` kernel machine, or is even running on the ARM architecture at all. This means that for anyone using Sequoia under KVM or any other VM solution, will now face issues using iCloud/iServices compared to Sonoma (or older). To get around this, you **must** use the new [VMHide](https://github.com/Carnations-Botanica/VMHide) kernel extension to appear as a baremetal machine.

<h3 align="center">This guide targets the latest macOS!</h3>
