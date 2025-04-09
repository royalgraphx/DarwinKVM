---
layout: default
title: Networking Configuration
description: "Placeholder"
nav_order: 7
has_children: false
has_toc: false
---

<style>
  .navigation-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }
  
  .nav-button {
    margin: 10px;
  }

  .top-button {
    margin: 10px;
    align: center;
  }

</style>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/HeaderNetworkingConfiguration.png">
</p>

<h3 align="center">This page will walk you through using libvirtd's default NAT VirtIO NIC for your first DKVM experience. On future attempts or later configuration as required, you can use more advanced networking setups like Bridged interfaces or Passthrough.</h3>

<br>
<h2 align="center">1. libvirtd's Default Virtual Network</h2>

<p align="center">Simply put, we can use the default NAT type NIC that Virt-Manager and libvirtd provide to get quick and fast Internet Access in the Virtual Machine, which we need for recoveryOS to download the full macOS itself. To get started you can use your existing terminal window, or open a new one and type in the following commands to enable it on boot, or enabling it for use now.</p>

{: .note }
This will make your virsh virtual network automatically start when you start up your computer.

```bash
sudo virsh net-autostart default
```

{: .important }
If you prefer not to have the virtual machine network start up automatically on boot, you have to run the following command before booting your VM, after each reboot of your host.

```bash
sudo virsh net-start default
```

<p align="center">Once that's complete, you can go on.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../05-Package-Configuration">&larr; Back Page</a>
    <a class="nav-button" href="../07-IOMMU-Viability">Next Page &rarr;</a>
  </div>
  <br>
</h2>

<hr>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/HeaderAdvancedNetworking.png">
</p>

{: .warning }
We highly recommend you use the default network provided by libvirtd as mentioned above so that you can do the initial OS X / macOS installation and reach the desktop first! When it comes to setting up bridges or passing through physical hardware, it requires a more complex knowledge of configuring DKVM at such initial and early stages. You can return later as needed.

<h2 align="center">2. Bridged Networking using systemd-networkd</h2>

<p align="center">If you are looking for more advanced Virtual Machine networking, such as to achieve broader network access and get a local IP (libvirtd example: 10.0.0.2, Bridged example: 192.168.0.23), faster speeds and more stable performance, it is highly recommended you check out the <a href="../../writeups/06-Bridge/index/">Bridged Networking</a> write-up for instructions. This is typically done to make the guest machine appear as a physical machine on the local network for access from other machines at home, or in the office.</p>

<h2 align="center">3. Host Ethernet/Wi-Fi/Bluetooth Card Passthrough</h2>

<p align="center">If you're interested in not emulating or virtualizing a NIC with QEMU but instead want to use a real NIC in your DarwinKVM (such as one you purchased), or the one on your motherboard, you will first need to make sure that your hardware is supported in the target OS X / macOS. For more information about Wi-fi cards please refer to this <a href="https://docs.carnations.dev/hardware/04-CompatibilityCharts/04-Networking/01-Wireless/">page</a> from the Carnations Core Configuration Docs for baremetal machines for support within the OS. For more information about Bluetooth cards please refer to this <a href="">page</a> again, from CCD to ensure the hardware works in any OS X / macOS release prior to usage.</p>

<h2 align="center">
  <br>
  <div>
    <a class="top-button" href="#">&uarr; Go to Top &uarr;</a>
  </div>
  <br>
</h2>
