---
layout: default
title: About This Project
description: "This repository and its contents presented to you in the form of documentation and tools are to be an advanced guide for anyone looking to create powerful OS X / macOS Virtual Machines that can handle being daily driven, used for powerful applications, and for those who want to get the maximum possible performance out of their OS X or macOS guest"
parent: Welcome
nav_order: 2
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
  <img width="650" height="200" src="../../assets/Headers/HeaderAboutThisProject.png">
</p>

<h2 align="center">What is this? Where am I?</h2>

<h5 align="center">This repository and its contents presented to you in the form of documentation and tools are to be an advanced guide for anyone looking to create powerful OS X / macOS Virtual Machines that can handle being daily driven, used for powerful applications, and for those who want to get the maximum possible performance out of their OS X or macOS guest. The guide covers configuring a variety of QEMU Q35 machines for the entire Mac OS X / macOS Major Release Versions but its main focus will always be supporting the latest macOS release until its eventual x86_64 death, whenever that is.</h5>

<h2 align="center">Who is this for?</h2>

<h5 align="center">This is for experienced users. People in the help channels are not looking to handhold/explain/teach ideas to you! That's not really helping, especially when all of the information is here already most likely (you'll get a link as a reply to the appropriate section). For optimal results, you should already be decently familiar with the following 4 core concepts and how the subtopics relate to this project:</h5>

1. [**Linux**](https://en.wikipedia.org/wiki/Linux)
   - <span style="color: #bfa6ff;">The commandline/terminal.</span>
   - File and folder movement through commandline/terminal.
   - File and folder permissions and ownership.
   - File and folder structure of linux.
   - File editing from the commandline (nano, vim, or anything else).

2. [**QEMU**](https://www.qemu.org/)
   - [Virtual Machine Manager](https://virt-manager.org/) & Libvirtd in general.
   - [Basic understanding of manual QEMU VM creation](https://www.qemu.org/docs/master/)
   - [Kernel-Based Virtual Machines](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine)
   - How [Virtualization](https://en.wikipedia.org/wiki/Virtualization) works in general.

3. [**OpenCore Bootloader**](https://github.com/acidanthera/OpenCorePkg)
  - Previous experience with [Dortania's OpenCore Installation Guide](https://dortania.github.io/OpenCore-Install-Guide/).
  - [Why Opencore? What's wrong with other bootloaders?](https://dortania.github.io/OpenCore-Install-Guide/why-oc.html)
  - How [Creating a Bootable USB](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/) relates to us creating an .img file.

4. [**The "Mac" Operating System**](https://en.wikipedia.org/wiki/MacOS)
  - [Property List Format](https://en.wikipedia.org/wiki/Property_list) for understanding .plist files and modifying them.
  - [Kext File Format](http://www.macbreaker.com/2012/01/what-are-kexts.html#:~:text=Kext%20files%20are%20essentially%20drivers,loaded%20when%20your%20computer%20boots.)
  - <span style="color: #bfa6ff;">Previous Mac OS X / macOS experience is <b>very</b> helpful.</span>

<h5 align="center">If you feel as though you are not up to speed on any of these concepts, please take the time to first gain adequate knowledge as it will vastly improve your chances of having a working system you can daily drive. This guide is written completely from the ground up to teach others the proper way to create Virtual Machines as other guides do for baremetal. What this means for the user of any projects that are seen as the equivalent to "Prebuilt EFI's" on baremetal is no learning is involved. This causes the user to not understand why certain things are broken on their system and possibly may never fix those issues, potentially leaving them in the background, or even asking others for help repeatedly and never finding a solution.</h5>

<h5 align="center"><b>PLEASE READ CAREFULLY</b>.</h5>

<h5 align="center">Try not to ask for support before rereading, as many times you will misread something on accident or are simply not paying enough attention to what the guide is instructing you to do, as it is not a direct instruction but rather an explanation of how you decide what to choose. Take most, if not all instructions with a grain of salt and make educated assumptions based on your hardware. A lot of effort has been taken to include as much information and explanation here as possible so that everyone can learn.</h5>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../index.html">&larr; Back</a>
    <a class="nav-button" href="02-Requirements.html">Next Page &rarr;</a>
  </div>
  <br>
</h2>
