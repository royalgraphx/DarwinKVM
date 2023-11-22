---
layout: default
title: Part 1 - Overview
parent: Bridge Networking
nav_order: 1
---

# Overview to Bridge Networking
#### Explaining the basics and needs of a bridge.

To understand the point of a network bridge, you'll need to know that when you use QEMU or Virt-Manager to start a Virtual Machine with networking, you will typically be using the default network provided by libvirt. This creates its own DHCP server, meaning that our Machines are created with IP addresses such that, we see "192.168.68.2" or something along those lines, which does not match up with our local IPs on our broader network. The point of setting this Bridge interface up is to strip our ethernet controller of an assigned IP address and stop any other Network Managers that may be present on the users' system so that we can leverage systemd-networkd to automate the bridge creation. What it simply does, is create a new interface named "br0". It then modifies the users' current ethernet interface to "master br0", meaning that br0 is now providing the information to the users' physical ethernet interface. We then give br0 an IP address via DHCP using ipv4. When we use Virt-Manager in this configuration, we can use a bridge interface, we set it to ``br0`` and the result is our Virtual Machines now appear on the broader network as physical, real devices. Allowing SSH via and to any other devices on the LAN.

<p align="center">
  <img src="../../../assets/BridgeNetworkingRouterDash.png">
</p>

#### Here you can see my Hypervisor and RPI4, with the DarwinKVM appearing as a physical device on the network! This is technically impossible as this router only has two ethernet ports, its nice to see that the UI doesn't just die lol.

## You can now continue to the next <a href="../02-DisablingNetworkManager">page</a>.
