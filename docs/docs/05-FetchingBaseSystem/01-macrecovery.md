---
layout: default
title: Part 1 - macrecovery
parent: Fetching BaseSystem
nav_order: 1
---

# macrecovery

Open a terminal and navigate to the directory containing the script files.

For this example, we'll be getting the latest macOS Ventura:

``python3 macrecovery.py -b Mac-4B682C642B45593E -m 00000000000000000 download``

<p align="center">
  <img src="../../assets/macrecovery.png">
</p>

Notice that it will then create a folder ``com.apple.recovery.boot``, which you will need to copy over to the root of the OpenCore .img mount point. Refer to the image above for an example. It does load slower this way, but will persist so you will always have it around, you can delete it after if you'd like. You can also use dmg2img to convert the BaseSystem.dmg to a BaseSystem.img you can then mount via Virt-Manager.

## If you'd like to convert to an img

If for whatever reason you'd like to mount this directly to the Virtual Machine, you'll have to convert the dmg to an img file. You can do this using ``dmg2img`` the following way

``dmg2img -i BaseSystem.dmg BaseSystem.img``

## List of downloadable BaseSystems

```
# High Sierra (10.13)
python3 macrecovery.py -b Mac-7BA5B2D9E42DDD94 -m 00000000000J80300 download
python3 macrecovery.py -b Mac-BE088AF8C5EB4FA2 -m 00000000000J80300 download

# Mojave (10.14)
python3 macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download

# Catalina (10.15)
python3 macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download

# Big Sur (11)
python3 macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download

# Monterey (12)
python3 macrecovery.py -b Mac-FFE5EF870D7BA81A -m 00000000000000000 download

# Latest version
# ie. Ventura (13)
python3 macrecovery.py -b Mac-4B682C642B45593E -m 00000000000000000 download
```

<h1>You can now proceed to the <a href="../06-InstallingmacOS/">Installing macOS</a> section!</h1>
