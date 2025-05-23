---
layout: default
title: Sourcing OpenCorePkg
description: "Placeholder."
parent: Using OpenCorePkg
grand_parent: Disk Image Contents
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-SourcingOCPKG.png">
</p>

<p align="center">To continue the guide you will need a disk image that will act as a USB containing OpenCore. In this page, you'll get a basic overview on how to download and unpack OpenCorePkg for your previously created and currently mounted OpenCore disk image.</p>

<hr>
<h2 align="center">Basic Walkthrough</h2>

{: .note }
The screenshots may be outdated and not reflect the current latest OpenCorePkg release on Github! that's the reason why this section exists. You can continue to follow along no matter what version you're about to download. (Ensure it's atleast newer than the version hown in the screenshots below.)

<br>
<a href=""><img src="../../../../assets/Acidanthera/OpenCore-Releases-Tab.png" alt=""></a>

<p align="center">To get started, you'll want to head to <a href="https://github.com/acidanthera/OpenCorePkg/releases/">OpenCorePkg</a>'s Releases tab on their Github repository in a new browser tab. Choosing the latest version, and continuing to download either the DEBUG or RELEASE variant, depending on your expertise level.</p>

<a href=""><img src="../../../../assets/Acidanthera/OpenCore-Release-104-Artifacts.png" alt=""></a>

<p align="center">You'll now want to ensure you have the following files as you'll need them for placing them on your OpenCore disk image.</p>

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/OpenCore-DEBUG-Contents.png" alt=""></a></p>

{: .warning }
> You will not have the proper *AcpiSamples* folder from simply using OpenCorePkg! You must download the following files depending on your intended Mac Pro model for when you populate the *ACPI* folder at a later portion of the guide.
>
> MacPro7,1 (Catalina 10.15+) - [SSDT-EC-USBX](https://github.com/royalgraphx/DarwinOCPkg/raw/refs/heads/main/Docs/AcpiSamples/SSDT-EC-USBX.aml) and [SSDT-PLUG](https://github.com/royalgraphx/DarwinOCPkg/raw/refs/heads/main/Docs/AcpiSamples/SSDT-PLUG.aml)
>
> MacPro5,1 or older (Mojave 10.14-) - [SSDT-EC](https://github.com/royalgraphx/DarwinOCPkg/raw/refs/heads/main/Docs/AcpiSamples/SSDT-EC.aml)
>

<p align="center">With all of the required files now in your possession, you can now begin constructing the disk image contents.</p>

<p align="center">Later on, you're instructed on how to unpack DarwinOCPkg, but for you, you'll want to go ahead and place the EFI folder found in the <code>X64</code> folder onto the root of your disk image. You'll also want to ensure that you move over the <code>Sample.plist</code> over to within the <code>/EXAMPLE/EFI/OC/</code> folder. An example image of the structure is provided below:</p>

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/OpenCore-Example-RootUSB.png" alt=""></a></p>

<p align="center">Ensure you rename the Sample to config.</p>

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/OpenCore-SampleToConfig.png" alt=""></a></p>

<p align="center">This next portion of the guide assumes you are advanced enough to already use ProperTree. You will require modifying the <code>config.plist</code> before continuing, because you are currently lacking a few kernel patches and changes. If you are not confident to continue modifying config.plist to match DarwinOCPkg, feel free to simply go back and undo the above, and continue with DarwinOCPkg instead.</p>

<p align="center">You can now continue to the customization of <code>config.plist</code> before you then continue through the rest.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-ConfigurationChanges">Next Page &rarr;</a>
  </div>
  <br>
</h2>
