---
layout: default
title: Editing config files
parent: KB/M sharing with Evdev
nav_order: 2
---

## Editing Config Files

Use your favorite text editor to make the following changes to:

```bash
/etc/libvirt/qemu.conf
```

``Security - uncomment the following line of code and change the value:``
```bash
security_default_confined = 0
```

``Add these lines to the bottom of the file:``
```bash
cgroup_device_acl = [
    "/dev/null", "/dev/full", "/dev/zero",
    "/dev/random", "/dev/urandom",
    "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
    "/dev/rtc", "/dev/hpet", "/dev/vfio/vfio",
    # Your devices go here
]

clear_emulator_capabilities = 0
```

**Inside ``cgroup_device_acl``**, add the paths to your keyboard and mouse.

#### Sample configuration:

```bash
cgroup_device_acl = [
	"/dev/null", "/dev/full", "/dev/zero",
	"/dev/random", "/dev/urandom",
	"/dev/ptmx", "/dev/kvm", "/dev/kqemu",
	"/dev/rtc","/dev/hpet", "/dev/vfio/vfio",
    # Your devices go here
	"/dev/input/by-id/usb-30fa_USB_Optical_Mouse-event-mouse",
	"/dev/input/by-id/usb-EVGA_Z12_Gaming_Keyboard-event-kbd",
]

clear_emulator_capabilities = 0
```

Save the file, then restart the libvirtd service.
```bash
systemctl restart libvirtd
```

## You can now continue to the next <a href="../03-XML">page</a>.
