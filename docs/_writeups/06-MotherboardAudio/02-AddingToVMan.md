---
layout: default
title: Adding to Virt-Manager
parent: Motherboard Audio
nav_order: 2
---

# Adding Audio Controller to Virt-Manager
#### AppleALC requires proper Bus/Slot/Function.

Let's open Virt-Manager and add a new device via PCI. Select your Audio Controller.

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/VManAddFPA.png">
</p>

Let's select it on the right-hand side and view the XML. There's an issue we must correct, the bus and slot are not where macOS/AppleALC expect it to be.

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/VManFPABeforeFix.png">
</p>

To fix this issue, we must set the ``bus`` to ``0x00``. But we'll run into an issue, other devices will possibly be using it already, and won't allow us to use it. Instead we must slowly increment the slot that the Audio Controller is in, that the VM will see. Here is a failed attempt at trying to use the Audio controller in ``Bus 0x00`` and ``Slot 0x00``:

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/VManFPAAttempt.png">
</p>

The reason is actually because the SATA Controller which isn't removable, has ended up in ``Bus 0x00`` and ``Slot 0x1f`` as shown here:

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/VManFPAAttemptReason.png">
</p>

So let's go ahead and try the next available slot ``0x02``.

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/VManFPAAfterFix.png">
</p>

That seems to have saved correctly! We've now assigned the Audio Controller to be put in the Virtual Machine at ``Bus 0x00`` and Slot ``0x02``. You may for whatever reason still need to count upward until you find a free slot. For those who do, here is a simple continuation...

```
0x01, 0x02, 0x03, ... 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x11, 0x12...
```

{: .highlight }
Once this is complete, and you've verified it's saved onto Bus 0x00, you can now go ahead and boot your Virtual Machine and continue the rest on macOS.

## You can now continue to the next <a href="../03-AddingKext">page</a>.
