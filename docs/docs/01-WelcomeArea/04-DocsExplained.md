---
layout: default
title: Docs Layout Overview
parent: Welcome to DarwinKVM!
nav_order: 5
---

<p align="center">
  <img width="650" height="200" src="../../assets/HeaderDocsLayout.png">
</p>

<h3 align="center">The basic flow of a user attempting to use DarwinKVM would typically go like this:</h3>

<br>

**1. Welcome to DarwinKVM!**
   - Meet Requirements
     - Check GPU Compatibility
   - Learn about the Docs Structure <span style="color: #ffab52;"><-- You are here!</span>

**2. [Host Preparations](../02-HostPreparations/index)**
   - Check and Enable BIOS Settings
   - Set Kernel Parameters according to your system
   - Package Installation according to your system
   - Virtual Machine Networking explained
   - Libvirtd Configuration
   - IOMMU Viability, <span style="color: #ffab52;">if you require ACS patches this would be the time to do so.</span>

**3. [DiskProvision](../03-DiskProvision/index)**
  - Introduction and Learning
  - Create OpenCore Disk Image

**4. Configure OpenCore for target macOS**
  - Simply choose an Install Guide from the left-hand side!

**5. Fetching Installer**
  - You may either get a [Recovery](../../infocenter/06-FetchingInstaller/01-Recovery/index) or [Offline](../../infocenter/06-FetchingInstaller/02-Offline/index) based Installer.

**6. [Import XML and Configure Virtual Machine](../../infocenter/07-XML/index)**
  - Adding base devices
  - Installing Mac OS X / macOS
  - Initial Setup until reaching the Desktop.

**7. GPU Passthrough**
  - <span style="color: #ffab52;">Depending on how many GPU's you have on your system, follow the appropriate guide.</span>
  - [Single GPU Passthrough](../../infocenter/08-sGPUpt/index)
  - [Dual GPU Passthrough](../../infocenter/09-dGPUpt/index)

**8. Further Optimizations (Completely Optional/Dependent on You)**
  - [Fake Core Count](../../writeups/01-FakeCoreCount/index)
  - [Thread Pinning](../../writeups/02-ThreadPinning/index)
  - [VirtIO Thread for Virtio Disks](../../writeups/03-VirtIOThread/index)
  - [Front/Rear Motherboard Audio](../../writeups/05-MotherboardAudio/index)
  - [RestrictEvents Usage](../../writeups/08-RestrictEvents/index)

<h5 align="center">If you are attempting to run the latest macOS, the above flow is what it would look like for you. If you are attempting to do legacy copies of Mac OS or Mac OS X your workflow may look a little different. I hope that giving a basic outline of the steps helps those understand where to go after creating and mounting their OpenCore disk image file. If you're ready to begin, go ahead!</h5>

<h2 align="center">You can now proceed to the <a href="../02-HostPreparations/">Host Preparations</a> section!</h2>