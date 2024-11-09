---
layout: default
title: Realtek
parent: USB WiFi Guide
nav_order: 1
---

{: .warning }
This guide is for 802.11n and 802.11ac adapters, if you are not using one of these, it will not work.

Firstly, you'll need the Kexts, you can find them [here](https://github.com/chris1111/Wireless-USB-Big-Sur-Adapter/tree/a004dd0c094e0d1dc12dceaeff81684963377798/Package%20sources/drivers).

Drag them into your EFI/OC/Kexts and open ProperTree with your plist and run "OC Snapshot" from your OC folder.

![](https://files.naymmm.lol/dkvm1.jpeg)

Now go reboot into recoveryOS and run the following command: ```csrutil disable && /usr/sbin/spctl kext-consent add ZYM2ETK3E7```

This will disable SIP, and consent to the kext(s) for an extra failsafes.

Now, reboot, download [the WiFi utility](https://github.com/chris1111/Wireless-USB-OC-Big-Sur-Adapter/releases/download/V17/Wireless.USB.OC.Big.Sur.Adapter-V17.zip) and run it.

You should have working WiFi now, signified by the blue/white WiFi icon in your status bar.

![](https://files.naymmm.lol/dkvm2.jpeg)

(fyi, it is now safe to re-enable SIP via `csrutil enable`)