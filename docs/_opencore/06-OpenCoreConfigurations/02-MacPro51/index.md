---
layout: default
title: MacPro5,1
description: "Placeholder"
parent: OpenCore Configurations
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-MP51.png">
</p>

{: .warning }
Some of the targets here are very legacy. You may be required to source your own installation media. Always ensure you are fetching unmodified official DVD dumps of installation media or unmodified <code>.app</code> files for <code>createinstallmedia</code> onto blank disk images. Better documentation and streamlining the retrieval of these older versions will improve at a later time when dedicated effort can be spent on this front. <b>High Sierra (10.13) and newer can be used normally,</b> or with near no issues. Older OS X releases are the reason for the warning.

{: .headsup }
This configuration expects you to have the appropriate AMD dGPU or NVIDIA dGPU for your target Guest OS version. 

{: .important }
When dealing with older GPUs and passthrough, ensure that you take the time to create a UEFI updated ROM of your VBIOS as, as GPU passthrough require UEFI GOP to be able to see TianoCore. Documentation on this at a later date.

{: .note }
When virtualizing older OS X releases, and doing GPU passthrough with only a single GPU in the machine, you will have to setup various <code>piix4-uhci</code> controllers in the XML to use USB Redirection. USB 3.0 and 3.1 Controllers from both AMD and Intel are unsupported during this era, and passing your host USB Controllers is not a viable option here. Purchasing an older known working PCIe 2.0 USB Controller card, would solve this issue. The emulated USB Controllers are enough for a keyboard and a mouse. Unfortunately the data rate of these emulated controllers is not enough to support USB Audio. Attempts at 8,000 Hz still had massive static and data loss.

<h3 align="center">This Mac Pro Model targets Legacy macOS and OS X!</h3>

<p align="center">You will now be guided through all of the Configuration property lists' dictionaries. Play close attention and ensure you are properly setting all options as expected. Any issues when booting can be attributed to misconfiguration. This guide also assumes you are using the latest Q35 machine, and not older types such as 6.0 or older.</p>

<p align="center">As always, make sure you understand that you will need to passthrough a physical graphics card to use this Mac Pro Model. Please refer to the GPU support charts for initial and maximum support versions listed.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index">&larr; Back Page</a>
    <a class="nav-button" href="../00-Introduction">Next Page &rarr;</a>
  </div>
  <br>
</h2>

