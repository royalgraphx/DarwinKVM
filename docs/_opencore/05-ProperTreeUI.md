---
layout: default
title: ProperTree Usage
description: "This page goes over understanding the ProperTree UI and OpenCore configuration property list formatting."
nav_order: 5
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
  <img width="650" height="200" src="../../../assets/Headers/Header-ProperTree.png">
</p>

<h2 align="center">Understanding OpenCore's Configuration File</h2>
<br>

{: .important }
This is not a page where you are actively doing anything, you don't even open the configuration file at all. Your task is to simply read and understand this page before continuing. The information below in this page will explain how to use [ProperTree](https://github.com/corpnewt/ProperTree) later, to make the changes necessary to explain to OpenCore what to do, and how to do it. **READING ONLY PAGE.**

Let's first go over understanding what you are looking at in the screenshot below.

<div style="text-align: center;" markdown="1">
[![Configuration Base Image](/assets/ProperTree/BaseImage.png)](/assets/ProperTree/BaseImage.png)
</div>

What we have done in the screenshot above, is simply collapse the ``Root`` dictionary.

We will now click on the dropdown icon, or use our right-arrow on the arrow keys to expand it.

<div style="text-align: center;" markdown="1">
[![Configuration Root Expanded Image](/assets/ProperTree/RootExpanded.png)](/assets/ProperTree/RootExpanded.png)
</div>

What ProperTree, and other Property List editors are telling you, is that you are looking at a list that contains dictionaries in its ``Root``.

These are seen as: ``ACPI``, ``Booter``, ``DeviceProperties``, ``Kernel``, ``Misc``, ``NVRAM``, ``PlatformInfo``, and finally the ``UEFI`` dictionary.

Let's go ahead and expand the ACPI dictionary so we can talk about how to visually read Property Lists.

<div style="text-align: center;" markdown="1">
[![Configuration ACPI dict Image](/assets/ProperTree/ACPIExpanded.png)](/assets/ProperTree/ACPIExpanded.png)
</div>

As shown above, you can now see that we have an ACPI dictionary that resides in the Root of the Property List. The ACPI dictionary itself contains further information in the form of entries known as ``children``, meaning they are underneath a dictionary, so it belongs to that parent dictionary. 

To learn more about how to read this visually, we will go ahead and expand the ``Quirks`` dictionary, that is a ``child`` of the ``ACPI`` dictionary.

<div style="text-align: center;" markdown="1">
[![Configuration Categories Highlighted Image](/assets/ProperTree/ACPIQuirksExpandedHighlighted.png)](/assets/ProperTree/ACPIQuirksExpandedHighlighted.png)
</div>

We've gone ahead and highlighted the image above to clearly explain visually how to read and understand what a ``Key`` is, and what it is doing.

- A <span style="color: #64fa37;">Key</span> is an identifier used to label a piece of data, in whatever form it comes in.

- The <span style="color: #faf037;">Type</span> describes the data format of the value associated with a key. 

- The <span style="color: #fa4e37;">Value</span> is the actual data or content associated with a key and is defined by its Type. 

When you are not looking at ProperTree, you will find the raw text would be as follows:

```xml
<key>Quirks</key>
<dict>
  <key>FadtEnableReset</key>
  <false/>
  <key>NormalizeHeaders</key>
  <false/>
  <key>RebaseRegions</key>
  <false/>
  <key>ResetHwSig</key>
  <false/>
  <key>ResetLogoStatus</key>
  <true/>
  <key>SyncTableIds</key>
  <false/>
</dict>
```

As you can see, they come in pairs, where the ``Key`` ``FadtEnableReset``, is a ``boolean``, so it simply has the associated ``<false/>`` XML tag. 

This gets more complex when we talk about numeric data in plain text, but this is a very simple way to understand how ProperTree is displaying the information visually.

Let's bump up the difficulty and view the DeviceProperties dictionary, to view what is inside of it.

<div style="text-align: center;" markdown="1">
[![Configuration DevProps Highlighted Image](/assets/ProperTree/DevicePropertiesExpandedHighlighted.png)](/assets/ProperTree/DevicePropertiesExpandedHighlighted.png)
</div>

We've gone ahead and once again, highlighted the above image to further explain how Property Lists are structured.

- <span style="color: #64fa37;">DeviceProperties</span> is the Dictionary we are paying attention to.

- <span style="color: #faf037;">Add, Delete</span> are two more dictionaries that live underneath DeviceProperties.

- <span style="color: #fa4e37;">PciRoot(0x0)/Pci(0x1b,0x0)</span> is a dictionary that lives under the ``Add`` dictionary.

If we take a moment to logically think about what we are telling OpenCore to do, we are specififying there are ``DeviceProperties`` we wish to parse, we then can either ``Add`` or ``Delete`` device properties. From there, we must specify the PciRoot Path of the device we wish to modify, in the above example we are ``Add``ing properties to ``PciRoot(0x0)/Pci(0x1b,0x0)``. From here, we can continue to look at what we are actually asking OpenCore to inject.

- <span style="color: #37fafa;">layout-id</span> is a ``Data`` type ``Key`` that has the ``Value`` of ``01000000`` 

So, if we were to finally say in plain english what we are accomplishing in this example provided to us by Sample.plist, it is that we are asking OpenCore, to ``Add`` a ``DeviceProperty`` of ``layout-id`` with the ``Value`` equal to ``01000000``, to the device located at ``PciRoot(0x0)/Pci(0x1b,0x0)``.

With this knowledge and understanding of ProperTree, and how Property Lists work, you can now read such information such as the following:

<div style="text-align: center;" markdown="1">
[![Configuration Kernel Section Image](/assets/ProperTree/KernelSchemeExpanded.png)](/assets/ProperTree/KernelSchemeExpanded.png)
</div>

You can now understand, that the above screenshot is of a user looking at the ``Scheme`` dictionary that belongs to the ``Kernel`` dictionary of the Configuration property list.

It has ``children`` such as <span style="color: #fa4e37;">CustomKernel</span> which is a <span style="color: #37fafa;">Boolean</span>, and has the <span style="color: #c937fa;">Value</span> of <span style="color: #c937fa;">False</span>. While there are also ``Key``'s such as <span style="color: #fa4e37;">KernelArch</span> which is is a <span style="color: #37fafa;">String</span> with the <span style="color: #c937fa;">Value</span> of <span style="color: #c937fa;">x86_64</span>.

Now that you understand the basics of navigating and understanding what you are looking at, when ProperTree has opened ``config.plist``, you can now actually configure the Value's that are described to you in the following page.

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../04-FilePlacement/05-Tools/">&larr; Back Page</a>
    <a class="nav-button" href="../06-OpenCoreConfigurations/index/">Next Page &rarr;</a>
  </div>
  <br>
</h2>
