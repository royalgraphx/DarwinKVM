---
layout: default
title: Part 0 - Prerequisites
parent: Legacy NVIDIA Patching
nav_order: 1
---

# Prerequisites

{: .warning }
Be advised, that going through with this will result in your macOS experience being worse than if you stick to High Sierra and that using OCLP will break several macOS security features.

Start by opening up config.plist and navigating to the section where ``boot-args`` is located.
Edit the key ``csr-active-status`` to ``<03 08 00 00 00>``, this will disable parts of System Integrity Protection.

Next, you'll want to add WhateverGreen to your Kexts (Requires Lilu if it isn't already installed) and append the following to your boot arguments:
- ``ngfxgl=1``
- ``ngfxcompat=1``
- ``amfi_get_out_of_my_way=1``, this disables AMFI.
- ``ipc_control_port_options=0``, this can fix some Electron apps crashing due to AMFI being disabled

Dortania's AMFIPass can be used in some cases, however this hasn't been tested

## You can now continue to the next <a href="../02-PatchingTheOS">page</a>.
