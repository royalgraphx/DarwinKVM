---
layout: default
title: Adding Kext + Finding Layout ID
parent: Motherboard Audio
nav_order: 3
---

# Adding/Using AppleALC Kext
#### Includes a chart for finding ALCID

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/OpenCoreALCBootArg.png">
</p>

We'll now go ahead and add the ``AppleALC.kext`` into our OpenCore image. To use it properly, we must first ``OC Snapshot`` to make sure it's added to our config.plist kexts. Next, we must go to the boot arguments and add the following:

```
alcid=xxx
```
Where, ``xxx`` is the Layout ID that corresponds with your ALC Codec from the previous page.

In the screenshot above, you can see the use of ``alcid=1``. This was determined from the following chart:

[Acidanthera, AppleALC Supported Codecs](https://github.com/acidanthera/AppleALC/wiki/Supported-codecs)

{: .warning }
If your Audio Codec was not in the chart above, you may not have compatible hardware. USB 3.5mm Adapters and USB Mics are great quick alternatives when facing compatibility issues.

The chart is always changing to support more codecs, which is why it is not hardcoded here. Based on my ALC1220, you can see when referencing the guide I can try these various layouts until my audio is working as expected. You may or may not have to test multiple layouts. I was lucky and was able to simply use ``aclid=1``.

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/HWCheckALCReference.png">
</p>

Eventually, when you've gotten the right setup, your audio should work as expected!

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/macOSACLID.png">
</p>

## You can now continue to the next <a href="../04-FinalTouches">page</a>.
