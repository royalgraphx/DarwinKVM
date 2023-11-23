---
layout: default
title: Part 3. Package Installation
parent: Host Preparations
nav_order: 3
---

# Package Installation
#### Package requirements for base DKVM.
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

Since everything in this guide is outlined for simply Arch, you may need to find the package equivalent to your system. Here is the command to install all required packages.

```bash
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf
```

Please note: Conflicts may happen when installing these programs.
A warning like the below example may appear in your terminal:

```bash
iptables and iptables-nft are in conflict. Remove iptables? [y/N]
```

If you do encounter this kind of message, press y and enter to continue the installation.

## You can now continue to the next <a href="04-Networking.html">page</a>.
