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
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf qemu-utils dosfstools
```

Please note: Conflicts may happen when installing these programs.
A warning like the below example may appear in your terminal:

```bash
iptables and iptables-nft are in conflict. Remove iptables? [y/N]
```

If you do encounter this kind of message, press y and enter to continue the installation.

## You can now continue to the next <a href="../04-Networking.html">page</a>.
