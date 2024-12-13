---
layout: default
title: Adding VoodooPS2
parent: KB/M sharing with Evdev
nav_order: 4
---
## Adding VoodooPS2
## THIS STEP IS REQUIRED FOR VERSIONS **10.14** (Mojave) AND EARLIER
> This is due to MacOS only adding support for Virtio devices in Catalina and later, this will mean we will have to use the QEMU PS2 keyboard and mouse which requires VoodooPS2 to work.

> For **OS X 10.11** (El Capitan) and lower, you will instead need to download the original PS2 driver by **RehabMan** <a href="https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/">here</a>. Note that these older drivers are built for x64 systems, but you can manually build the x32 versions in Xcode with the source code <a href="https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/">here</a>.
{: .headsup }
Start by downloading the latest release version of ``VoodooPS2`` from <a href="https://github.com/acidanthera/VoodooPS2/releases/">here</a> (for macOS 10.12 Sierra and higher).

Add the kext to the Kexts folder in your OpenCore disk image, and remember to ``OC Snapshot`` the ``config.plist`` when finished. The necessary kexts (``VoodooPS2Keyboard, VoodooPS2Mouse``) will be added automatically for you by ProperTree.

Now, boot up macOS, and enjoy switching your keyboard and mouse from macOS to Linux!

{: .note }
>  Usually, the **Option (⌥)** and **Command (⌘)** keys on the keyboard maps to the **Alt** and the **Windows (⊞)** keys respectively. The original PS2 driver (by RehabMan) will swap these keymaps, however.
> 
> You can change this behavior is to go to **Settings > Keyboard > Keyboard Shortcuts > Modifier Keys** (or something equivalent) in macOS, and swap the action keys for Option (⌥) and Command (⌘).

#### Thanks for reading!
