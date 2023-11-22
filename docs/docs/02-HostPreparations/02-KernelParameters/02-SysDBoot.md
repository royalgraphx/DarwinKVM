---
layout: default
title: systemd-boot
parent: Part 2. Kernel Parameters
grand_parent: Host Preparations
nav_order: 2
---

# systemd-boot Configuration
#### Enabling flags needed for Virtualization/QEMU/KVM/libvirtd
#### Tested within an Arch virtual machine.

{: .important }
You should be familiar with systemd-boot to make these modifications, these are not copy and paste commands. You must read and adapt to your configuration.

Start by issuing the ``sudo bootctl list`` command in your terminal to view your configurations.

Example console output:

```bash
type: Boot Loader Specification Type #1 (.conf)
title: Arch Linux (linux) (default) (selected)
id: 2023-08-12_19-47-44_ linux.conf 
source: /boot/loader/entries/2023-08-12_19-47-44_1inux.conf
linux: /boot/vmlinuz-linux
initrd: /boot/initramfs-linux. img
options: zswap.enabled=0 rw rootfstype-ext4

type: Boot Loader Specification Tupe #1 (.conf)
title: Arch Linux (linux-fallback)
id: 2023-08-12_19-47-44_1inux-fallback.conf
source: /boot/loader/entries/2023-08-12_19-47-44_Iinux-fallback.conf
linux: /boot/vmlinuz-linux
initrd: /boot/initramfs-linux-fallback.ing
options: zswap.enabled=0 rw rootfstype-ext4

type: Automatic
title: Reboot Into Firmware Interface id: auto-reboot-to-firmware-setup
source: /sus/firmware/efi/efivars/LoaderEntries-4267b082-0a4c-41cf-b6c7-440b29668c4f
```

You'll want to note the path of your default boot configuration file.

Depending on your choice of editor, and configuration file from the output, you'll need to modify it to contain certain boot arguments depending on your host hardware configuration.

| Intel CPU | AMD GPU | Needed Regardless |
| ----- | ----- | ----- |
| intel_iommu=on | video=efifb:off | iommu=pt | 

An example using Nano to edit ``Arch Linux (Linux) (Default)`` on an AMD Host with an AMD GPU.

```bash
sudo nano /boot/loader/entries/2023-08-12_19-47-44_1inux.conf
```

```
title Arch Linux (Linux)
linux /vmlinuz-linux
initrd /initramfs-linux.img
options zswap.enabled=0 rw rootfstype-ext4 iommu=pt video=efifb:off
```
Once you're done adding the flags to the ``options``, save the file and reboot.

Once back, you can issue the following command to view currently booted arguments to verify it applied, and you've booted with said updated args.

```
cat /proc/cmdline
```

Example output

```
zswap.enabled=0 rw rootfstype-ext4 iommu=pt video=efifb:off
```

## You can now continue to the next <a href="../03-PackageInstall.html">page</a>.
