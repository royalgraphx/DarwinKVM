---
layout: default
title: Part 0 - Prerequisites
parent: Fake Core Count
nav_order: 1
---

# Learning about Core Count
#### MacPro7,1 supports various configurations.
#### This section has been derived from the <a href="https://support.apple.com/kb/SP797">Mac Pro (2019) - Technical Specifications</a> page by Apple. For this guide we will fake a 16 Core Mac Pro.

Take for example, a host with 8 cores. Without using weird configurations such as, 2 Sockets, 4 Cores, 2 Threads, we can simplify the way we enable cores for our Virtual Machine. It is common practice to leave 1 complete core for the Linux host.

# Lets talk about Threads!

I'd like to get some concepts straight. In today's modern world of computing we have what are known as multithreaded systems. What this means, is that for every ``Core``, we have ``2 Threads``. This is something you need to understand right away. When we are looking at our XML, we are defining ``threads``. Note that for every 2 threads, we are talking about a ``singular core``. I understand your CPU manufacturer says 8 cores 16 threads. They're not lying, it does not mean you have 16 cores. You have 8 cores. Each with 2 threads inside. This gives you the total of 16 ``threads`` to use. We will be leaving the first two ``threads``, which means our ``Core 0`` or, our first core of our CPU, alone to the host. This is why we will disable a few threads depending on how many you need to for your system.

## You can now continue to the next <a href="../02-XML">page</a>.
