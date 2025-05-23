---
layout: default
title: Create and Management
parent: Using Terminal
grand_parent: Disk Image Creation
description: "This page goes over the required packages for managing disk images via Terminal manually."
nav_order: 2
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-VDISK-CreateManage.png">
</p>

<p align="center">We'll start off by using QEMU's <code>qemu-img</code> binary tool to create a new blank raw disk image. The reason for the decision of RAW, rather than QCOW2, is that Copy-On-Write has a lot of latency, and if you know you're going to use 128GB of storage, there is no reason to not simply allocate it all at once, and provide VirtIO FS with a much better read/write experience.</p>

```bash
qemu-img create -f raw OpenCore.img 2G
```
<p align="center"><i>Where, <code>OpenCore</code> can be replaced with any name and <code>2G</code> is the intended size for your OpenCore disk image.</i></p>

<p align="center">Now that the disk image exists, we'll want to format it as FAT32 directly from our host. To do so, we'll need to mount this disk image. This requires the usage of QEMU's <code>NBD</code> module that allows assigning disk images to virtual slots on the host via virtual nbd# devices. Start by ensuring that nbd is running. This will require modprobe or similar.</p>

```bash
sudo modprobe nbd max_part=8
```

<p align="center">Then go ahead and mount the created disk image.</p>

```bash
sudo qemu-nbd --connect=/dev/nbd0 -f raw OpenCore.img
```

<p align="center"><i>If you have issues with NBD0, move onto NBD1, up until 8.</i></p>

<p align="center">You can ensure the mount was successful by checking if nbd# was created and has the appropriate disk size reporting back.</p>

```bash
lsblk -o NAME | grep "^nbd[0-9]\+$"
```

<p align="center">You'll now want to format said disk image as FAT32 if you intend this to be for OpenCore, for other disk images you can skip the formatting and mounting entirely! Simply add to the guest and use as you please.</p>

```bash
sudo mkfs.fat -F 32 -n "OPENCORE" -I /dev/nbd0
```

<p align="center"><i>Where, <code>OPENCORE</code> can be replaced with any 8 character string. Adjust NBD# as needed.</i></p>

<p align="center">As of right now, your disk image has now been formatted and is now FAT32. To continue, you'll want to presumably mount it, and edit its contents, i.e installing and configuring the OpenCore bootloader itself. To do this, you'll want to start off by creating a new directory, named <code>mnt</code> which will be used to view the contents of the disk image once mounted.</p>

```bash
mkdir mnt
```

<p align="center">Ensure you mount the disk image to the <code>mnt</code> folder with the appropriate permissions so that you actually have read/write access to its contents.</p>

```bash
sudo mount -o uid=$(id -u),gid=$(id -g) /dev/nbd0 mnt
```

<p align="center"><i>Adjust NBD# as needed.</i></p>

<hr>
<p align="center">Later on when required to unmount, you can follow the instructions below to safely eject the disk image.</p>

```bash
sudo umount mnt
sudo qemu-nbd --disconnect /dev/nbd0
rm -rf mnt
```

<p align="center"><i>Adjust NBD# as needed.</i></p>
<hr>


<p align="center">You can now continue and populate the contents of this newly created disk image.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-PackageInstallation">&larr; Back Page</a>
    <a class="nav-button" href="../../../03-ImageContents/index">Next Page &rarr;</a>
  </div>
  <br>
</h2>
