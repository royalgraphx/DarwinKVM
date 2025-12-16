---
layout: default
title: Finding ALC Layout
parent: Motherboard Audio
nav_order: 1
---

# Finding ALC Layout
#### Used later when adding aclid to boot-args

We'll need to have ``alsa-utils`` (On Arch) package installed to be able to use the following command.

Other distributions can find the equivalent package that holds the ``aplay`` command.

Ensure you're using the audio device and/or it's active.

Let's go ahead and issue the following command into a terminal:

```
aplay -l
```

Here is an example of what it will look like:

<p align="center">
  <img src="../../../assets/writeups/MoboAudio/HWCheckALC.png">
</p>

As you can see, my audio codec is ``ALC1220``. Take note of this somewhere, as it will be needed later.

## You can now continue to the next <a href="../02-AddingToVMan">page</a>.
