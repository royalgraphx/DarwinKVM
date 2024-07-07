---
layout: default
title: Configuring modprobe
parent: Dual GPU Passthrough
nav_order: 3
---

# Configuring modprobe
#### Helps vfio-pci hook objects and block modules.

We'll begin by creating a configuration file in the modprobe.d folder.

Start by using your favorite terminal text editor. In this example, we'll be using nano.

```bash
sudo nano /etc/modprobe.d/vfio.conf
```

In this new file, you can begin to build your custom vfio configuration. For starters, let's simply add the secondary GPU and block the nvidia module and preload vfio-pci instead.

```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep amdgpu pre: vfio-pci
```

To apply these changes, we'll need to use ``mkinitcpio`` to rebuild the initial ramdisk environment.

```bash
sudo mkinitcpio --all
```

Most warnings are okay! Example output:

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

We must now reboot the system. Once you're back you can run the following command to check the loaded drivers/modules.

```bash
lspci -k
```

Example Output:

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

In this situation, the host has an AMD GPU and a secondary NVIDIA GPU. While blocking the nvidia module worked, it seems that the nouveau is still being used. The rest of this page will walk through the steps taken to fully hook this GPU.

We'll begin by adding the ``nouveau`` to the block list.

```bash
sudo nano /etc/modprobe.d/vfio.conf
```

Updated configuration:
```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep nvidia pre: vfio-pci
softdep nouveau pre: vfio-pci
```

Rebuilt, and rebooted... and here is the output of ``lspci -k`` again:

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

As you can see, our GPU is now hooked by ``vfio-pci`` successfully. You can also notice that unfortunately, the entire GPU is not acccessable because the Audio portion of the GPU is still in use by ``snd_hda_intel``. Let's go ahead and add that to the block list.

Updated configuration:
```bash
options vfio-pci ids=10de:06cd,10de:0be5
softdep nvidia pre: vfio-pci
softdep nouveau pre: vfio-pci
softdep snd_hda_intel pre: vfio-pci
```

Rebuilt, and rebooted... and here is the output of ``lspci -k`` again:

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

We've got it! Both GPU objects hooked and in use by ``vfio-pci``. If you have more objects that are a part of your GPU such as ``USB-C Controller``'s or others, be sure those are fully hooked as well.

## You can now continue to the next <a href="../04-VirtManConf">page</a>.
