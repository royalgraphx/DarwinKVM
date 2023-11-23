---
layout: default
title: CPU Pinning
nav_order: 9
has_children: true
---

<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderCPUPinning.png">
</p>

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Pb2upx53fUM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This is a written guide based on the video mentioned above, if you have further questions or run into any issues, you can ask for help in the DarwinKVM Discord. This guide will help people reserve 1 core for Linux, and pin the other threads to a respective thread on the host system. Adjust according to your needs.

{: .important }
> The following guide makes the following assumptions:
>  - You have the ``hwloc`` package installed.
>  - You understand the difference between cores and threads.
>  - You want to reserve a core for the host, and map the rest for full potential.
>  - You have already done <a href="../../07-FakeCoreCount/index">Fake Core Count</a> to maximize core count.
