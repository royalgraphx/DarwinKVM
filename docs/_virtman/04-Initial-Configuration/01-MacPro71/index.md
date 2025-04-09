---
layout: default
title: MacPro7,1
description: "Placeholder"
parent: Initial Configuration
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-MP71.png">
</p>

<p align="center">To explain how we're going to continue from here, you'll want to understand what it is you're doing.</p>

<p align="center">You now have a bare bones machine, and you must begin adding various hardware that is missing. On MacPro7,1 we will use the SPICE display, and use the VirtIO emulated VGA graphics device. We'll also need Networking, as we've discussed earlier, for those who will use recoveryOS and for any other actual usage of the OS. To do this, we'll be using the VirtIO Paravirtualized Ethernet Controller. This is a natively supported device since macOS Big Sur (11+). If you are targeting an older version like Catalina, information on the appropriate devices are listed later. Once we've moved on to adding our Storage devices, we'll point them to the two disk images we have created earlier. As for Big Sur (11+) we'll be using the VirtIO Paravirtualized Block Media devices. For older targets, you may be using SATA. With all of our components properly defined, we are then ready to install the target OS!</p>

<p align="center">With that simple overview, let's go ahead and focus on each section.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../03-XML-Importer">&larr; Back Page</a>
    <a class="nav-button" href="../01-ConfigDisplay">Next Page &rarr;</a>
  </div>
  <br>
</h2>
