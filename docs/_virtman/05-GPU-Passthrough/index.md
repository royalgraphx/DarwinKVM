---
layout: default
title: GPU Passthrough
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

  .sGPU-next-button-container {
    text-align: right;
  }

  .sGPU-next-button {
    margin: 10px;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
  }

</style>

<p align="center">
  <img width="650" height="200" src="../../../assets/Headers/Header-GPUPT.png">
</p>

<p align="center">Now that you've reached the desktop on your virtual machine, it's now time to complete the guest configuration by doing GPU passthrough. This step is crucial to actually being able to properly use your guest. GPU passthrough is a fundamental step and this guide was intended for this to be done.</p>

<p align="center">Depending on how many Graphics Processing Units are in your machine, you will need to go to the appropriate section. If you intend to keep your Integrated Graphics for Linux, and use the dGPU for the guest, that is still considered a Dual GPU setup, as you have two available graphics processing units. The same can be said if you have any more than only one.</p>

<h2 align="center">
  <br>
  <div class="sGPU-next-button-container">
  <a class="sGPU-next-button" href="../01-sGPU/index">Single GPU Passthrough &rarr;</a>
  </div>
  <div class="navigation-container">
    <a class="nav-button" href="../../04-Initial-Configuration/index">&larr; Back Page</a>
    <a class="nav-button" href="../02-dGPU/index">Dual GPU Passthrough &rarr;</a>
  </div>
  <br>
</h2>

