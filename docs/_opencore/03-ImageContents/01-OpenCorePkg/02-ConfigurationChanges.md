---
layout: default
title: Changes to Config File
description: "Placeholder."
parent: Using OpenCorePkg
grand_parent: Disk Image Contents
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-OCPKGtoDOCPKG.png">
</p>

<p align="center">There aren't too many changes to be made, but being aware of what we've applied out of the box, will help ensure you have a successful configuration later.</p>

<hr>
<h2 align="center">Stripped Comments/Disabled Entries</h2>

<p align="center">Right away, we take the latest official Sample.plist from Acidanthera and run ProperTree's two Strip commands, to remove all of the stock examples included. This debloats the sample, and allows us to add what we really need.</p>

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-Strip-Commands.png" alt=""></a></p>
<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-Strip-Commands-Results.png" alt=""></a></p>

<hr>
<h2 align="center">CaseySJ | Fix PCI bus enumeration on KVM | 13.0+</h2>

<p align="center">This kernel patch repairs a hang that forces a timeout to go off before continuing the boot process once PCI enumeration happens. To add this patch, please add the following to <code>Kernel -> Patch -> 0</code>. You can copy the below section, as it is valid XML data, and Ctrl+V (paste) it into your ProperTree window for easier adding.</p>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
	<dict>
		<key>Arch</key>
		<string>x86_64</string>
		<key>Base</key>
		<string>__ZN17IOPCIConfigurator18IOPCIIsHotplugPortEP16IOPCIConfigEntry</string>
		<key>Comment</key>
		<string>CaseySJ | IOPCIIsHotplugPort | Fix PCI bus enumeration on KVM | 13.0+</string>
		<key>Count</key>
		<integer>1</integer>
		<key>Enabled</key>
		<true/>
		<key>Find</key>
		<data>hAB1Sw==</data>
		<key>Identifier</key>
		<string>com.apple.iokit.IOPCIFamily</string>
		<key>Limit</key>
		<integer>0</integer>
		<key>Mask</key>
		<data>/wD//w==</data>
		<key>MaxKernel</key>
		<string>24.99.99</string>
		<key>MinKernel</key>
		<string>22.0.0</string>
		<key>Replace</key>
		<data>AADrAA==</data>
		<key>ReplaceMask</key>
		<data>AAD/AA==</data>
		<key>Skip</key>
		<integer>0</integer>
	</dict>
</array>
</plist>
```

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-PCI-Kernel-Patch.png" alt=""></a></p>

<hr>
<h2 align="center">English as the Default Language</h2>

<p align="center">DarwinOCPkg, and DarwinKVM is primarily english based. Due to this, the default Sample has been updated from Russian to English.</p>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>prev-lang:kbd</key>
	<data>ZW46MjUy</data>
</dict>
</plist>
```

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-Default-Language.png" alt=""></a></p>
<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-Default-Language-Result.png" alt=""></a></p>

<hr>
<h2 align="center">Updated Default SMBIOS Data</h2>

<p align="center">DarwinOCPkg sets the default Model to <code>MacPro7,1</code> as most users intend to use the latest macOS version possible. Do not use other than a Mac Pro model for your QEMU KVM. You are not building an iMac, nor a Mac mini, and especially not a MacBook.</p>

<p align="center"><a href=""><img src="../../../../assets/Acidanthera/Sample-Updated-SMBIOS.png" alt=""></a></p>

<p align="center"><i>As a side note, you can see that the Min/Max have been set to <code>-1</code>. This allows the APFS driver to see as many volumes as possible, regardless of APFS driver version of said volume.</i></p>

<hr>
<h2 align="center">Complete!</h2>

<p align="center">As of right now, those are all of the modifications you need to make to OpenCorePkg to get a near identical experience to DarwinOCPkg. You can now continue to finish setting up the rest of your OpenCore disk image contents, and then continue to configuring the config file! Goodluck.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-SourceOCPKG">&larr; Back Page</a>
    <a class="nav-button" href="../../../04-FilePlacement/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
