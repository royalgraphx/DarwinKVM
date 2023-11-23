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
python3 macrecovery.py -b Mac-2BD1B31983FE1663 -m 00000000000000000 download

# Monterey (12)
python3 macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download

# Ventura (13)
python3 macrecovery.py -b Mac-B4831CEBD52A0C4C -m 00000000000000000 download

# Sonoma (14)
python3 macrecovery.py -b Mac-937A206F2EE63C01 -m 00000000000000000 download
```

## You can now continue to the next <a href="02-addingtoOC.html">page</a>.
