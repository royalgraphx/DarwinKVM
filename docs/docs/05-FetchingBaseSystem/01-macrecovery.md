---
layout: default
title: Part 1 - macrecovery
parent: Fetching BaseSystem
nav_order: 2
---

# Using macrecovery

Open a terminal and navigate to the directory containing the script files.

For this example, we'll be getting the latest macOS Ventura:

``python3 macrecovery.py -b Mac-4B682C642B45593E -m 00000000000000000 download``

<p align="center">
  <img src="../../assets/macrecovery.png">
</p>

## List of downloadable BaseSystems

```
# Big Sur (11)
python3 macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download

# Monterey (12)
python3 macrecovery.py -b Mac-FFE5EF870D7BA81A -m 00000000000000000 download

# Latest version
# ie. Ventura (13)
python3 macrecovery.py -b Mac-4B682C642B45593E -m 00000000000000000 download
```

## You can now continue to the next <a href="02-addingtoOC.html">page</a>.