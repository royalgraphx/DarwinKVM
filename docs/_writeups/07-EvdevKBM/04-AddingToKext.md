---
layout: default
title: Adding the required kexts
parent: KB/M sharing with Evdev
nav_order: 4
---
# Adding the Required Kexts

Start by downloading the latest release version of ``VoodooPS2`` from <a href="https://github.com/acidanthera/VoodooPS2/releases/">here</a> (for macOS 10.12 Sierra and higher).

> [!NOTE]
> For **OSX 10.11** (El Capitan) and lower, you will instead need to download the original PS2 driver by **RehabMan** <a href="https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/">here</a>. Note that these older drivers are built for x64 systems, but you can manually build the x32 versions in Xcode with the source code <a href="https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/">here</a>.

Add the kext to the OC folder, and remember to ``OC Snapshot`` the ``config.plist`` when finished. The necessary kexts (``VoodooPS2Keyboard, VoodooPS2Mouse``) will be installed automatically for you.

Now, boot up macOS, and enjoy switching your keyboard and mouse from macOS to Linux!

> [!NOTE]
>  Usually, the **Option (⌥)** and **Command (⌘)** keys on the keyboard maps to the **Alt** and the **Windows (⊞)** keys respectively. The original PS2 driver (by RehabMan) will swap these keymaps, however.
> <br/> <br/>
> You can change this behavior is to go to **Settings > Keyboard > Keyboard Shortcuts > Modifier Keys** (or something equivalent) in macOS, and swap the action keys for Option (⌥) and Command (⌘).

#### Thanks for reading!