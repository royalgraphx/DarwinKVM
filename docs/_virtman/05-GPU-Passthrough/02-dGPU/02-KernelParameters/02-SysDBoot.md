---
layout: default
title: systemd-boot
parent: Setting Kernel Parameters
grand_parent: Dual GPU Passthrough
nav_order: 2
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
  <img width="650" height="200" src="../../../../../assets/Headers/HeaderSysDBoot.png">
</p>

{: .important }
You should be familiar with systemd-boot to make these modifications, these are not copy and paste commands. You must read and adapt to your configuration as they are unique to all systemd-boot installations and configurations.

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

<p align="center">Start by using your favorite terminal text editor. In this example, we'll be using nano.</p>

<p align="center">An example using nano to edit the <code>Arch Linux (Linux) (Default)</code> entry.</p>

```bash
sudo nano /boot/loader/entries/2023-08-12_19-47-44_1inux.conf
```

<p align="center">We'll need to add our secondary GPU's Device ID's to following flag.</p>

```bash
vfio-pci.ids=
```

<p align="center">Example usage:</p>

```bash
vfio-pci.ids=10de:06cd,10de:0be5
```

<p align="center">Example modified entry:</p>

```
title Arch Linux (Linux)
linux /vmlinuz-linux
initrd /initramfs-linux.img
options zswap.enabled=0 rw rootfstype-ext4 vfio-pci.ids=10de:06cd,10de:0be5 iommu=pt video=efifb:off
```
<p align="center">Once you're done adding the flags to the <code>options</code>, save the file and reboot.</p>

<p align="center">Once back, you can issue the following command to view currently booted arguments to verify it applied, and you've booted with said updated args.</p>

```bash
cat /proc/cmdline
```

<p align="center">Example output</p>

```bash
zswap.enabled=0 rw rootfstype-ext4 vfio-pci.ids=10de:06cd,10de:0be5 iommu=pt video=efifb:off
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../../03-ModProbeConf">Next Page &rarr;</a>
  </div>
  <br>
</h2>
