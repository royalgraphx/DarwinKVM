---
layout: default
title: ACPI
description: "Placeholder"
parent: EFI Layout Config
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
  <img width="650" height="200" src="../../../assets/Headers/Header-ACPI.png">
</p>

{: .important }
So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT (Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT (Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project. We'll have to add SSDTs to our OpenCore image depending on the Mac Pro Model you would like to virtualize.

<p align="center">OS X / macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for Darwin guests to work properly depends on your installation target. Please expand the section that corresponds to the target version of OS X / macOS you want to run. Make sure you're grabbing the correct files!</p>


<hr>
<details markdown="block">
<summary align="center">For Catalina (10.15.7) and newer (MacPro7,1)</summary>

<br>

For our use case on MacPro7,1 we will be using an Intel Cascade Lake CPUID overlay <span style="color: #bfa6ff;">so regardless of the host hardware, the only SSDTs we require to boot will be <code>SSDT-EC-USBX</code> and <code>SSDT-PLUG</code></span>. Keep in mind that we are actively creating an OpenCore EFI for the machine hardware that QEMU has spawned as we defined it.

 - Embedded controller (EC)
   - Mac OS X / macOS requires a device named EC to be present, so we create a dummy EC. The USBX devices (See next) also require an EC device to work.
 - USBX
   - This sets the correct USB power properties for charging devices like iPhones.
 - Plugin type
   - This generally allows the use of XCPM providing native CPU power management on Intel CPUs. Our version will enable VMPlatformPlugin XCPM, exactly like a Parallels VM.

</details>
<hr>

<details markdown="block">
<summary align="center">For Mojave (10.14.4) and older (MacPro5,1 or older)</summary>

<br>

For our use case for creating MacPro5,1 / MacPro4,1 / MacPro2,1 we will be using an Intel Westmere E56XX CPU, or an Intel Celeron (Conroe/Merom) CPUID overlay on older models <span style="color: #bfa6ff;">so regardless of the host hardware, the only SSDT file we require to boot will be <code>SSDT-EC</code></span>. Keep in mind that we are actively creating an OpenCore EFI for the machine hardware that QEMU has spawned as we defined it.

 - Embedded controller (EC)
   - Mac OS X requires a device named EC to be present, so we create a dummy EC.

<br>
</details>
<hr>

<details markdown="block">
<summary align="center">Credits and Origins</summary>

<br>

Thanks to [ExtremeXT](https://github.com/ExtremeXT) for allowing me to include his manually created SSDT-EC-USBX which combines them into a single file, as well as the included SSDT-PLUG file. Unfortunately there is no source <code>.dsl</code> file but you can always open the <code>.asl</code> files with MaciASL and make any needed changes before recompiling and replacing the copy from DarwinOCPkg.

Thanks to [CorpNewt](https://github.com/CorpNewt) for [SSDTTime](https://github.com/corpnewt/SSDTTime), which was used on a DarwinKVM defined-VM booted in to Arch Linux, to dump and create SSDT-EC. If you would like to create all of the mentioned SSDTs above, you can use the mentioned tool to create them yourself from a Linux environment. This is an advanced step, as you would already have had to import the XML to Virt-Manager. Something we have yet to do. This essentially creates a chicken-or-egg situation. Where the truth is, I already did this for you.

<br>
</details>
<hr>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-Drivers">Next Page &rarr;</a>
  </div>
  <br>
</h2>
