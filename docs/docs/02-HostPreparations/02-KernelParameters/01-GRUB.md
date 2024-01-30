---
layout: default
title: GRUB Configuration
parent: Kernel Parameters
grand_parent: Host Preparations
nav_order: 1
---

# GRUB Configuration
#### Enabling flags needed for Virtualization/QEMU/KVM/libvirtd
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/2)-Editing-GRUB">Editing GRUB</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

Start by using your favorite terminal text editor. In this example, we'll be using nano.

```bash
sudo nano /etc/default/grub
```

We'll need to check our GRUB CMD Line flags and add various ones depending on the users' hardware.

| Intel CPU | AMD GPU | Needed Regardless |
| ----- | ----- | ----- |
| intel_iommu=on | video=efifb:off | iommu=pt | 

Example GRUB configuration for an AMD CPU + AMD GPU host:

```bash
iommu=pt video=efifb:off
```

When you're done make sure you use ``grub-mkconfig`` to update the GRUB Bootloader. Restart Required.

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## You can now continue to the next <a href="../03-PackageInstall">page</a>.
