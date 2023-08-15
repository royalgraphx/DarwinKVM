---
layout: default
title: Part 0 - Preparing VM RAM
parent: Custom Memory Mapping
nav_order: 1
---

# Preparing VM RAM Configuration
#### Proper CMM requires typical RAM amounts.

While you can technically modify this to fit your custom RAM amounts, I'd like to first explain how you would properly map typical RAM amounts.

This will correct Virtual Machines with the following guest amounts to the following setup.

{: .important }
These are recommended guest sizes by myself, If you have 64GB on your Host machine, it logically makes sense (to me) to create a macOS virtual machine with 32GB of RAM. You can of course customize this and create maps to fix, per say, 52GB of RAM, but that is out of the scope of this write up, and if you read everything, you'll understand how to make your own.

| Host | Guest |
| ---- | ----- |
| 8GB | 4GB, 4 Sticks of 1GB |
| 16GB | 8GB, 4 Sticks of 2GB |
| 32GB | 16GB, 4 Sticks of 4GB |
| 64GB | 32GB, 4 Sticks of 16GB |
| 128GB | 64GB, 4 Sticks of 32GB |
| 256GB | 128GB, 4 Sticks of 64GB |

## You can now continue to the next <a href="../02-MemoryMaps">page</a>.