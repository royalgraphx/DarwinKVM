---
layout: default
title: Configuring modprobe
parent: Dual GPU Passthrough
grand_parent: GPU Passthrough
has_children: false
has_toc: false
nav_order: 3
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

<br>
<h2 align="center"><b>Configuring modprobe</b></h2>
<h4 align="center">Helps vfio-pci hook objects and block modules.</h4>
<br>

{: .internalnote }
This is def another option I should add onto the Main Menu, similar to the QEMU hook script.

<p align="center">We'll begin by creating a configuration file in the modprobe.d folder.</p>

<p align="center">Start by using your favorite terminal text editor. In this example, we'll be using nano.</p>

```bash
sudo nano /etc/modprobe.d/vfio.conf
```

<p align="center">In this new file, you can begin to build your custom vfio configuration. For starters, let's simply add the secondary GPU and block the nvidia module and preload vfio-pci instead.</p>

```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep nvidia pre: vfio-pci
```

<p align="center">To apply these changes, we'll need to use <code>mkinitcpio</code> to rebuild the initial ramdisk environment.</p>

```bash
sudo mkinitcpio --all
```

<p align="center">Most warnings are okay! Example output:</p>

```bash
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'default'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -g /boot/initramfs-linux.img --microcode /boot/amd-ucode.img
==> Starting build: '6.6.1-arch1-1'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [autodetect]
  -> Running build hook: [keyboard]
==> WARNING: Possibly missing firmware for module: 'xhci_pci'
  -> Running build hook: [keymap]
  -> Running build hook: [modconf]
  -> Running build hook: [block]
  -> Running build hook: [filesystems]
  -> Running build hook: [fsck]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux.img'
==> Image generation successful
==> Building image from preset: /etc/mkinitcpio.d/linux.preset: 'fallback'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux -g /boot/initramfs-linux-fallback.img -S autodetect --microcode /boot/amd-ucode.img
==> Starting build: '6.6.1-arch1-1'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [keyboard]
==> WARNING: Possibly missing firmware for module: 'xhci_pci'
  -> Running build hook: [keymap]
  -> Running build hook: [modconf]
  -> Running build hook: [block]
==> WARNING: Possibly missing firmware for module: 'qla1280'
==> WARNING: Possibly missing firmware for module: 'wd719x'
==> WARNING: Possibly missing firmware for module: 'qla2xxx'
==> WARNING: Possibly missing firmware for module: 'qed'
==> WARNING: Possibly missing firmware for module: 'aic94xx'
==> WARNING: Possibly missing firmware for module: 'bfa'
  -> Running build hook: [filesystems]
  -> Running build hook: [fsck]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux-fallback.img'
==> Image generation successful
==> Building image from preset: /etc/mkinitcpio.d/linux-zen.preset: 'default'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux-zen -g /boot/initramfs-linux-zen.img --microcode /boot/amd-ucode.img
==> Starting build: '6.6.1-zen1-1-zen'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [autodetect]
  -> Running build hook: [keyboard]
==> WARNING: Possibly missing firmware for module: 'xhci_pci'
  -> Running build hook: [keymap]
  -> Running build hook: [modconf]
  -> Running build hook: [block]
  -> Running build hook: [filesystems]
  -> Running build hook: [fsck]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux-zen.img'
==> Image generation successful
==> Building image from preset: /etc/mkinitcpio.d/linux-zen.preset: 'fallback'
==> Using default configuration file: '/etc/mkinitcpio.conf'
  -> -k /boot/vmlinuz-linux-zen -g /boot/initramfs-linux-zen-fallback.img -S autodetect --microcode /boot/amd-ucode.img
==> Starting build: '6.6.1-zen1-1-zen'
  -> Running build hook: [base]
  -> Running build hook: [udev]
  -> Running build hook: [keyboard]
==> WARNING: Possibly missing firmware for module: 'xhci_pci'
  -> Running build hook: [keymap]
  -> Running build hook: [modconf]
  -> Running build hook: [block]
==> WARNING: Possibly missing firmware for module: 'qla1280'
==> WARNING: Possibly missing firmware for module: 'wd719x'
==> WARNING: Possibly missing firmware for module: 'qla2xxx'
==> WARNING: Possibly missing firmware for module: 'qed'
==> WARNING: Possibly missing firmware for module: 'aic94xx'
==> WARNING: Possibly missing firmware for module: 'bfa'
  -> Running build hook: [filesystems]
  -> Running build hook: [fsck]
==> Generating module dependencies
==> Creating zstd-compressed initcpio image: '/boot/initramfs-linux-zen-fallback.img'
==> Image generation successful
```

