---
layout: default
title: Package Configuration
parent: Host Preparations
nav_order: 4
---

# Package Configuration
#### Necessary changes to config files to use Virt-Manager via User.

{: .warning }
Adding yourself to the libvirt group allows for password-less root both from the host and guest. If you are uncomfortable with that and want to avoid this, consider using [Polkit](https://wiki.archlinux.org/title/Polkit) instead which will prompt you for your password. While this is safe for our use case, be aware of what you're doing when following guides online.

## Modifying Files

There are two files we must edit. Please make the changes accordingly. Not too much to say, follow this step-by-step and you'll be fine along with getting logs printed.

### libvirtd.conf

Use your favorite text editor to make the following changes to:

```bash
/etc/libvirt/libvirtd.conf
```

``Read/Write permissions and Group - Uncomment the following lines.``

```bash
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```

``Logging - Add to the very bottom.``

```bash
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```

### qemu.conf

Use your favorite text editor to make the following changes:

```bash
/etc/libvirt/qemu.conf
```

``Read/Write permissions and Group - Uncomment and Edit the following lines to your username.``

```bash
user = "root"
group = "root"
```

Example properly modified snippet:

```bash
user = "royalgraphx"
group = "royalgraphx"
```

## Libvirtd Services

You now need to add your user to the kvm and libvirt groups, to allow libvirt to write files properly:

```bash
sudo usermod -a -G kvm,libvirt $(whoami)
```

Now enable and start the libvirtd Service to fully apply changes:

```bash
sudo systemctl enable --now libvirtd
```

## You can now continue to the next <a href="05-Networking.html">page</a>.
