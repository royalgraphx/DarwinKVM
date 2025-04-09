---
layout: default
title: GRUB Configuration
parent: Setting Kernel Parameters
grand_parent: Dual GPU Passthrough
nav_order: 1
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
  <img width="650" height="200" src="../../../../../assets/Headers/HeaderGRUBBootloader.png">
</p>

{: .internalnote }
This will look better later.

<p align="center">Start by using your favorite terminal text editor. In this example, we'll be using nano.</p>

```bash
sudo nano /etc/default/grub
```

<p align="center">We'll need to add our secondary GPU's Device ID's to following flag.</p>

```bash
vfio-pci.ids=
```

<p align="center">Example usage:</p>

```bash
vfio-pci.ids=10de:06cd,10de:0be5
```

<p align="center">When you're done make sure you use <code>grub-mkconfig</code> to update the GRUB Bootloader. Restart Required.</p>

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../../03-ModProbeConf">Next Page &rarr;</a>
  </div>
  <br>
</h2>