<p align="center">We must now reboot the system. Once you're back you can run the following command to check the loaded drivers/modules.</p>

```bash
lspci -k
```

<p align="center">Example Output:</p>

```
04:00.0 VGA compatible controller: NVIDIA Corporation GF100 [GeForce GTX 470] (rev a3)
        Subsystem: eVga.com. Corp. GF100 [GeForce GTX 470]
        Kernel driver in use: nouveau
        Kernel modules: nouveau
04:00.1 Audio device: NVIDIA Corporation GF100 High Definition Audio Controller (rev a1)
        Subsystem: eVga.com. Corp. GF100 High Definition Audio Controller
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
```

<p align="center">In this situation, the host has an AMD GPU and a secondary NVIDIA GPU. While blocking the nvidia module worked, it seems that the nouveau is still being used. The rest of this page will walk through the steps taken to fully hook this GPU.</p>

<p align="center">We'll begin by adding the <code>nouveau</code> to the block list.</p>

```bash
sudo nano /etc/modprobe.d/vfio.conf
```

<p align="center">Updated configuration:</p>

```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep nvidia pre: vfio-pci
softdep nouveau pre: vfio-pci
```

<p align="center">Rebuilt, and rebooted... and here is the output of <code>lspci -k</code> again:</p>

```bash
04:00.0 VGA compatible controller: NVIDIA Corporation GF100 [GeForce GTX 470] (rev a3)
        Subsystem: eVga.com. Corp. GF100 [GeForce GTX 470]
        Kernel driver in use: vfio-pci
        Kernel modules: nouveau
04:00.1 Audio device: NVIDIA Corporation GF100 High Definition Audio Controller (rev a1)
        Subsystem: eVga.com. Corp. GF100 High Definition Audio Controller
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
```

<p align="center">As you can see, our GPU is now hooked by <code>vfio-pci</code> successfully. You can also notice that unfortunately, the entire GPU is not acccessable because the Audio portion of the GPU is still in use by <code>snd_hda_intel</code>. Let's go ahead and add that to the block list.</p>

<p align="center">Updated configuration:</p>

```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep nvidia pre: vfio-pci
softdep nouveau pre: vfio-pci
softdep snd_hda_intel pre: vfio-pci
```

<p align="center">Rebuilt, and rebooted... and here is the output of <code>lspci -k</code> again:</p>

```bash
04:00.0 VGA compatible controller: NVIDIA Corporation GF100 [GeForce GTX 470] (rev a3)
        Subsystem: eVga.com. Corp. GF100 [GeForce GTX 470]
        Kernel driver in use: vfio-pci
        Kernel modules: nouveau
04:00.1 Audio device: NVIDIA Corporation GF100 High Definition Audio Controller (rev a1)
        Subsystem: eVga.com. Corp. GF100 High Definition Audio Controller
        Kernel driver in use: vfio-pci
        Kernel modules: snd_hda_intel
```

<p align="center">We've got it! Both GPU objects hooked and in use by <code>vfio-pci</code>. If you have more objects that are a part of your GPU such as <code>USB-C Controller</code>'s or others, be sure those are fully hooked as well.</p>

<p align="center">This concept applies to any device you would like to passthrough that is similar to GPUs and Wi-Fi PCIe cards if known problematic kernel modules hook it on Linux before giving it to guests. The purpose of doing this to a GPU is so that the GPU is never initialized by Linux, and is ready for OVMF to spin it up on its own.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-KernelParameters/index">&larr; Back Page</a>
    <a class="nav-button" href="../04-VirtManConf">Next Page &rarr;</a>
  </div>
  <br>
</h2>
