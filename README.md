<p align="center">
  <img width="650" height="200" src="./Assets/Header.png">
</p>

<h1 align="center">An Advanced Template for running macOS within QEMU/KVM</h1>
<h4 align="center">Features: Clean EFI Template for maximum customizability before boot, Compatibility with RisingPrism's Single GPU Passthrough, DisplayOverrides for repairing incompatible monitors, Custom Memory Mapping, Custom USB Mapping, Fake Core Count for incompatible CPU Topology, Host CPU Overclocking, Host Network Bridge for VM visibility, AMD GPU Zero-RPM Disable and custom sPPT Fan Curve! as well as many more advanced tutorials ready to further perfect your experience!</h4>

### Requirements

* A compatible graphics card. <b>This is a must, don't bother if you're not getting GPU Accel.</b> please reference this [list](https://dortania.github.io/GPU-Buyers-Guide/) to verify.
  * There are some exceptions, if you're crazy and want to use a legacy NVIDIA GPU, please reference this [list](https://elitemacx86.com/threads/nvidia-gpu-compatibility-list-for-macos.614/) to check macOS/OCLP compatibility. If it's supported, there is a section down for Legacy NVIDIA Patching.

* A modern Linux distribution. E.g. Arch Based for the latest packages, my personally tested and working are:
  * EndeavourOS
  * ArcoLinuxB Plasma
  * Pure Arch

* A CPU with Intel VT-x / AMD SVM support is required (`grep -e vmx -e svm /proc/cpuinfo`)

* A CPU with SSE4.1 support is required for >= macOS Sierra

* A CPU with AVX2 support is required for >= macOS Mojave

* Previous experience creating an EFI for your bare metal system and/or reading/understanding the [Dortania OpenCore Guide](https://dortania.github.io/OpenCore-Install-Guide/)

* Various Software/Packages, some optional, some not:
  * qemu
  * libvirtd/virtmanager
  * Python 3 installed with the tkinter package
  * dmg2img
  * qemu-img
  * [RisingPrism's Single GPU Passthrough Scripts](https://gitlab.com/risingprismtv/single-gpu-passthrough)
  * [ProperTree](https://github.com/corpnewt/ProperTree)
  * [GenSMBios](https://github.com/corpnewt/GenSMBIOS)
  * [Hackintool](https://github.com/benbaker76/Hackintool)
  * [SSDTTime](https://github.com/corpnewt/SSDTTime)
  * [UtilityKit](https://github.com/royalgraphx/UtilityKit)
  * <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for completing it!</b>

</br>
<h1 align="center">What is this for?</h1>

This repository and its contents are to be a continuation of my work on [LegacyOSXKVM](https://github.com/royalgraphx/LegacyOSXKVM). The goal of that project was to allow anyone to quickly revisit some of their favorite versions of Mac OS X as it was known to many for years with its various releases. Snow Leopard was the main focus of that project, and as such had the most effort put into it. Nowadays we need to be on modern versions of macOS to enjoy the latest and greatest offered from Apple. The focus has now shifted to providing an Up-to-Date, Out of Box (OOB), Clean EFI Template for creating Virtual Machines of the latest offered versions from Apple. As of writing this, you can create a powerful VM of macOS Ventura, Monterey, and even Sonoma works. The guides in this repository will help you continuously work on your virtual machine to make it the perfect experience. Things will not work right away, you will slowly keep fixing them as you discover what must be fixed.

</br>
<h1 align="center">Who is this for?</h1>

This is for experienced users. You should already be familiar with 3 core concepts: [Virtualization](https://libvirt.org/)/[QEMU], [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/), and [macOS](https://en.wikipedia.org/wiki/MacOS). If you feel as though you are not up to speed on any of these concepts, please take the time to first gain adequate knowledge as it will vastly improve your chances of having a working system you can daily drive. This guide is written completely from my perspective as I've learned throughout my time in the Hackintosh community. What you would typically do if you wanted to run macOS on your system you would have to use the OpenCore bootloader to provide macOS with the necessary information it needs. A Virtual Machine is no different. In theory, what we are simply doing is creating an OpenCore disk image that acts as if it were the equivalent of a USB or an EFI partition post-installation. While there exist many projects that utilize QEMU/KVM, for daily driving you must have a compatible GPU. What this means for the user of any projects that are seen as the equivalent to "Prebuilt EFI's" is that there is no learning involved. This causes the user to not understand why certain things are broken on their system and possibly may never fix those issues, potentially leaving them in the background. This guide is for those who are looking to properly create a macOS Virtual Machine from the ground up. <b>PLEASE READ CAREFULLY.</b> Try not to ask for support before rereading, many times you will misread something on accident or are simply not paying enough attention to what it's instructing you to do. 

</br>
<h1 align="center">Host Preparations</h1>

<h2 align="center"><b>Part 1:</b> BIOS Settings</h2>
Depending on your machine's CPU, you need to enable certain settings in your BIOS for your passthrough to succeed. Enable the settings listed in this table:
</br>

| AMD  | Intel |
| ---- | ----- |
| IOMMU | VT-D |
| NX Mode | VT-X |
| SVM Mode | No Equivalent |

<b>Note for Intel:</b> You may not have both options, in that case, just enable the one available to you.
If you do not have any virtualization settings, like said before make sure your BIOS is up to date, and that your CPU and motherboard support virtualization.

<h2 align="center"><b>Part 2:</b> Bridge Networking</h2>
