---
layout: default
title: Thread Pinning
description: "Placeholder"
has_children: true
has_toc: false
nav_order: 4
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
  <img width="650" height="200" src="../../../assets/Headers/Header-Thread-Pinning.png">
</p>

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Pb2upx53fUM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This is a written guide based on the video mentioned above, if you have further questions or run into any issues, you can ask for help in the DarwinKVM Discord. This guide will help people reserve 1 core for Linux, and pin the other threads to a respective thread on the host system. Adjust according to your needs.

{: .important }
> The following guide makes the following assumptions:
>  - You have the ``hwloc`` package installed.
>  - You understand the difference between cores and threads.
>  - You want to reserve a core for the host, and map the rest for full potential.
>  - You have already done <a href="../../07-FakeCoreCount/index">Fake Core Count</a> to maximize core count.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../01-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../01-Prerequisites">Next Page &rarr;</a>
  </div>
  <br>
</h2>
