---
layout: default
title: Package Installation
parent: Using Terminal
grand_parent: Disk Image Creation
description: "This page goes over the required packages for managing disk images via Terminal manually."
nav_order: 1
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
  <img width="650" height="200" src="../../../../assets/Headers/HeaderPackageInstallation.png">
</p>

<p align="center">To continue, you'll need the following packages installed on your system.</p>

* Packages/Dependencies:
  * qemu-img
  * qemu-utils
  * modprobe
  * mkfs.fat (usually provided by dosfstools)

{: .note }
You can do so, with the below provided commands. If you do not have access to modprobe, it may not be possible to continue. If you do not see your distribution below, you can install the dependencies as noted above to continue.

<details markdown="block">
<summary align="center">Debian based</summary>
<br>

```bash
sudo apt update
sudo apt install -y qemu-utils dosfstools
```

</details>
<br>

<details markdown="block">
<summary align="center">Red Hat based (RHEL, CentOS, Fedora)</summary>
<br>

```bash
sudo dnf install -y qemu-img dosfstools
```

</details>
<br>

<details markdown="block">
<summary align="center">Arch based</summary>
<br>

```bash
sudo pacman -Syu qemu dosfstools
```

</details>
<br>

<details markdown="block">
<summary align="center">Alpine Linux</summary>
<br>

```bash
sudo apk add qemu-img dosfstools
```

</details>
<br>

<details markdown="block">
<summary align="center">OpenSUSE</summary>
<br>

```bash
sudo zypper install qemu-tools dosfstools
```

</details>
<br>

<p align="center">You can now begin on the next page!</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../index">&larr; Back Page</a>
    <a class="nav-button" href="../02-CreateAndManagement">Next Page &rarr;</a>
  </div>
  <br>
</h2>
