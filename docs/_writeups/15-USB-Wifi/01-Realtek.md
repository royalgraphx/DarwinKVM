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

![](https://media.cleanshot.cloud/media/100116/699WG8lwr4gxsqrFRmvBJ5qBF8z0eslukTwDP8Uu.jpeg?Expires=1730473055&Signature=Q8FJ~nFFkJr-rGpS-drGYX5SAMQrtG~Aj-Kn61Op6coRRc1Sf2MRAXYWbWcJJYnDrFMvjA-CFRfSQucP61D0yQVp93bFbGrLzHDM8vYUhTMgu90qjWfCeCCGPm2RvNH42VF~6G6rmzDjkqxbaAeo~zzHQ656KaymkVaMgnXEnRYa3LdikVeda2DLnu-qMk36BQjkDU9xAmPseOH4hN4XDwHrLjx1kk7YrmJb9KIR5bwTaIuq553e27L5LOO82HidrIog-~eT5PUNogCWSivb38GWWkKcYcnTuwi5rsZGRtMPkkvTE3EmjbUWaJWOkHUjaYBGBsuMeXmDfkPc5SCsYA__&Key-Pair-Id=K269JMAT9ZF4GZ)

Now go reboot into recoveryOS and run the following command: ```csrutil disable && /usr/sbin/spctl kext-consent add ZYM2ETK3E7```

This will disable SIP, and consent to the kext(s) for an extra failsafes.

Now, reboot, download [this](https://github.com/chris1111/Wireless-USB-OC-Big-Sur-Adapter/releases/download/V17/Wireless.USB.OC.Big.Sur.Adapter-V17.zip) and go run it. Reboot, and you should have working WLAN.

![](https://media.cleanshot.cloud/media/100116/Ov50DvsNqk8FmBMIT5JCOwFagQl1ateRT8DSccwt.jpeg?Expires=1730473179&Signature=DX5Ht8W9VIt8-OQM7rui7VNLh6V1YN52ArVg037D5fAnYw4~V6SAZ~oTBURC5Tv8h~6wZWdn0qszEl6uYTlqLTTvJ9dnZaT7clAijuXMtctrBZ3PlO-5j1RvgrnwqHNSLWYXIW3JtXXsk6DEaa8LCZ3qTG-60rvsBtrpC8R9n9daQjwAdlnmlUbmVFZ2fy3rfeKiuGY7aeg4jg5DTutrfHHL3IDi7n370YcIK4ntx4ZRBe8McCt5ZkJcIpiBUtkdSPSQz0dtyOq2S68wMKEUZTAR0~Rh~zsl4RecG~LT4-d4kIoIK8bW6P94LEweCLJu7jzhzAtHNjW2-g4MLMG28Q__&Key-Pair-Id=K269JMAT9ZF4GZ)

(fyi, it is now safe to re-enable SIP via `csrutil enable`)