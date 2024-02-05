---
layout: default
title: BIOS Settings
parent: Host Preparations
nav_order: 1
---

# BIOS Settings
#### Will depend on your Host Hardware.

Depending on your machine's CPU, you need to enable certain settings in your BIOS for virtualization to succeed. Enable the settings listed in this table as needed:

| AMD | Intel |
| ---- | ---- |
| IOMMU | VT-d |
| NX Mode | XD (eXecute Disable) Bit |
| SVM Mode | VT-x |

If you do not have any virtualization settings, chances are they're already enabled, but double-check that your BIOS is up to date and that your CPU and motherboard support virtualization.

You will now have to disable the following settings from your BIOS:

| Setting | Note |
| ---- | ---- |
| Above 4G Decoding | Does not work within macOS |
| Resizable BAR | Does not work within macOS |
| Smart Access Memory (SAM/CAM) | Can possibly be called this on Intel systems | 

There are currently workarounds possible to set the BAR size back to the default 256MB even with A4GD and RB enabled, but at the moment no write-up has been complete for it. For now, it's recommended to disable such BIOS settings, if you cannot manually set your BAR sizes without a guide (here, currently).

When you've rebooted and returned back to your terminal, you can issue the following command to check if Virtualization is enabled and supported on your system:

```bash
lscpu | grep Virtualization
```

Example Output:

```bash
Virtualization: AMD-V
```

<h2 align="center">You can now proceed to the <a href="02-KernelParameters">Kernel Parameters</a> section!</h2>
