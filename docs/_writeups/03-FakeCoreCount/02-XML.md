---
layout: default
title: XML Changes
parent: Fake Core Count
nav_order: 2
---

# Setting up Fake Core Count
#### Configures an 8 Core Guest, with only 14 threads on.

Before setting this up, set the CPU section to 1 Socket, 8 Cores, 2 Threads.

<p align="center">
  <img width="650" height="200" src="../../../assets/VManFCorePage.png">
</p>

With this applied, we can now head to the XML area and make the following changes.

After changing the following line's ``current`` to fit your system threads (-2), insert the following code snippet.

```xml
<vcpu placement="static" current="14">16</vcpu>
```

```xml
<vcpus>
  <vcpu id="0" enabled="yes" hotpluggable="no" order="1"/>
  <vcpu id="1" enabled="yes" hotpluggable="yes" order="2"/>
  <vcpu id="2" enabled="yes" hotpluggable="yes" order="3"/>
  <vcpu id="3" enabled="yes" hotpluggable="yes" order="4"/>
  <vcpu id="4" enabled="yes" hotpluggable="yes" order="5"/>
  <vcpu id="5" enabled="yes" hotpluggable="yes" order="6"/>
  <vcpu id="6" enabled="yes" hotpluggable="yes" order="7"/>
  <vcpu id="7" enabled="yes" hotpluggable="yes" order="8"/>
  <vcpu id="8" enabled="yes" hotpluggable="yes" order="9"/>
  <vcpu id="9" enabled="yes" hotpluggable="yes" order="10"/>
  <vcpu id="10" enabled="yes" hotpluggable="yes" order="11"/>
  <vcpu id="11" enabled="yes" hotpluggable="yes" order="12"/>
  <vcpu id="12" enabled="yes" hotpluggable="yes" order="13"/>
  <vcpu id="13" enabled="yes" hotpluggable="yes" order="14"/>
  <vcpu id="14" enabled="no" hotpluggable="yes"/>
  <vcpu id="15" enabled="no" hotpluggable="yes"/>
</vcpus>
```

To understand how many should be disabled, take the maximum threads of your host CPU (16 in my case), and subtract 2. This means my host with 16 threads, will have 2 Threads (1 Core) to the host, and 14 will be used in the virtual machine.

Example if you have a 6 core, 12 thread system.

```xml
<vcpus>
  <vcpu id="0" enabled="yes" hotpluggable="no" order="1"/>
  <vcpu id="1" enabled="yes" hotpluggable="yes" order="2"/>
  <vcpu id="2" enabled="yes" hotpluggable="yes" order="3"/>
  <vcpu id="3" enabled="yes" hotpluggable="yes" order="4"/>
  <vcpu id="4" enabled="yes" hotpluggable="yes" order="5"/>
  <vcpu id="5" enabled="yes" hotpluggable="yes" order="6"/>
  <vcpu id="6" enabled="yes" hotpluggable="yes" order="7"/>
  <vcpu id="7" enabled="yes" hotpluggable="yes" order="8"/>
  <vcpu id="8" enabled="yes" hotpluggable="yes" order="9"/>
  <vcpu id="9" enabled="yes" hotpluggable="yes" order="10"/>
  <vcpu id="10" enabled="no" hotpluggable="yes"/>
  <vcpu id="11" enabled="no" hotpluggable="yes"/>
  <vcpu id="12" enabled="no" hotpluggable="yes"/>
  <vcpu id="13" enabled="no" hotpluggable="yes"/>
  <vcpu id="14" enabled="no" hotpluggable="yes"/>
  <vcpu id="15" enabled="no" hotpluggable="yes"/>
</vcpus>
```

In this case, you can see we would have 12 threads, but because we subtract 2 to leave for the host, we end up only needing 10 enabled. If for whatever reason you have a system that exceeds 16 threads and you want to dedicate more of them, the next jump would be to create a Fake Core Count of 16 Cores 32 Threads, to utilize host systems that have 16-30 threads.

#### Thanks for reading!
