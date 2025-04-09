---
layout: default
title: Cloning the Repo
description: "How to properly get the DarwinKVM repository, with all of its contents included."
nav_order: 2
has_children: false
has_toc: false
---

<style>
  .navigation-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }
  
  .nav-button {
    margin: 10px;
  }
</style>

<p align="center">
  <img width="40%" height="40%" src="../../assets/Github/GitHub_Logo_White.png">
</p>

<h2 align="center">How to properly Clone the Repository</h2>

<br>
<p align="center">To get started with DarwinKVM, you'll need to recursively clone the repository hosted on GitHub to get access to its submodules like DiskProvision, DarwinFetch, and various others.</p>

```bash
git clone --recursive https://github.com/royalgraphx/DarwinKVM.git
```

<p align="center">This may take a few minutes depending on your internet connection speeds. If you do not clone the repository recursively, you can later fetch the submodules via the DarwinKVM Main Menu, but doing it initially allows you to update DarwinKVM by using the Main Menu or by issuing <code>git pull</code> in the root of the repository. Updating/Submodules will not work if you download the repository as a ZIP file.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../00-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../02-BIOS-Settings">Next Page &rarr;</a>
  </div>
  <br>
</h2>
