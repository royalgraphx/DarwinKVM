---
layout: default
title: Package Installation
description: "Placeholder"
nav_order: 5
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

  .debian-next-button-container,
  .fedora-next-button-container,
  .nobara-next-button-container {
    text-align: right;
  }

  .debian-next-button,
  .fedora-next-button,
  .nobara-next-button {
    margin: 10px;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../../assets/Headers/HeaderPackageInstallation.png">
</p>

{: .warning }
Be aware that various packages can cause issues when it comes to Single or Multi-GPU host configurations, avoid packages like: <code>OpenRGB</code>, <code>Docker</code>, and <code>openrazer-daemon</code>. Any package that creates a runtime or daemon service that persists forcefully and cannot be terminated by other PIDs, will cause issues when it comes to PCIe passthrough, not allowing VFIO to properly init.

<h2 align="center">Time to install the required Packages!</h2>

<br>
<p align="center">This section has been broken up into distribution specific pages for easier understanding and digestion. Please begin by selecting your distribution below, and if yours is not visible please consider either selecting the closest matching distribution type, or assist others with a Pull Request for adding support to your favorite distribution of Linux!</p>

<h2 align="center">
  <br>
  <div class="nobara-next-button-container">
    <a class="nobara-next-button" href="../01-Arch">Arch Linux &rarr;</a>
  </div>
  <div class="fedora-next-button-container">
    <a class="fedora-next-button" href="../02-Debian">Debian / Ubuntu / Mint &rarr;</a>
  </div>
  <div class="debian-next-button-container">
    <a class="debian-next-button" href="../03-Fedora">Fedora Workstation &rarr;</a>
  </div>
  <div class="navigation-container">
    <a class="nav-button" href="../../02-BIOS-Settings">&larr; Back Page</a>
    <a class="nav-button" href="../04-Nobara">Nobara Project &rarr;</a>
  </div>
<br>

