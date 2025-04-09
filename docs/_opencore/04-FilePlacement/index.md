---
layout: default
title: EFI Layout Config
Description: "Placeholder"
nav_order: 4
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
  <img width="650" height="200" src="../../../assets/Headers/Header-EFI-Structure-Config.png">
</p>

<h3 align="center">A quick guide for configuring OpenCore Folder Contents!</h3>

<br>
<p align="center">Let's recap real quick. We've setup our host machine to be able to spawn KVMs. We have used tools to create and prepare a raw disk image, that can be mounted to our virtual machine. The contents of that disk, contain a bootloader known as OpenCore. This bootloader, comes as-is. You, are intended to configure the bootloader, to actually use it. It does not come preconfigured for you. What we have done up to this point, is put the initial OpenCore setup/layout onto our disk. But we still need to place things in folders that OpenCore will check and use for the purpose of which that folder is named after.</p>

<br>
<p align="center"><a href=""><img src="../../../assets/DarwinOCPkg/OCRoot.png" alt="Placeholder Image"></a></p>

<h2 align="center"><b>ACPI</b></h2>

At least in the sense of the way we interact with it via OpenCore - acts as a bit of a go-between for the hardware and OS.  Windows and Linux have always had to deal with all sorts of vendors/OEMs doing all sorts of nonsense in their firmware - but since OS X / macOS has only (officially) needed to work with Apple UEFI firmware, Apple has been able to tailor much of the OS to expect certain things to be, *or not be*, there - or work in specific ways.  The ACPI folder allows us to provide supplemental SSDTs or even a patched DSDT in order to help coerce those OEM firmware tables into something that better suits OS X / macOS's expectations.

We'll go into which SSDTs are required for the intended Mac Pro that you want to virtualize. **As of the initial DarwinOCPkg installation, the ACPI folder will be empty. Do not worry. You can continue reading**.

<hr>

<h2 align="center"><b>Drivers</b></h2>

This folder is used for storing supplemental UEFI drivers for your UEFI firmware to load ontop of already loaded ones. As previously explained, standard PC firmware (UEFI or BIOS) lacks the ability to see/read/boot HFS+ / APFS disks or volumes. This folder is typically used to add either ``OpenHfsPlus.efi`` or ``HfsPlus.efi``. Other drivers can be loaded here for legacy hardware such as the MacPro5,1 we can make. **As of the initial DarwinOCPkg installation, you will see the collection of Drivers that DarwinOCPkg ships with. This folder will not be empty. We will selectively keep drivers later.**

<hr>

<h2 align="center"><b>Kexts</b></h2>

Kernel Extensions are typically developed by Apple and can be found on OS X / macOS systems under ``/System/Library/Extensions``. These extend the functionality of the Kernel by adding support for various hardware and software. In the context of OpenCore and its own ``Kexts`` folder, we use the following to include third-party kexts that are developed by the community to further extend the support of the Kernel to work on non-Apple hardware.

Examples of this can be ``VirtualSMC.kext`` which makes it so that a standard PC which does not come with an SMC device that contains Apple's DSMOS (Don't Steal Mac OS X) passphrase or key can emulate an SMC Chip and satisfy the requirements. Please do not use VirtualSMC on QEMU Q35 machines, as the QEMU binary itself can emulate an SMC Chip with they key. **As of the initial DarwinOCPkg installation, the Kexts folder will be empty. Do not worry. You can continue reading.** You will learn what would be required from your system later on.

<hr>

<h2 align="center"><b>Tools</b></h2>

OpenCore has a neat feature that lets you make use of various other UEFI "executables" or "binaries" as we mentioned earlier. This allows you to chain-load things like ``OpenShell.efi`` to view the current state of the machine under OpenCore. **As of the initial DarwinOCPkg installation, the Tools folder will be empty. Do not worry, we will not require any Tools at all. You can continue reading.**

<hr>

<h2 align="center"><b>Resources</b></h2>

As the name indicates, this folder holds resources for OpenCore to use for various beauty treatments. There comes a time much later in your hobby knowledge that you end up wanting to do things like making OpenCore more nice to look at. For this reason, this folder was mentioned last, as it really has the least importance and is NOT required to have a functional system. Other potential use-cases for this would be essentially getting something like the Mac startup Boot Chime that you hear ``Bong!`` on real Mac machines. **As of the initial OpenCore installation, the Resources folder will be empty. Do not worry. You can continue reading.**

<hr>

Now that you are aware of all of the folders and their purpose, you can now begin configuring the contents of each. The reason why we want to go through each folder first, is due to the fact that our first step during Configuration of the property list for OpenCore will be taking all the contents of the Disk Image and essentially explaining to OpenCore what has what, and where is what with ProperTree. You can't continue until each folder is appropriately filled out and has contents required for your system.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../03-DarwinOCPkg">&larr; Back Page</a>
    <a class="nav-button" href="../01-ACPI">Next Page &rarr;</a>
  </div>
  <br>
</h2>
