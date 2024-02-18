---
layout: default
title: GRUB Configuration
parent: Kernel Parameters
grand_parent: Host Preparations
nav_order: 1
---

# GRUB Configuration
#### Enabling flags needed for Virtualization/QEMU/KVM/libvirtd

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
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_CMDLINE_LINUX="rootfstype=ext4 iommu=pt video=efifb:off"
```

When you're done make sure you use ``grub-mkconfig`` to update the GRUB Bootloader. A Restart is required to apply changes.

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

You can now verify that the following changes were made, by checking the current flags booted with.

```bash
cat /proc/cmdline
```

Example Output:

```bash
[royalgraphx@hypervisor ~]$ cat /proc/cmdline 
BOOT_IMAGE=/vmlinuz-linux-zen root=UUID=c95503f3-e0fa-493e-9943-98b03aa1d280 rw rootfstype=ext4 iommu=pt video=efifb:off loglevel=3 quiet
```

## You can now continue to the next <a href="../03-PackageInstall">page</a>.
