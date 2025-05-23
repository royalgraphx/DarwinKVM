---
layout: default
title: Using OpenCorePkg
parent: Disk Image Contents
description: "This section goes over how Carnations maintains a fork of OpenCorePkg, and how you can use the latest provided by Acidanthera under a KVM solution."
has_children: true
has_toc: false
nav_order: 1
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-OpenCorePkg.png">
</p>

<h2 align="center">Why OpenCorePkg?</h2>

<p align="center">Learning how we provide DarwinOCPkg, will allow you to use the latest OpenCore provided by Acidanthera's Github page, and configure it properly for a QEMU Q35 machine with all of its SSDTs/ACPIs needed per MacPro model. Some people may not be using traditional desktop Linux, so we'll be able to assist those on Proxmox/Unraid to create a disk image with its required contents.</p>

<p align="center"><b>No support is provided for anyone using the following instructions on a non QEMU kernel based virtual machine on a Linux-derived kernel host</b>.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index">&larr; Back Page</a>
    <a class="nav-button" href="../01-SourceOCPKG">Next Page &rarr;</a>
  </div>
  <br>
</h2>
