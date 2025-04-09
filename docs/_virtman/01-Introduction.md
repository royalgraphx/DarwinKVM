---
layout: default
title: Understanding Tasks
description: "Placeholder"
nav_order: 1
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
  <img width="650" height="200" src="../../assets/Headers/HeaderCurrentTasks.png">
</p>

<h5 align="center">We'll cover how to import and manage DarwinKVM XMLs</h5>

| **Step** | **Quick Description** |
| --- | --- |
| **VMM First Launch** | It's time to open Virt-Manager for the first time and ensure the connection to QEMU/KVM was successful. This page also goes over how we're going to define a MacPro#,# machine in Virt-Manager. |
| **XML Importer** | This section goes over the two methods for creating and importing an XML from DarwinKVM. You will either use DKVMs Dynamic XML configuration or write your own based on the provided examples. DarwinKVMs Main Menu comes with an Importer Utility but you'll first need said choice of XML. |
| **Initial Configuration** | Now that you have a DarwinKVM machine imported in your Virt-Manager, we'll need to add various hardware that it does not come with OOB. This includes a display, an emulated VirtIO graphics processing unit for VGA out, Networking, and adding the previously created drives onto this machine. This is an important exercise to prepare you for later, modifying your VMM and adding PCIe hardware. |
| **GPU Passthrough** | This is the time where you now have to properly configure your Host to do GPU passthrough depending on the amount of graphics cards on your host. By the end of this, you'll be running OS X or macOS fully accelerated properly! |
| **Congratulations!** | This page serves as a celebration and info dump on maintaining your DarwinKVM in tip-top shape. This page redirects you to popular write-ups and important Post-Installation care. |

<p align="center">Each section will guide you through the necessary steps to ensure a smooth configuration experience while also intending to teach you as much information as possible. This section is crucial to understand, even more so than the OpenCore sections, as this is how your machine is defined and created. Properly configuring PCIe devices and CPU data is crucial to improving guest performance.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../opencore/07-FetchingInstaller/index/">&larr; Back Page</a>
    <a class="nav-button" href="../02-VMM-First-Launch">Next Page &rarr;</a>
  </div>
  <br>
</h2>
