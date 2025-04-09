---
layout: default
title: XML Changes
parent: Virtio IO Threads
nav_order: 1
---

# Adding and utilizing IO Threads
#### Can speed up virtual disk performance.

{: .note }
You'll need to have the ``hwloc`` package installed.

To start, you can run ``lstopo`` in your terminal to view your CPU configuration. You'll want to note your first core (Core L#0), which will then have two threads inside (PU L##, and PU L##). What we need, are the numbers in P##. In my system, the top value is 0, and the bottom value is 8. That means my iothread will target (0,8).

<p align="center">
  <img width="650" height="200" src="../../../assets/8Corelstopo.png">
</p>

On a different system, such as a 6 core systems youll find that the top value is 0, and the bottom value is 6.

In this case, the io thread would be to (0,6).

<p align="center">
  <img width="650" height="200" src="../../../assets/6Corelstopo.png">
</p>

To add this to the XML, you'll need to add the following line above the ``<cputune></cputune>`` codeblock.

```xml
<iothreads>1</iothreads>
```

Then, within the CPU Tune codeblock, add the following

```xml
<cputune>
  ...
  <emulatorpin cpuset="#,#"/>
  <iothreadpin iothread="1" cpuset="#,#"/>
</cputune>
```

Of course, replace the values of (#,#) to what you derived from the earlier information.

#### Thanks for reading!
