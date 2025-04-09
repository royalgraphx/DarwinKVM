---
layout: default
title: Kernel Parameters
description: "This central page allows you to quickly set up your Linux kernel parameters to appropriately use as a Hypervisor."
nav_order: 4
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

  .systemd-next-button-container {
    text-align: right;
  }

  .systemd-next-button {
    margin: 10px;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../../assets/Headers/HeaderKernelParameters.png">
</p>

<p align="center">This section allows various bootloader types to set up the necessary kernel parameters needed for proper virtualization and IOMMU usage, alongside any extra potential GPU related flags when it comes to passthrough and isolation. Please select the bootloader you use to continue.</p>

<p align="center">We appreciate PRs for this section, as the goal is very simple but can vary wildly across Linux distributions and their respective bootloaders. If you use something other than listed here, please open an Issue or Pull Request with a contribution for others to use.</p>

<h2 align="center">
  <br>
  <div class="systemd-next-button-container">
    <a class="systemd-next-button" href="../02-SysDBoot">systemd-boot &rarr;</a>
  </div>
  <div class="navigation-container">
    <a class="nav-button" href="../../02-BIOS-Settings">&larr; Back Page</a>
    <a class="nav-button" href="../01-GRUB/">GRUB Bootloader &rarr;</a>
  </div>
<br>
