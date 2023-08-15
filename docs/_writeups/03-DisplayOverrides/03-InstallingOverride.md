---
layout: default
title: Part 3 - Installing Overrides
parent: Display Overrides
nav_order: 3
---

# Installing Overrides
#### macOS provides a native method for overriding Display data.

We'll need to navigate to ``/Library`` with Finder or a Terminal, to create a new folder titled "Displays". With that done, navigate within that folder and proceed to make folders until you get the following path. As far as I know, the path is case-sensitive.

```
/Library/Displays/Contents/Resources/Overrides
```

In here, you can drag in the folder created by Hackintool with the Vendor ID of our problematic display. You can add more than one, as many as you need.

Example of properly installed overrride

```
/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-593a/DisplayProductID-1006
```

<p align="center">
  <img src="../../../assets/OverridesInstallation.png">
</p>

# Available Overrides

## If you need to fix <a href="../04-DisplayIsTV">DisplayIsTV</a>.

## If you need to fix <a href="../05-HiDPI">Missing HiDPI</a>.