<p align="center">
  <img width="650" height="200" src="./Assets/HeaderOpenCore.png">
</p>

<h1 align="center">DKVM OpenCore Submodule</h1>
<h4 align="center">Allows the creation, management, and updating of the OpenCore EFI partition for your DKVM.</h4>

### Requirements

* Packages/Dependencies:
  * qemu-img
  * qemu-utils
  * modprobe
  * mkfs.fat (usually provided by dosfstools)

### Usage

Open a terminal and navigate to the directory containing the script files.

Ensure the scripts have executable permissions:

``chmod +x init.sh mount.sh unmount.sh``
