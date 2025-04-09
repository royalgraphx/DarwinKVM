---
layout: default
title: systemd-boot
description: "Placeholder"
nav_order: 2
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
  <img width="650" height="200" src="../../../assets/Headers/HeaderSysDBoot.png">
</p>

{: .important }
You should be familiar with systemd-boot to make these modifications, these are not copy and paste commands. You must read and adapt to your configuration as they are unique to all systemd-boot installations and configurations.

<p align="center">We'll go through properly updating systemd-boot to pass various kernel parameters for our Hypervisor setup needed for virtualization, and IOMMU usage</p>

<p align="center">Start by issuing the <code>sudo bootctl list</code> command in your terminal to view your configurations.</p>

<p align="center">Example console output:</p>

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

<p align="center">You'll want to note the path of your default boot configuration file.</p>

<p align="center">Depending on your choice of editor, and configuration file from the output, you'll need to modify it to contain certain boot arguments depending on your host hardware configuration</p>

| Kernel Parameter Intention | AMD | Intel | Both |
| ----- | ----- | ----- | ---- |
| Enable SR-IOV at kernel level |  | ``intel_iommu=on`` |  |
| Set IOMMU to Passthrough Mode |  |  | ``iommu=pt`` |
| Disable Kernel EFI Framebuffer |  |  | ``video=efifb:off`` |

<p align="center">An example using Nano to edit <code>Arch Linux (Linux) (Default)</code> on an AMD Host</p>

```bash
sudo nano /boot/loader/entries/2023-08-12_19-47-44_1inux.conf
```

```
title Arch Linux (Linux)
linux /vmlinuz-linux
initrd /initramfs-linux.img
options zswap.enabled=0 rw rootfstype-ext4 iommu=pt video=efifb:off
```

<p align="center">An example using Nano to edit <code>Arch Linux (Linux) (Default)</code> on an Intel Host</p>

```bash
sudo nano /boot/loader/entries/2023-08-12_19-47-44_1inux.conf
```

```
title Arch Linux (Linux)
linux /vmlinuz-linux
initrd /initramfs-linux.img
options zswap.enabled=0 rw rootfstype-ext4 intel_iommu=on iommu=pt video=efifb:off
```

<p align="center">Once you're done adding the flags to the <code>options</code> save the file and reboot</p>

<p align="center">You can now verify that the changes were made, by checking the current parameters booted with</p>

```bash
cat /proc/cmdline
```

<p align="center">Example Output</p>

```
zswap.enabled=0 rw rootfstype-ext4 iommu=pt video=efifb:off
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
