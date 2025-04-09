---
layout: default
title: Post-Check Recap
nav_order: 4
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
  <img width="650" height="200" src="../../../../assets/Headers/HeaderPostSupportCheck.png">
</p>

<p align="center">Now that we've gone ahead and ensured the Host CPU has virtualization extensions and the appropriate minimum SSE* and AVX1/2 for the desired OS release, alongside ensuring our dedicated Graphics Processing Unit is supported by OS X / macOS, the rest is now ensuring that our machine running Linux has access to features and packages so we can configure our Linux host from Desktop OS to a Hypervisor with Virt-Manager and libvirtd.</p>

<p align="center">Please make sure your Linux distribution is on the following list:</p>

   - For best results, an Arch based distribution is recommended for latest packages.
     - [Arch Linux](https://archlinux.org/download/)
     - [Debian](https://www.debian.org/)
     - [Ubuntu](https://ubuntu.com/)
     - [Linux Mint](https://linuxmint.com/)
     - [Fedora Linux](https://fedoraproject.org/workstation/)
     - [Nobara Project](https://nobaraproject.org/)

<p align="center">If your distribution is not in the known supported list, you can still follow through with the Docs, especially when it comes to configuring OpenCore for the QEMU Q35 machine type. Simply account for the manual configuration of packages as their instructions will be missing, and you will still achieve the same result. Submit a PR to add support for your favorite distribution!</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../03-CompatibilityCharts/02-GPU/index">&larr; Back Page</a>
    <a class="nav-button" href="../../hypervisor/00-Introduction">Next Page &rarr;</a>
  </div>
  <br>
</h2>
