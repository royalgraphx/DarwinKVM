---
layout: default
title: Single GPU Passthrough
description: "Placeholder"
parent: GPU Passthrough
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-sGPU-PT.png">
</p>

<h2 align="center">Current Tasks</h2>

| **Step** | **Quick Description** |
| --- | --- |
| **Script Installation** | The RisingPrism community for Single GPU Passthrough, provides two common scripts they support and maintain. These are how you will automate the process of hooking, and unhooking your GPU to use inside of the guest machine. |
| **Hook Modification** | You'll now need to add the DarwinKVM-MP## name to the <code>If</code> statement, so that the script is listening for your passthrough configured machines. This allows for multiple VMs to be setup with GPU Passthrough capability. |
| **Configuring Virt-Manager** | Now it's time to remove all of the virtual hardware, and passthrough your physical GPU and USB Controllers. |
| **Complete!** | Once done, you can now boot this virtual machine and be completely within it! |

<p align="center">You're going to be able to use your one and only graphics processing unit on your host by utilizing a set of scripts that will listen for specific KVMs launched by Virt-Manager. When this happens, it will exit the current user session, kill the display manager and environment, then detach your GPU to make it available for QEMU to then attach it to the guest that starts up.</p>

<p align="center">When the guest shuts down normally, i.e the QEMU binary terminates, the script will then do everything in reverse. This will land you back at your login manager, and you can continue using Linux as before.</p>

<p align="center">If you are running into any issues with either the RisingPrism Single GPU Passthrough scripts, or the akshaycodes scripts, you can join the following discord below for direct support regarding these scripts. Please <span style="color: #bfa6ff;"><b>do not</b></span> join for support regarding OS X or macOS. Please <span style="color: #bfa6ff;"><b>do not</b></span> join for support for any other scripts than were mentioned, or any manual methods of GPU passthrough, this is <span style="color: #bfa6ff;"><b>only</b></span> for those having issues using specifically, the RisingPrism or akshaycodes scripts.</p>

<p align="center">
<a href="https://discord.com/invite/bh4maVc">Join the RisingPrismTV Discord server</a>
</p>

<div style="display: flex; justify-content: center; align-items: center;">
    <iframe src="https://discord.com/widget?id=696488545619279882&theme=dark" width="400" height="350" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
</div>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index">&larr; Back Page</a>
    <a class="nav-button" href="../01-Installation">Next Page &rarr;</a>
  </div>
  <br>
</h2>
