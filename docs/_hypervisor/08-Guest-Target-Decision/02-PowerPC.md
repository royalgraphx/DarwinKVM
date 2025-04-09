---
layout: default
title: PowerPC
description: "Placeholder"
parent: Guest Target Architecture
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
  <img width="650" height="200" src="../../../assets/Headers/Header-PowerPC.png">
</p>

{: .internalnote }
>This page is going to go through the entire DarwinPPC usage. Right now, we simply have the support chart. This leads nowhere. There is no reason to split off DarwinKVM into multiple sections, having the left-hand UI be obstructed and disordered. We can easily explain both CLI and Virt-Manager usage. Especially when the only real difference is using DarwinFetch to get the desired OS X install disc/s and updating the paths manually in CLI or XML.
>
> Is AGP Passthrough even possible on a Linux kernel? I have no idea.
>

<h2 align="center">A chart of supported guests available!</h2>

| Build Version | Build Name | Architecture | Model |
| --- | --- | --- | --- |
| 10.6.0 DP 1 | Snow Leopard | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.5+ | Leopard | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.4+ | Tiger | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.3+ | Panther | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.2+ | Jaguar | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.1+ | Puma | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
| 10.0+ | Cheetah | PowerPC | <span style="color: #e6f0a5;">PowerMac3,1</span> |
