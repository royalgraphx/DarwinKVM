---
layout: default
title: GRUB Configuration
parent: Kernel Parameters
grand_parent: Dual GPU Passthrough
nav_order: 1
---

# GRUB Configuration
#### Enabling flags needed for Dual GPU Passthrough.

Start by using your favorite terminal text editor. In this example, we'll be using nano.

```bash
sudo nano /etc/default/grub
```

We'll need to add our secondary GPU's Device ID's to following flag.

```bash
vfio-pci.ids=
```

Example usage:

```bash
vfio-pci.ids=10de:06cd,10de:0be5
```

When you're done make sure you use ``grub-mkconfig`` to update the GRUB Bootloader. Restart Required.

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## You can now continue to the next <a href="../../03-ModProbeConf">page</a>.
