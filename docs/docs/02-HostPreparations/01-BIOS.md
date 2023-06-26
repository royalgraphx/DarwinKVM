---
layout: default
title: Part 1. BIOS Settings
parent: Host Preparations
nav_order: 1
---

# BIOS Settings
#### Will depend on your Host Hardware.
#### This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/1)-Preparations">Preparations</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.

Depending on your machine's CPU, you need to enable certain settings in your BIOS for your passthrough to succeed. Enable the settings listed in this table:

| AMD  | Intel |
| ---- | ----- |
| IOMMU | VT-d |
| NX Mode | XD (eXecute Disable) Bit |
| SVM Mode | VT-x |

If you do not have any virtualization settings, chances are they're already enabled, but double-check that your BIOS is up to date and that your CPU and motherboard support virtualization.

## You can now continue to the next <a href="02-GRUB.html">page</a>.