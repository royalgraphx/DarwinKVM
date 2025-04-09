---
layout: default
title: Drivers
description: "Placeholder"
parent: EFI Layout Config
nav_order: 2
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
  <img width="650" height="200" src="../../../assets/Headers/Header-Drivers.png">
</p>

{: .important }
Be sure you are keeping the required Drivers! You can replace <code>OpenHfsPlus.efi</code> if you'd like. Please read so you can fully understand the difference of all 3 variants.

<p align="center">Now something you'll notice is bundled files in the Drivers folder, we don't want some of these.</p>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/DriversRoot.png" alt="Placeholder Image"></a></p>
<p align="center">Keep the following from Drivers (if applicable):</p>

| Driver  | Status | Description |
| ----- | ----- | ----- |
| OpenRuntime.efi | Required | Required for fixing NVRAM, power management, RTC, memory mapping etc. OpenCore cannot run without this driver in place. |
| OpenPartitionDxe.efi | Required | Only required if you want Mojave or earlier (MacPro5,1 / 4,1 / 2,1) |
| ResetNvramEntry.efi | Required | Required to reset the system's NVRAM which is stored as a file by QEMU |
| OpenHfsPlus.efi | Optional | Open sourced HFS+ driver, but slower than Apple's proprietary driver. <span style="color: #bfa6ff;">Do not use on Mojave or older. Swap for <code>HfsPlusLegacy.efi</code></span> |

<p align="center">Those are already base files included in the repository. All of the above are open-source drivers by Acidanthera. These are prebundled with OpenCorePkg, including much more by Acidanthera.</p>

<h3 align="center">Other applicable drivers that are not included but may be required</h3>

{: .headsup }
Make sure you are only choosing one HFS+ driver! If you are using Catalina (10.15) and above you should be using <code>HfsPlus.efi</code> or <code>OpenHfsPlus</code>. HFS+ Legacy is for for Mojave (10.14) and older running a MacPro5,1 / MacPro4,1 / MacPro2,1 configuration and paired with the DUDK-Firmware.

| Driver  | Status | Description |
| ----- | ----- | ----- |
| [HfsPlusLegacy.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlusLegacy.efi) | Required | Only required if you are Mojave or earlier, required for MacPro5,1 and older (MacPro4,1 / MacPro2,1) |
| [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi) | Required | Apple's proprietary driver for HFS volumes, is preferred but not included OOB. Use only on MacPro7,1 Catalina+ Targets. |


<p align="center">As outlined in <a href="https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers">Gathering files -> Firmware Drivers</a> you will see a table that states <a href="https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi">HfsPlus.efi</a> is to not be mixed with other drivers. This is an official Apple driver. This is why it's not prebundled. If sourced, you can swap out the slower <code>OpenHfsPlus.efi</code> driver for the proprietary one.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-ACPI">&larr; Back Page</a>
    <a class="nav-button" href="../03-Kexts">Next Page &rarr;</a>
  </div>
  <br>
</h2>
