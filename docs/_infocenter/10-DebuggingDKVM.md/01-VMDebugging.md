---
layout: default
title: VM Debugging
parent: Debugging DKVM
nav_order: 1
---

# How to debug the Virtual Machine
#### Issues related to VM and Virt-Manager.

This page describes how to collect several pieces of information and logs so that you can send them for review by helpers on Discord, as well as providing you logs to check to help you debug an issue manually.

Because we previously set logs to output, you can find them here:

```
DarwinKVM.log    => /var/log/libvirt/qemu
custom_hooks.log => /var/log/libvirt/
libvirtd.log     => /var/log/libvirt/
```

## DarwinKVM.log

```bash
2024-02-12 19:23:20.708+0000: starting up libvirt version: 10.0.0, qemu version: 8.2.0, kernel: 6.7.3-zen1-2-zen, hostname: hypervisor
LC_ALL=C \
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin \
USER=root \
HOME=/var/lib/libvirt/qemu/domain-1-DarwinKVM \
XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-1-DarwinKVM/.local/share \
XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-1-DarwinKVM/.cache \
XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-1-DarwinKVM/.config \
/usr/bin/qemu-system-x86_64 \
-name guest=DarwinKVM,debug-threads=on \
-S \
-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-DarwinKVM/master-key.aes"}' \
-blockdev '{"driver":"file","filename":"/usr/share/edk2/x64/OVMF_CODE.fd","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver":"raw","file":"libvirt-pflash0-storage"}' \
...
warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 6]
warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 7]
```

## libvirtd.log

```bash
2024-02-12 19:22:31.213+0000: 560: info : libvirt version: 10.0.0
2024-02-12 19:22:31.213+0000: 560: info : hostname: hypervisor
2024-02-12 19:22:57.795+0000: 539: error : virNetSocketReadWire:1781 : End of file while reading data: Input/output error
2024-02-12 19:23:20.708+0000: 544: warning : qemuDomainObjTaintMsg:6945 : Domain id=1 name='DarwinKVM' uuid=8e9df01d-3c4e-4326-9f22-074e330e6ab6 is tainted: custom-argv
```

## custom_hooks.log

```
No Example information. Usually only has information when a failure occurs.
```

## DarwinKVM.xml

Another form of helpful information would be to dump your DarwinKVM XML in its current state, so that it's easy for others to know what hardware is in use by the virtual machine.

```bash
sudo virsh dumpxml DarwinKVM
```

Example Output:

```xml
<domain type='kvm' id='1' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
  <name>DarwinKVM</name>
  <uuid>8e9df01d-3c4e-4326-9f22-074e330e6ab6</uuid>
  <memory unit='KiB'>50781184</memory>
  <currentMemory unit='KiB'>50781184</currentMemory>
  <memoryBacking>
    <nosharepages/>
  </memoryBacking>
...
    <qemu:arg value='-cpu'/>
    <qemu:arg value='Cascadelake-Server,vendor=GenuineIntel'/>
  </qemu:commandline>
</domain>
```

### Thanks for reading!
