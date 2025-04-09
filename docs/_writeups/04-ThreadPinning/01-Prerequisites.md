---
layout: default
title: Planning the Pinning
parent: Thread Pinning
nav_order: 1
---

# Planning the Pinning
#### How to understand what we'll be doing and how to derive your own information.

<p align="center">
  <img src="../../../assets/lstopoexample.png">
</p>

When you first run the ``lstopo`` command you will get a window like the one above. It may not look exactly the same but, i'll help you understand the UI so that you can get your proper information.

In this area we have our cores, and the threads represented inside of each core.

<p align="center">
  <img src="../../../assets/lstopo-cores.png">
</p>

The above image represents an 8 core, 16 thread system.

``Core 0 -> Core 7`` is 8 Cores.

``Thread 0 -> Thread 15`` is 16 Threads.

This is an important distinction, because in the following page we'll be actually modifying our XML to add the Virtual CPUs (vCPU's) and pinning them to a physical thread. For example, if you want your Virtual Thread 0, to be mapped to the ``PU L#2`` because you want the Virtual Cores to begin after the first real physical core, you start on physical Thread 2. This is what we'll be doing.

<p align="center">
  <img src="../../../assets/lstopo-idealvmstart.png">
</p>

#### You can now continue to the next <a href="../02-XML">page</a>.
