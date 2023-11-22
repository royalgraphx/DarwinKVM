---
layout: default
title: Part 1 - XML Modifications
parent: CPU Pinning
nav_order: 2
---

# Pinning the Threads
#### Yeah, it's actually Thread Pinning, who would've thought?

To begin, open your DarwinKVM window from Virt-Manager and head to the XML tab.

If you've already done [Virtio IO Thread](../../13-VirtioIOThread/index) then you'll put this under

```xml
<iothreads>1</iothreads>
```

If you've already done [Fake Core Count](../../07-FakeCoreCount/index) then you'll put this under

```xml
<vcpus>
  ...
</vcpus>
```

To begin, this section is called ``CPU Tune``. We can add this below whichever works for you above.

```xml
<cputune>
  <vcpupin vcpu="0" cpuset="2"/>
  <vcpupin vcpu="1" cpuset="3"/>
  <vcpupin vcpu="2" cpuset="4"/>
  <vcpupin vcpu="3" cpuset="5"/>
  <vcpupin vcpu="4" cpuset="6"/>
  <vcpupin vcpu="5" cpuset="7"/>
  <vcpupin vcpu="6" cpuset="8"/>
  <vcpupin vcpu="7" cpuset="9"/>
  <vcpupin vcpu="8" cpuset="10"/>
  <vcpupin vcpu="9" cpuset="11"/>
  <vcpupin vcpu="10" cpuset="12"/>
  <vcpupin vcpu="11" cpuset="13"/>
  <vcpupin vcpu="12" cpuset="14"/>
  <vcpupin vcpu="13" cpuset="15"/>
  ...
  ...
</cputune>
```

You must customize this example above for your Virtual Machines Virtual Core Count. Below we will go over two different scenarios and how to determine how many vCPU's you need to keep.

Example 1 - Stock, No Fake Core Count

```xml
<vcpu placement="static">8</vcpu> // 1 Socket, 4 Cores, 2 Threads, 8 vCPU's total
```

Example 2 - if you've done Fake Core Count

```xml
<vcpu placement="static" current="14">16</vcpu> // VM is 1 Socket 8 Cores, 2 Threads, but only using 14 host threads
```

In the first example, we're only using 8 threads or (vCPU's) so we would do

```xml
<cputune>
  <vcpupin vcpu="0" cpuset="2"/>
  <vcpupin vcpu="1" cpuset="3"/>
  <vcpupin vcpu="2" cpuset="4"/>
  <vcpupin vcpu="3" cpuset="5"/>
  <vcpupin vcpu="4" cpuset="6"/>
  <vcpupin vcpu="5" cpuset="7"/>
  <vcpupin vcpu="6" cpuset="8"/>
  <vcpupin vcpu="7" cpuset="9"/>
  ...
  ...
</cputune>
```

{: .important }
Don't forget! vCPU 7 is actually Thread 8! We start counting from 0 not 1.

In the second example, it was a 14 Thread Virtual Machine, so the following is used

```xml
<cputune>
  <vcpupin vcpu="0" cpuset="2"/>
  <vcpupin vcpu="1" cpuset="3"/>
  <vcpupin vcpu="2" cpuset="4"/>
  <vcpupin vcpu="3" cpuset="5"/>
  <vcpupin vcpu="4" cpuset="6"/>
  <vcpupin vcpu="5" cpuset="7"/>
  <vcpupin vcpu="6" cpuset="8"/>
  <vcpupin vcpu="7" cpuset="9"/>
  <vcpupin vcpu="8" cpuset="10"/>
  <vcpupin vcpu="9" cpuset="11"/>
  <vcpupin vcpu="10" cpuset="12"/>
  <vcpupin vcpu="11" cpuset="13"/>
  <vcpupin vcpu="12" cpuset="14"/>
  <vcpupin vcpu="13" cpuset="15"/>
  ...
  ...
</cputune>
```

{: .important }
Don't forget! vCPU 13 is actually Thread 14! We start counting from 0 not 1.

That is all. This should automatically allocate starting from Core 2 (Thread 2. LP #2), all the way up to the very last core on your system. Such as the image below shows.

<p align="center">
  <img src="../../../assets/lstopo-idealvmstart.png">
</p>

#### Thanks for reading!
