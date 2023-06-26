---
layout: default
title: Part 5. Libvirtd Configuration
parent: Host Preparations
nav_order: 5
---

# Libvirtd Configuration
#### Necessary changes to use Virt-Manager via User.
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

{: .warning }
Adding yourself to the libvirt group allows for password-less root both from the host and guest. If you are uncomfortable with that and want to avoid this, consider using [Polkit](https://wiki.archlinux.org/title/Polkit) instead which will prompt you for your password. While this is safe for our use case, be aware of what you're doing when following guides online.

## Modifying Files

There are two files we must edit. Please make the changes accordingly. Not too much to say, follow this step-by-step and you'll be fine along with getting logs printed.

### libvirtd.conf

Use your favorite text editor to make the following changes to:
```
/etc/libvirt/libvirtd.conf
```

``Read/Write permissions and Group - Uncomment the following lines.``

```
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```

``Logging - Add to the very bottom.``

```
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```

### qemu.conf

Use your favorite text editor to make the following changes:
```
/etc/libvirt/qemu.conf
```

``Read/Write permissions and Group - Uncomment and Edit the following lines to your username.``

```
user = "root"
group = "root"
```

Example properly modified snippet:

```
user = "royalgraphx"
group = "royalgraphx"
```

## Libvirtd Services

You now need to add your user to the kvm and libvirt groups, to allow libvirt to write files properly:

```
sudo usermod -a -G kvm,libvirt $(whoami)
```

Now enable and start the libvirtd Service to fully apply changes:

```
sudo systemctl enable --start libvirtd
```

{: .important }
If you did not set up the bridge interface and will be using Virt-Managers default NIC, you will also set the virtual networks to auto-start on boot: ```sudo virsh net-autostart default```. Skip this if you did set up the br0 interface.

## You can now continue to the next <a href="../03-GatheringFiles/">page</a>.