---
layout: default
title: Configure Storage Drives
parent: MacPro7,1
grand_parent: Initial Configuration
nav_order: 2
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
<h2 align="center"><b>Configure Storage Drives</b></h2>

<br>
<h2 align="center">How to add the OpenCore Drive</h2>
<br>

{: .note }
This is a required disk. Your virtual machine must have the OpenCore disk image to find and boot any other OS X or macOS related installation content or disks.

<p align="center">1. Select the <code>Add Hardware</code> button to bring up the Storage selection prompt.</p>

<p align="center">2. Select the OpenCore image via the <code>Manage...</code> button. The <code>Bus type:</code> should be set to <code>VirtIO</code>.

<p align="center">3. Cache mode set to <code>None</code>, and <code>Discard</code> mode is set to <code>Unmap</code>.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManAddVirtIOInstallation2.png" alt=""></a></p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManAddOpenCore1.png" alt=""></a></p>

<p align="center">Don't forget to enable it as your primary boot drive.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManAddOpenCore2.png" alt=""></a></p>

<hr>
<details markdown="block">
<summary align="center">Adding Offline installation Media</summary>

{: .internalnote }
This section will be appropriately filled out once the Offline installation portion of the Docs is complete, as earlier mentions of this sections are also incomplete, this doesn't make sense to fill out just yet. If you do end up doing an offline installation and want to add your media, simply add it as <code>SATA CD-ROM</code> and boot it via OpenCore. Otherwise, try using the <code>USB</code> option for weirder disk images. I've found this method can be a bit unreliable, and luckily you can use recoveryOS.

</details>
<hr>

<p align="center"><b>If you did not create a Macintosh disk image earlier using DiskProvision, create it now using the Virtual Machine Manager GUI to have a disk to install the OS on to.</b></p>
<br>

<details markdown="block">
<summary align="center">Creating a disk image for installation</summary>

{: .headsup }
If you're looking to passthrough a physical drive on your system to act as the main storage for the Virtual Machine, substitute this section. Requires macOS compatible SSD/NVMe Hardware.

<p align="center">To create a virtual disk image, when selecting the "Add Hardware" button to bring up the Storage prompt, there is a + button in the current libvirt images directory. You can choose any size you'd like but I suggest the standard 128G, 256GB, 512GB, 1024GB.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManAddVirtIOInstallation.png" alt=""></a></p>

</details>
<hr>

<p align="center">You are now ready to configure the NIC. Head over to the next page for OS specific options!</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-ConfigDisplay">&larr; Back Page</a>
    <a class="nav-button" href="../03-ConfigNIC">Next Page &rarr;</a>
  </div>
  <br>
</h2>
