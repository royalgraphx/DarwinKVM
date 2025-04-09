---
layout: default
title: GRUB Configuration
description: "Placeholder"
nav_order: 1
parent: Kernel Parameters
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
  <img width="650" height="200" src="../../../assets/Headers/HeaderGRUBBootloader.png">
</p>

<p align="center">We'll go through properly updating GRUB to pass various kernel parameters for our Hypervisor setup needed for virtualization, and IOMMU usage</p>

<p align="center">Start by using your favorite terminal text editor. In this example, we'll be using nano</p>

```bash
sudo nano /etc/default/grub
```

<p align="center">We'll need to check our GRUB CMD Line flags and add various ones depending on the users' hardware.</p>

| Kernel Parameter Intention | AMD | Intel | Both |
| ----- | ----- | ----- | ---- |
| Enable SR-IOV at kernel level |  | ``intel_iommu=on`` |  |
| Set IOMMU to Passthrough Mode |  |  | ``iommu=pt`` |
| Disable Kernel EFI Framebuffer |  |  | ``video=efifb:off`` |

<p align="center">Example GRUB configuration for an AMD CPU</p>

```bash
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_CMDLINE_LINUX="rootfstype=ext4 iommu=pt video=efifb:off"
```

<p align="center">Example GRUB configuration for an Intel CPU</p>

```bash
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_CMDLINE_LINUX="rootfstype=ext4 intel_iommu=on iommu=pt video=efifb:off"
```

<p align="center">When you're done make sure you use <code>grub-mkconfig</code> to update the GRUB Bootloader</p>

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

<p align="center">A Restart is required to apply changes, and should be done now.</p>

<p align="center">You can now verify that the changes were made, by checking the current parameters booted with</p>

```bash
cat /proc/cmdline
```

<p align="center">Example Output</p>

```bash
[royalgraphx@hypervisor ~]$ cat /proc/cmdline 
BOOT_IMAGE=/vmlinuz-linux-zen root=UUID=00000000-0000-0000-0000-000000000000 rw rootfstype=ext4 iommu=pt video=efifb:off loglevel=3 quiet
```

<p align="center">If all looks good, you are now ready to continue!</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../../04-Package-Install/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
