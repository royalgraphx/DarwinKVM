---
layout: default
title: ACPI
description: "Placeholder"
parent: MacPro5,1
grand_parent: OpenCore Configurations
nav_order: 2
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
  <img width="650" height="200" src="../../../../assets/Headers/Header-ACPI.png">
</p>

<a href=""><img src="../../../../assets/OpenCore/OpenCoreACPIAdd.png" alt=""></a>

## Add

This section of the config is meant to expose the various ACPI in your OC folder. This along with many of the other sections will be auto-filled by simply going to ``File -> OC Clean Snapshot`` and going to the OC folder in your OpenCore.img mount point.

## Delete

This blocks certain ACPI tables from loading, for us, we can ignore this.

## Patch

This section allows us to dynamically modify parts of the ACPI (DSDT, SSDT, etc.) via OpenCore. For us, our patches are handled by our SSDTs. This is a much cleaner solution as this will allow us to boot Windows and other OSes with OpenCore for dual or multi-boot configurations.

## Quirks

For settings relating to ACPI, leave everything here as default as we have no use for these quirks.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../00-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../02-Booter">Next Page &rarr;</a>
  </div>
  <br>
</h2>
