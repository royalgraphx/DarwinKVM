---
layout: default
title: Adding to config.plist
parent: Custom Memory Mapping
nav_order: 3
---

# Updating config.plist with Custom Memory
#### Tip: Have both plists open in two different ProperTree windows.


Now that you've modified or opened the included Memory Map ``.plist`` you can open your OpenCore config.plist to apply the custom memory. Navigate to the ``PlatformInfo`` dictionary. Below ``Generic`` you can copy and paste the ``Memory`` from the Memory Map ``.plist``. Make sure to enable the ``CustomMemory`` boolean to ``True``. Go through the devices and verify that it all looks good and ready to boot. On a reboot, you should no longer have the memory errors! Your About Mac should also now properly report the RAM Speed.

<p align="center">
  <img width="650" height="200" src="../../../assets/PTCustomMemoryConfig.png">
</p>

<p align="center">
  <img width="650" height="200" src="../../../assets/MemoryMappedMacPro71.png">
</p>

<p align="center">
  <img width="650" height="200" src="../../../assets/MemoryMapGuestLayout.png">
</p>

#### Thanks for reading!
