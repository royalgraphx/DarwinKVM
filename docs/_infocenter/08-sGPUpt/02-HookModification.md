---
layout: default
title: Hook Modification
parent: Single GPU Passthrough
nav_order: 2
---

# Hook Modification
#### Use your favorite terminal text editor!

Modify the following file to add `` $OBJECT == "DarwinKVM" `` to the if statement. This will allow the hook to now pay attention to the DarwinKVM Virtual Machine. If for any reason you need to use the Virtual Machine without GPU passthrough, you should remove this modification to allow proper usage of the VirtIO Display when not doing passthrough willingly or for debugging reasons.

```
sudo nano /etc/libvirt/hooks/qemu
```

Example modified file:

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/QEMUHookModification.png"><img src="../../../assets/QEMUHookModification.png" alt=""></a>

## You can now continue to the next <a href="../03-VManUpdate">page</a>.
