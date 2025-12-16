---
layout: default
title: Dumping Display Configuration
parent: Display Overrides
nav_order: 2
---

# Dumping Display Configuration
#### We can leverage existing tools to dump current display information

We'll use the Displays tab in Hackintool to dump all the detected Displays configuration files. Essentially plist files which hold the attributes for our displays. This will generate a few things on our desktop. What we care about, is the folder named our Display Vendor ID of the problematic display.

<p align="center">
  <img src="../../../assets/writeups/DisplayOverrides/HackintoolDisplayView.png">
</p>

<p align="center">
  <img src="../../../assets/writeups/DisplayOverrides/HackintoolOverridesOutput.png">
</p>

<p align="center">
  <img src="../../../assets/writeups/DisplayOverrides/DisplaysProductID.png">
</p>

Be sure to remove the injected EDID included in the plist by Hackintool.

<p align="center">
  <img src="../../../assets/writeups/DisplayOverrides/DisplaysProductID2.png">
</p>

## You can now continue to the next <a href="../03-InstallingOverride">page</a>.
