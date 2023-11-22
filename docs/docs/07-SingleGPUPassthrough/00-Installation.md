---
layout: default
title: Part 0 - Script Installation
parent: Single GPU Passthrough
nav_order: 1
---

# Installation of Scripts
#### Script Installation thanks to RisingPrism!

{: .important }
If the <a href="">RisingPrism</a> scripts do not work, **or if you have an AMD card with the reset bug**, use the <a href="https://gitlab.com/akshaycodes/vfio-script">akshaycodes</a> scripts instead.

All AMD GPUs but the rDNA 2-based ones have the reset but.

We'll start by doing a ``git clone`` command to fetch the scripts.

``git clone https://gitlab.com/risingprismtv/single-gpu-passthrough.git``

In the newly created single-gpu-passthrough folder, run the installation as root:

``sudo chmod +x install_hooks.sh``

``sudo ./install_hooks.sh``

Verify that the files are installed correctly. You should have files in the following location:

```
/etc/systemd/system/libvirt-nosleep@.service
/bin/vfio-startup.sh
/bin/vfio-teardown.sh
/etc/libvirt/hooks/qemu
```

Because we previously set logs to output, you can find them here:

```
DarwinKVM.log    => /var/log/libvirt/qemu
custom_hooks.log => /var/log/libvirt/
libvirtd.log     => /var/log/libvirt/
```

But if the RisingPrism scripts aren't working well for you and you end up using akshaycodes, you can find the logs at:

```
custom_hooks.log => /var/tmp/vfio-script.log
```

## You can now continue to the next <a href="02-HookModification.html">page</a>.
