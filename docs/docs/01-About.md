---
layout: default
title: About This Project
nav_order: 2
---

<p align="center">
  <img width="650" height="200" src="../assets/HeaderAboutThisProject.png">
</p>

<h2 align="center">What is this for?</h2>

This repository and its contents are to be an advanced guide for anyone looking to create macOS Virtual Machines that can handle being daily driven, used for powerful applications, and those who want to get the maximum possible performance out of their systems. The future of the guide will expand to cover more macOS/Mac OS X versions but it's main focus will always be supporting the latest macOS until its eventual x86_64 death.

<h2 align="center">Who is this for?</h2>

This is for experienced users. You should already be familiar with 3 core concepts: [QEMU](https://www.qemu.org/docs/master/) and therefore [Virtualization](https://libvirt.org/) in general, [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/), and [macOS](https://en.wikipedia.org/wiki/MacOS). If you feel as though you are not up to speed on any of these concepts, please take the time to first gain adequate knowledge as it will vastly improve your chances of having a working system you can daily drive. This guide is written completely from my perspective as I've learned throughout my time in the Hackintosh community. What this means for the user of any projects that are seen as the equivalent to "Prebuilt EFI's" is that there is no learning involved. This causes the user to not understand why certain things are broken on their system and possibly may never fix those issues, potentially leaving them in the background. This guide is for those who are looking to properly create a macOS Virtual Machine from the ground up. <b>PLEASE READ CAREFULLY</b>. Try not to ask for support before rereading, many times you will misread something on accident or are simply not paying enough attention to what it's instructing you to do.

<h2 align="center">What are the differences between this and other similar projects?</h2>

What you would typically do if you wanted to run macOS on your system you would have to use the OpenCore bootloader to provide macOS with the necessary information it needs. A Virtual Machine is no different. This repository is not a pre-built EFI. This is a repository collective of many write-ups. These are guides to fix various issues you may run into. The difference between this and other projects is this is not something you download, you read this. Virt-Manager, QEMU, GPU Passthrough, OpenCore, OVMF, these things all exist already, they're all either software or guides and concepts of Linux. We're putting all of these things to use. In this repository you're provided with ``DarwinKVM.xml``, which is a prepared Virt-Manager importable XML. The point of this is that we've already set it to do several things: Use the Intel Cascade Lake CPU Type, added the Apple SMC chip, and stripped it of its extra controllers it adds which aren't ever used. Essentially we are creating a Cascade Lake Virtual Machine, which will use an OpenCore EFI we create, that will then allow us to boot and install macOS. Even though we are all following the same general outline, difference in hardware will still exist. Different GPU's, Audio Controllers, Host OS, Displays, RAM given to the guest, IOMMU Groups, various things can be different. So we must go in and further refine our machine. That's why the write-ups exists. If for whatever reason you find something is broken on your system, take the time and effort to read and continue to perfect your Virtual Machine. Thanks for reading. I wish you success in your attempt!

<h2 align="center">You can now proceed to the <a href="02-HostPreparations/">Host Preparations</a> section!</h2>
