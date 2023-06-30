---
layout: default
title: Part 4 - Final Touches
parent: Front Panel Audio
nav_order: 4
---

# Final Touches
#### Once you found the correct aclid, apply it to deviceproperties.

Let's go ahead and clean this up by making the layout more permanent.

Open [Hackintool](https://github.com/benbaker76/Hackintool) and navigate to the PCI Section.

<p align="center">
  <img src="../../../assets/HackinToolPCIFPA.png">
</p>

You'll be looking for a device that has ``HDEF`` in the IOReg Name. You'll be copying the Device Path for use next.

``PciRoot(0x0)/Pci(0x2,0x0)`` is what mine is. As you'll notice it represents the same as in the XML but in a format that macOS uses.

You'll need to open your OpenCore config.plist in ProperTree. Create a new child under ``DeviceProperties -> Add``. Set its ``Type`` to ``Dictionary``.

The name of the dictionary is going to be the PciRoot you just copied from Hackintool. You may or may not already be injecting other Device Properties, you can ignore my other one.

<p align="center">
  <img src="../../../assets/OpenCoreFPANewDevProp.png">
</p>

<p align="center">
  <img src="../../../assets/OpenCoreFPAFinished.png">
</p>

You will then create a new child number under that dictionary, to hold the ``layout-id`` property. In this example, this was what I wrote:

| --- | --- | --- |
| layout-id | Number | 1 |

This section of course is optional, you can continue to use the boot-arg, but...

{: .highlight }
Don't forget to remove the boot-arg! Never use both!

<p align="center">
  <img src="../../../assets/OpenCoreFPARemoveBoot.png">
</p>

Reboot, verify everything is working as expected, and you now have FPA and RPA Audio!