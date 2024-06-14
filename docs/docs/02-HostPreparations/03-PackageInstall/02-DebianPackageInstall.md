---
layout: default
title: Debian Based
parent: Package Installation
grand_parent: Host Preparations
nav_order: 2
---

# Debian based Package Installation
#### Package requirements for base DKVM.

{: .note }
While Debian based distributions do run QEMU/KVM, they are for the most part not up to date in comparison to Arch based distributions. You can manually build the latest QEMU and its depends for your Debian based distro, or continue with whatever version is installed by the following command. Issues regarding the QEMU distributed on Ubuntu/Linux Mint, are not priority.

```bash
sudo apt install qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system libvirt-daemon-config-network bridge-utils virt-manager ovmf dosfstools
```

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.

<hr>

{: .new }

If you're interested in working with Mac OS releases prior to Catalina, make sure you install the following package for DarwinUDK UEFI Firmware support in Virt-Manager.

To get started, cd to the ``DarwinUDK`` folder.

```bash
cd DarwinUDK/Debian
```

You'll now be able to use apt to install the DUDK-Firmware package.

```bash
sudo dpkg -i DUDK-Firmware-1.0.0-1-x86_64.deb
```

You'll now be able to successfully import DarwinLegacyKVM.xml and use DUDK-Firmware!

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.
