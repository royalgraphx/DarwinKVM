---
layout: default
title: Custom Memory Mapping
description: "This is most often done to fix the following error shown on Mac Pro machines such as the ones we create here, due to the memory stick layout not being what the Mac Pro model expects."
has_children: true
has_toc: false
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

<p align="center">
  <img width="650" height="200" src="../../../assets/Headers/Header-CustomMemoryMapping.png">
</p>

This write-up goes over how to use the included Memory Maps for standardized RAM sizes, as well as teaches the reader how to create their own maps from the derived information.

<p align="center">
  <img width="650" height="200" src="../../../assets/DarwinKVM/MacPro71-Memory-Configuration-Error.png">
</p>

This is most often done to fix the following error shown on Mac Pro machines such as the ones we create here, due to the memory stick layout not being what the Mac Pro model expects. If you do not have [RestrictEvents](https://github.com/acidanthera/RestrictEvents) set up to fix PCI, you will still have this error present and must map your memory with the legacy method via the OpenCore <code>config.plist</code>.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../01-Prerequisites">Next Page &rarr;</a>
  </div>
  <br>
</h2>
