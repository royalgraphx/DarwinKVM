---
layout: default
title: DiskProvision
description: "This is the overview section of DiskProvision usage and OpenCore .img creation."
nav_order: 2
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
  <img width="650" height="200" src="../../../assets/Headers/Header-DiskProvision.png">
</p>

<h2 align="center">Why DiskProvision?</h2>

<p align="center">Created for DarwinKVM, DiskProvision is a Python script. It's main use in the DarwinKVM process is to simplify the <span style="color: #bfa6ff;">creation of disk images</span> that work with QEMU and display properly in guests. <span style="color: #bfa6ff;">By having the ability to format them as FAT32, mimicking USB Drives</span> allowing us to create an OpenCore disk image for our Virtual Machine to use as an EFI partition. This image will equally appear as a disk on the guest side. This allows for quick changes to be made, and a reboot to apply changes becomes as simple as using ProperTree and hitting reboot.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../01-Image-Creation">Next Page &rarr;</a>
  </div>
  <br>
</h2>
