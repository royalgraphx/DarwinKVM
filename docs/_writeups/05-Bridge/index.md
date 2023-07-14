---
layout: default
title: Bridge Networking
nav_order: 5
has_children: true
---


<p align="center">
  <img width="650" height="200" src="../../../assets/HeaderBridgeNetworkingTextOnly.png">
</p>

{: .warning }
This is for Desktops, using ethernet. If you are on a laptop, or using WI-FI on your hypervisor please note this method will not work. There may be other sources but it's not this one.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/6435eNKpyYw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This write-up is a texted based guide based on this video. If you'd like more information on the inner workings of libvirtd's default manager, as well as how to manually set things up, you can refer to the video below. It also includes the references for the automation files used with systemd-networkd.

{: .important }
> The following guide makes the following assumptions:
>  - You have systemd, and have the ability to use systemd-networkd
>  - You are using NetworkManager, so the steps include how to disable it.
>  - Can solve route tables, and you know your routers default gateway.
>  
> These assumptions will also allow you to use the submodules automated script.