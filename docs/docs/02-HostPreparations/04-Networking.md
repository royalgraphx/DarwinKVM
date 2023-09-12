---
layout: default
title: Part 4. Default Network
parent: Host Preparations
nav_order: 4
---

# Default Network
#### Using libvirtd's default NAT Virtio NIC for your DKVM.
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

## Overview

Simply put, we can use the default NAT type NIC that Virt-Manager and libvirtd provide. To get started you can use your existing terminal window, or open a new one and type in the following commands to enable it on boot, and enabling it for use now.

{: .important }
This will make your virsh internal network automatically start when you start up your computer.

```
sudo virsh net-autostart default
```

{: .important }
If you prefer not to have the virtual machine network start up automatically on boot, you have to run the following command before booting your VM, after each reboot of your host.

```
sudo virsh net-start default
```

## Advanced Bridged Networking

If you are looking for more advanced Virtual Machine networking, such as to achieve broader network access, faster speeds and more stable performance, it is highly recommended you check out the <a href="../../writeups/05-Bridge/index/">Bridge Networking</a> write-up for more information and tutorial for set up! I understand many may not want to, or simply cannot because they're not on ethernet so I include the original default network instructions, but I personally do this every time I set up Linux.

## You can now continue to the next <a href="05-Libvirtd.html">page</a>.