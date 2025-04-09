---
layout: default
title: Package Configuration
description: "Placeholder"
nav_order: 6
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
</style>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/HeaderPackageConfiguration.png">
</p>

<h3 align="center">This page will walk you through the configuration of libvirtd and QEMU. These are necessary changes to config files to properly use Virt-Manager via Root, as User.</h3>

<br>
<h2 align="center">1. Modifying Configuration Files</h2>

<p align="center">There are two files we must edit. Please make the changes accordingly. Not too much to say, follow this step-by-step and you'll be fine along with getting logs printed and saved in case issues occur.</p>

<hr>

### **libvirtd.conf**

Use your favorite text editor to make the following changes to:

```bash
/etc/libvirt/libvirtd.conf
```

{: .headsup }
> If your distribution uses AppArmor, or SELinux do not forget to change the following line to disable them for Libvirt. Mostly an issue on Debian based systems. Skip if you don't know. Come back later if some permission issues relating to security pop up, and apply the following change.
> 
> Disable Security Driver -> As a last resort, set driver to none
> 
> ```bash
> # security_driver = [ "selinux", "apparmor" ]
> security_driver = "none"
> ```

Read/Write permissions and Group -> Uncomment the following lines

```bash
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```

Enable libvirt Logging -> Add to the very bottom of libvirtd.conf

```bash
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```
<hr>

### **qemu.conf**

Use your favorite text editor to make the following changes to:

```bash
/etc/libvirt/qemu.conf
```

Read/Write permissions and Group -> Uncomment and Edit the following lines to your username

```bash
user = "root"
group = "root"
```

Example of properly updated section:

```bash
user = "royalgraphx"
group = "royalgraphx"
```

<hr>

<h2 align="center">2. Enable libvirtd Services</h2>

{: .warning }
Adding yourself to the libvirt group allows for password-less root both from the host and guest. If you are uncomfortable with that and want to avoid this, consider using [Polkit](https://wiki.archlinux.org/title/Polkit) instead which will prompt you for your password. **While this configuration is completely safe for our use case**, be aware of what you're doing when following guides online, and modifying system files.

<p align="center">You now need to add your user to the kvm and libvirt groups, to allow libvirt to write files properly.</p>

{: .warning }

```bash
sudo usermod -a -G kvm,libvirt $(whoami)
```

Now enable and restart the libvirtd Service to fully apply changes:

```bash
sudo systemctl enable libvirtd
sudo systemctl restart libvirtd
```

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../04-Package-Install/index">&larr; Back Page</a>
    <a class="nav-button" href="../06-Networking-Configuration">Next Page &rarr;</a>
  </div>
  <br>
</h2>
