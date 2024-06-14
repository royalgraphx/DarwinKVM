---
layout: default
title: Arch Based
parent: Package Installation
grand_parent: Host Preparations
nav_order: 1
---

# Arch based Package Installation
#### Package requirements for base DKVM.

```bash
sudo pacman -S git base-devel python-click python-tqdm virt-manager qemu-full vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf qemu-tools dosfstools tk
```

Please note: Conflicts may happen when installing these programs.
A warning like the below example may appear in your terminal:

```bash
iptables and iptables-nft are in conflict. Remove iptables? [y/N]
```

If you do encounter this kind of message, press y and enter to continue the installation.

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.

<hr>

{: .new }

If you're interested in working with Mac OS releases prior to Catalina, make sure you install the following package for DarwinUDK UEFI Firmware support in Virt-Manager.

To get started, cd to the ``DarwinUDK`` folder.

```bash
cd DarwinUDK/Arch
```

You'll now be able to use pacman to install the DUDK-Firmware package.

```bash
sudo pacman -U DUDK-Firmware-1.0.0-1-x86_64.pkg.tar.zst
```

You'll now be able to successfully import DarwinLegacyKVM.xml and use DUDK-Firmware!

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.
