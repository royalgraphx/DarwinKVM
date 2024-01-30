---
layout: default
title: Display Overrides
nav_order: 11
has_children: true
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderDisplayOverridesTextOnly.png">
</p>

{: .important }
This information is thanks to <a href="https://github.com/mafredri">mafredri</a> and the <a href="https://github.com/mafredri/macos-display-overrides/tree/master">macos-display-overrides</a> repository on Github, you can cd to the directory included in this repo for more in depth information!

This guide will cover the basics of using macOS's Display Overrides ability to fix some issues with incompatible displays when using a hac. You'll first need to determine what is wrong with your current display. Possible fixes that are covered in this write-up are below.

| Issue | Fix |
| ---- | ----- |
| Display is recognized as a TV in System Information, thus does not allow a user to use Night Shift | Can use DisplayIsTV False override |
| HiDPI modes are not supported or do not appear | Possible to make them appear in settings by overriding supported resolutions list. |
