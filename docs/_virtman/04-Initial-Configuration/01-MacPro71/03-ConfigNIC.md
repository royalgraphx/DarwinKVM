---
layout: default
title: Configure NIC
parent: MacPro7,1
grand_parent: Initial Configuration
nav_order: 3
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

<br>
<h2 align="center"><b>Configure NIC</b></h2>
<br>

{: .warning }
This is required to download OS X / macOS via recoveryOS! This is also how you provide Internet Access to the guest machine by sharing it from the host using an appropriately emulated NIC controller that is supported by the OS release you wish to use.

<h2 align="center">Using the Default Network</h2>
<br>

<p align="center">Select the <code>Add Hardware</code> button and choose the <code>Network</code> category on the left-hand side.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManDefaultNetworkNIC.png" alt=""></a></p>

<h3 align="center"><b>Choose the correct Network Model for your Guest OS</b></h3>

<br>
<p align="center">
  <strong>For macOS Big Sur (11+) and newer:</strong> Use <code><b>virtio</b></code>.
  <br><br>
  <strong>For macOS Catalina (10.15)</strong> Use <code><b>vmxnet3</b></code>.
</p>

<br>
<p align="center">Once you have selected the correct model, you can continue to the next step.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-ConfigDrives">&larr; Back Page</a>
    <a class="nav-button" href="../04-Review">Next Page &rarr;</a>
  </div>
  <br>
</h2>
