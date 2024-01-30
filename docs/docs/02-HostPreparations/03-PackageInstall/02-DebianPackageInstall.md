---
layout: default
title: Debian Based
parent: Package Installation
grand_parent: Host Preparations
nav_order: 2
---

# Debian based Package Installation
#### Package requirements for base DKVM.
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

{: .note }
While Debian based distributions do run QEMU/KVM, they are for the most part not up to date in comparison to Arch based distributions. You can manually build the latest QEMU and its depends for your Debian based distro, or continue with whatever version is installed by the following command. Issues regarding the QEMU distributed on Ubuntu/Linux Mint, are not priority.

```bash
sudo apt install qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system libvirt-daemon-config-network bridge-utils virt-manager ovmf dosfstools
```

## You can now continue to the next <a href="../04-Networking.html">page</a>.
