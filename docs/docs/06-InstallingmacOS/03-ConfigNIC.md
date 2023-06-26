---
layout: default
title: Part 3 - Configure NIC for Virtual Machine
parent: Installing macOS
nav_order: 4
---

# Configure Virtual Machine NIC
#### This is required to download macOS via RecoveryOS, as well as will be the general ethernet connection in the Virtual Machine.

## Using the Bridge Interface

Select the "Add Hardware" button and choose the Network category on the left-hand side. You can now see your network source can be set to Bridge device. The device name given by the script is ``br0``. Of course don't forget to set the Device model as ``VirtIO``.

<p align="center">
  <img src="../../assets/VManAddBridgeNIC.png">
</p>

## Using the Default Network

If you didn't choose to set up a Bridge Interface, you can still use the regular NAT type default network created by libvirt in your Virtual Machine! Follow the same steps but select the defaults.

## You can now continue to the next <a href="04-Review.html">page</a>.