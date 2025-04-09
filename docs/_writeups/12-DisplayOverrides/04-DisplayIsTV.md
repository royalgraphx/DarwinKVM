---
layout: default
title: DisplayIsTV
parent: Display Overrides
nav_order: 4
---

# DisplayIsTV
#### Disabling isTelevision detection.

Open up the installed Override plist file, you can do this via TextEdit or ProperTree.

<p align="center">
  <img src="../../../assets/DisplaysIsTVFalse2.png">
</p>

<p align="center">
  <img src="../../../assets/DisplaysIsTVFalse.png">
</p>

As you can see, you will have to add the following section to the plist.

```
<key>DisplayIsTV</key>
<false/>
```
After a reboot, you can open System Information and check Graphics/Displays.

## Before

<p align="center">
  <img src="../../../assets/DisplaysDefault.png">
</p>

<p align="center">
  <img src="../../../assets/DisplayNightLightOff.png">
</p>

## After

<p align="center">
  <img src="../../../assets/DisplaysPatched.png">
</p>

<p align="center">
  <img src="../../../assets/DisplayNightLightOn.png">
</p>

## You can now return to the <a href="../index">Display Overrides</a> Table of Contents.
