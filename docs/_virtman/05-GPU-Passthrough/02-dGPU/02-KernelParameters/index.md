---
layout: default
title: Setting Kernel Parameters
parent: Dual GPU Passthrough
grand_parent: GPU Passthrough
has_children: true
has_toc: false
nav_order: 2
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
  <img width="650" height="200" src="../../../../../assets/Headers/HeaderKernelParameters.png">
</p>

<h5 align="center">This section will allow various host bootloader types to set up the necessary flags needed for dual GPU passthrough usage. This is very similar to the first time you added kernel parameters. Please select the bootloader you use to continue.</h5>

<p align="center">We appreciate PRs for this section, as the goal is very simple but can vary wildly across Linux distributions and their respective bootloaders. If you use something other than listed here, please open an Issue or Pull Request with a contribution for others to use.</p>

<h2 align="center">
  <br>
  <div class="systemd-next-button-container">
    <a class="systemd-next-button" href="../01-GRUB">GRUB bootloader &rarr;</a>
  </div>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-FindingDevIDs">&larr; Back Page</a>
    <a class="nav-button" href="../02-SysDBoot/">systemd-boot &rarr;</a>
  </div>
<br>
