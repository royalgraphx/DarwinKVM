---
layout: default
title: Fedora Based
parent: Package Installation
grand_parent: Host Preparations
nav_order: 1
---

# Fedora based Package Installation
#### Package requirements for base DKVM.

```bash
sudo dnf install qemu-system-x86 libvirt libvirt-daemon-config-network bridge-utils virt-manager dosfstools
```

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.

<hr>

{: .new }

If you're interested in working with Mac OS releases prior to Catalina, make sure you install the following package for DarwinUDK UEFI Firmware support in Virt-Manager.

To get started, cd to the ``DarwinUDK`` folder.

```bash
cd DarwinUDK/Fedora
```

You'll now be able to use pacman to install the DUDK-Firmware package.

```bash
sudo rpm -i DUDK-Firmware-1.0.0-2.fedora.rpm
```

You'll now be able to successfully import DarwinLegacyKVM.xml and use DUDK-Firmware!

## You can now continue to the next <a href="../04-PkgConf.html">page</a>.
