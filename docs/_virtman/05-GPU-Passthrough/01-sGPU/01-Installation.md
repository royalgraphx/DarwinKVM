---
layout: default
title: Script Installation
parent: Single GPU Passthrough
grand_parent: GPU Passthrough
nav_order: 1
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
</style>

<br>
<h2 align="center"><b>Installation of Scripts</b></h2>
<br>

{: .important }
If the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a> scripts do not work, **or if you have an AMD card with the reset bug**, use the <a href="https://gitlab.com/akshaycodes/vfio-script">akshaycodes</a> scripts instead.

{: .headsup }
All AMD GPUs but the rDNA 2-based ones (6000 Series) have the reset bug. AK's scripts workaround it by sleeping and waking the system when stopping and starting the VM, if you want to avoid this, you can try using the usual RisingPrism scripts with [RadeonResetBugFix](https://github.com/inga-lovinde/RadeonResetBugFix) or [VendorReset](https://github.com/gnif/vendor-reset).

{: .new }
The DarwinKVM Main Menu now has automatic options for installing either of the above mentioned scripts! Give them a shot today! This page will be changed sometime soon.

<p align="center">We'll start by doing a <code>git clone</code> command to fetch the scripts.</p>

```bash
git clone https://gitlab.com/risingprismtv/single-gpu-passthrough.git
```

<p align="center">In the newly created single-gpu-passthrough folder, run the installation as root:</p>

```bash
sudo chmod +x install_hooks.sh
sudo ./install_hooks.sh
```

<p align="center">Verify that the files are installed correctly. You should have files in the following location:</p>

```
/etc/systemd/system/libvirt-nosleep@.service
/usr/local/bin/vfio-startup
/usr/local/bin/vfio-teardown
/etc/libvirt/hooks/qemu
```

<p align="center">Because we previously set logs to output, you can find them here:</p>

```
DarwinKVM.log    => /var/log/libvirt/qemu
custom_hooks.log => /var/log/libvirt/
libvirtd.log     => /var/log/libvirt/
```

<p align="center">But if the RisingPrism scripts aren't working well for you and you end up using akshaycodes, you can find the logs at:</p>

```
custom_hooks.log => /var/tmp/vfio-script.log
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-HookModification">Next Page &rarr;</a>
  </div>
  <br>
</h2>
