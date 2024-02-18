---
layout: default
title: Networking
parent: Host Preparations
nav_order: 5
---

# Networking in a Virtual Machine
#### Using libvirtd's default NAT Virtio NIC for your DKVM to get Internet Access.

## Libvirtd's Default Virtual Network

Simply put, we can use the default NAT type NIC that Virt-Manager and libvirtd provide to get quick and fast Internet Access in the Virtual Machine, which we need for Recovery to download macOS. To get started you can use your existing terminal window, or open a new one and type in the following commands to enable it on boot, and enabling it for use now.

{: .note }
This will make your virsh virtual network automatically start when you start up your computer.

```
sudo virsh net-autostart default
```

{: .important }
If you prefer not to have the virtual machine network start up automatically on boot, you have to run the following command before booting your VM, after each reboot of your host.

```
sudo virsh net-start default
```

## You can now continue to the next <a href="06-IOMMU.html">page</a>.
#### More advanced networking is explained below if you need it.

## Bridged Networking using systemd

If you are looking for more advanced Virtual Machine networking, such as to achieve broader network access and get a local IP (libvirt example: 10.0.0.2, Bridged example: 192.168.0.23), faster speeds and more stable performance, it is highly recommended you check out the <a href="../../writeups/06-Bridge/index/">Bridge Networking</a> write-up for instructions. <span style="color: #ffab52;">For now though, we highly recommend you use the default network as mentioned above so that you can do the initial macOS installation and reach your desktop first</span>.

## Host Ethernet/Wi-Fi/Bluetooth Card Passthrough

If you're interested in not emulating or virtualizing a NIC but instead want to use a real NIC in your DarwinKVM such as one you purchased, a proper PCIe NIC, or the one on your motherboard, you will first need to make sure that your hardware is supported in macOS. For more information about Wi-fi cards please refer to this <a href="../../infocenter/03-WifiSupport/index">page</a>. For more information about Bluetooth cards please refer to this <a href="../../infocenter/04-BTSupport/index">page</a>. <span style="color: #ffab52;">For now, we highly recommend you use a virtual NIC as mentioned above so that you can do the initial macOS installation and reach your desktop first</span>.

