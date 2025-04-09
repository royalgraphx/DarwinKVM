---
layout: default
title: Hook Modification
parent: Single GPU Passthrough
grand_parent: GPU Passthrough
nav_order: 2
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
<h2 align="center"><b>Hook Modification</b></h2>
<br>

{: .new }
The DarwinKVM Main Menu now has a quick edit option! This page will be changed sometime soon.

<p align="center">Modify the following file to add <code>$OBJECT == "DarwinKVM-MP##"</code> to the if statement.</p>

<p align="center">This will allow the hook to now pay attention to the DarwinKVM Virtual Machine. If for any reason you need to use the Virtual Machine without GPU passthrough, you should remove this modification to allow proper usage of the VirtIO Display when not doing passthrough willingly or for debugging reasons. You can also duplicate the VM definition and add <code>-NoGPU</code> to avoid automatic hooking.</p>

```bash
sudo nano /etc/libvirt/hooks/qemu
```

<p align="center">Example modified file:</p>

<p align="center"><a href=""><img src="../../../../assets/risingprism/QEMUHookModification.png" alt=""></a></p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-Installation">&larr; Back Page</a>
    <a class="nav-button" href="../03-VirtManConf">Next Page &rarr;</a>
  </div>
  <br>
</h2>
