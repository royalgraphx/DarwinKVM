---
layout: default
title: Configure NIC
parent: MacPro5,1 or Older
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

  .image-container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin: 20px 0;
  }

  .image-item {
    text-align: center;
    max-width: 300px;
    margin: 0 10px;
  }

  .image-item img {
    max-width: 100%;
    height: auto;
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

<div class="image-container">
  <div class="image-item">
    <h3></h3>
    <a href="../../../../assets/Virtual-Machine-Manager/VManLegacyAddNICvmxnet3.png" target="_blank">
      <img src="../../../../assets/Virtual-Machine-Manager/VManLegacyAddNICvmxnet3.png" alt="">
    </a>
  </div>
  <div class="image-item">
    <h3></h3>
    <a href="../../../../assets/Virtual-Machine-Manager/VManLegacyAddNICe1000.png" target="_blank">
      <img src="../../../../assets/Virtual-Machine-Manager/VManLegacyAddNICe1000.png" alt="">
    </a>
  </div>
</div>
<h4 align="center"><i>You must type it in manually and hit apply.</i></h4>

<br>
<h3 align="center"><b>Choose the correct Network Model depending on your Guest OS</b></h3>

<br>
<p align="center">
  <strong>For Mac OS X El Capitan (10.11+) and newer:</strong> Use <code><b>vmxnet3</b></code>.<br><br>
  <strong>For Mac OS X Yosemite (10.10+) and newer:</strong> Use <code><b>e1000e</b></code>.<br><br>
  <strong>For Mac OS X Mavericks (10.9) only:</strong> Use <code><b>e1000-82545em</b></code>.<br><br>
  <strong>For Mac OS X Snow Leopard (10.6+) and newer:</strong> Use <code><b>e1000</b></code>.<br><br>
  <strong>For Mac OS X Leopard (10.5-) and older:</strong> Use <code><b>e1000-82545em</b></code>.
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
