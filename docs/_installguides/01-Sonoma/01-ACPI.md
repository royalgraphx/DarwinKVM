---
layout: default
title: ACPI
parent: Sonoma
nav_order: 2
---

# ACPI

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OpenCoreACPIAdd.png"><img src="../../../assets/OpenCoreACPIAdd.png" alt=""></a>

## Add

This section of the config is meant to expose the various ACPI in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## Delete

This blocks certain ACPI tables from loading, for us, we can ignore this.

## Patch

This section allows us to dynamically modify parts of the ACPI (DSDT, SSDT, etc.) via OpenCore. For us, our patches are handled by our SSDTs. This is a much cleaner solution as this will allow us to boot Windows and other OSes with OpenCore for dual or multi-boot configurations.

## Quirks

For settings relating to ACPI, leave everything here as default as we have no use for these quirks.

## You can now continue to the next <a href="../02-Booter">page</a>.
