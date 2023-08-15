---
layout: default
title: Missing HiDPI
parent: Display Overrides
nav_order: 5
---

# Missing HiDPI
#### Defining Custom Resolutions List.
#### This section has been derived from the <a href="https://github.com/mafredri/macos-display-overrides/tree/master">macos-display-overrides</a> Repo by mafredri.

Open up the installed Override plist file, you can do this via TextEdit or ProperTree.

<p align="center">
  <img src="../../../assets/OverridesHiDPI.png">
</p>

<p align="center">
  <img src="../../../assets/OverridesHiDPIPT.png">
</p>

To understand what we added, you can open the file with TextEdit, to paste this section in

```
<key>scale-resolutions</key>
<array>
	<data>AAAQAAAACQA=</data> <!-- 2048x1152^2 -->
	<data>AAAPgAAACLg=</data> <!-- 1984x1116^2 -->
	<data>AAAPAAAACHA=</data> <!-- 1920x1080^2 -->
	<data>AAAOgAAACCg=</data> <!-- 1856x1044^2 -->
	<data>AAAOAAAAB+A=</data> <!-- 1792x1008^2 -->
	<data>AAANgAAAB5g=</data> <!-- 1728x972^2 -->
	<data>AAANAAAAB1A=</data> <!-- 1664x936^2 -->
	<data>AAAMgAAABwg=</data> <!-- 1600x900^2 -->
	<data>AAAMAAAABsA=</data> <!-- 1536x864^2 -->
	<data>AAALgAAABng=</data> <!-- 1472x828^2 -->
	<data>AAALAAAABjA=</data> <!-- 1408x792^2 -->
	<data>AAAKgAAABeg=</data> <!-- 1344x756^2 -->
	<data>AAAKAAAABaA=</data> <!-- 1280x720^2 -->
	<data>AAAIAAAABIA=</data> <!-- 1024x576^2 -->
	<data>AAAHgAAABDg=</data> <!-- 960x540^2 -->
	<data>AAAQAAAACQAAAAABAKAAAA==</data> <!-- 2048x1152 (HiDPI) -->
	<data>AAAPgAAACLgAAAABAKAAAA==</data> <!-- 1984x1116 (HiDPI) -->
	<data>AAAPAAAACHAAAAABAKAAAA==</data> <!-- 1920x1080 (HiDPI) -->
	<data>AAAOgAAACCgAAAABAKAAAA==</data> <!-- 1856x1044 (HiDPI) -->
	<data>AAAOAAAAB+AAAAABAKAAAA==</data> <!-- 1792x1008 (HiDPI) -->
	<data>AAANgAAAB5gAAAABAKAAAA==</data> <!-- 1728x972 (HiDPI) -->
	<data>AAANAAAAB1AAAAABAKAAAA==</data> <!-- 1664x936 (HiDPI) -->
	<data>AAAMgAAABwgAAAABAKAAAA==</data> <!-- 1600x900 (HiDPI) -->
	<data>AAAMAAAABsAAAAABAKAAAA==</data> <!-- 1536x864 (HiDPI) -->
	<data>AAALgAAABngAAAABAKAAAA==</data> <!-- 1472x828 (HiDPI) -->
	<data>AAALAAAABjAAAAABAKAAAA==</data> <!-- 1408x792 (HiDPI) -->
	<data>AAAKgAAABegAAAABAKAAAA==</data> <!-- 1344x756 (HiDPI) -->
	<data>AAAKAAAABaAAAAABAKAAAA==</data> <!-- 1280x720 (HiDPI) -->
	<data>AAAIAAAABIAAAAABAKAAAA==</data> <!-- 1024x576 (HiDPI) -->
	<data>AAAHgAAABDgAAAABAKAAAA==</data> <!-- 960x540 (HiDPI) -->
</array>
<key>target-default-ppmm</key>
<real></real>
```

In the ``real`` section you must fill out the value depending on this chart, it sets the default resolution and enables HiDPI selection in Preferences.

| Value | Result |
| ---- | ----- |
| 6.33, 6.53 | 1920x1080 (5 items), Larger Text - 1280x720 - 1600x900 - 1920x1080 - 2048x1152 - 2560x1440 - More Space |
| 6.54, 6.75 | 1984x1116 (5 items), Larger Text - 1280x720 - 1600x900 - 1984x1116 - 2048x1152 - 2560x1440 - More Space |
| 6.76, .... | 2048x1152 (4 items), Larger Text - 1280x720 - 1600x900 - 2048x1152 - 2560x1440 - More Space |

Once you've applied your changes, reboot macOS and you should now see the resolutions present.

## Before

<p align="center">
  <img src="../../../assets/OverridesHiDPIBefore.png">
</p>

## After

<p align="center">
  <img src="../../../assets/OverridesHiDPIAfter.png">
</p>

As you can see, this enabled the ability to use 2K on a 1080p TV Display.

<p align="center">
  <img src="../../../assets/Overrides2Kexample.png">
</p>

## You can now return to the <a href="../index">Display Overrides</a> Table of Contents.