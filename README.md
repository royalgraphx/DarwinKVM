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

<br>

* <b>PATIENCE! This is NOT a Pre-Built EFI! You are responsible for completing it!</b>

</br>
<h1 align="center">What is this for?</h1>

This repository and its contents are to be a continuation of my work on [LegacyOSXKVM](https://github.com/royalgraphx/LegacyOSXKVM). The goal of that project was to allow anyone to quickly revisit some of their favorite versions of Mac OS X as it was known to many for years with its various releases. Snow Leopard was the main focus of that project, and as such had the most effort put into it. Nowadays we need to be on modern versions of macOS to enjoy the latest and greatest offered from Apple. The focus has now shifted to providing an Up-to-Date, Out of Box (OOB), Clean Template for creating Virtual Machines of the latest versions offered by Apple. As of writing this, you can create a powerful VM of macOS Ventura, Monterey, and even Sonoma works. The guides in this repository will help you continuously work on your virtual machine to make it the perfect experience. Things will not work right away, you will slowly keep fixing them as you discover what must be fixed.

</br>
<h1 align="center">Who is this for?</h1>

This is for experienced users. You should already be familiar with 3 core concepts: [Virtualization](https://libvirt.org/)/[QEMU](https://www.qemu.org/docs/master/), [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/), and [macOS](https://en.wikipedia.org/wiki/MacOS). If you feel as though you are not up to speed on any of these concepts, please take the time to first gain adequate knowledge as it will vastly improve your chances of having a working system you can daily drive. This guide is written completely from my perspective as I've learned throughout my time in the Hackintosh community. What you would typically do if you wanted to run macOS on your system you would have to use the OpenCore bootloader to provide macOS with the necessary information it needs. A Virtual Machine is no different. In theory, what we are simply doing is creating an OpenCore disk image that acts as if it were the equivalent of a USB or an EFI partition post-installation. While there exist many projects that utilize QEMU/KVM, for daily driving you must have a compatible GPU. What this means for the user of any projects that are seen as the equivalent to "Prebuilt EFI's" is that there is no learning involved. This causes the user to not understand why certain things are broken on their system and possibly may never fix those issues, potentially leaving them in the background. This guide is for those who are looking to properly create a macOS Virtual Machine from the ground up. <b>PLEASE READ CAREFULLY.</b> Try not to ask for support before rereading, many times you will misread something on accident or are simply not paying enough attention to what it's instructing you to do. 

<br>
<h1 align="center">Host Preparations</h1>

<h2 align="center"><b>Part 1:</b> BIOS Settings</h2>
<h4 align="center">Will depend on your Host Hardware.</h4>
<h4 align="center">This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/1)-Preparations">Preparations</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.</h4>
<br>

Depending on your machine's CPU, you need to enable certain settings in your BIOS for your passthrough to succeed. Enable the settings listed in this table:

<br>

| AMD  | Intel |
| ---- | ----- |
| IOMMU | VT-D |
| NX Mode | VT-X |
| SVM Mode | No Equivalent |

<br>

<b>Note for Intel:</b> You may not have both options, in that case, just enable the one available to you.
If you do not have any virtualization settings, like said before make sure your BIOS is up to date, and that your CPU and motherboard support virtualization.

<br>
<br>
<br>

<h2 align="center"><b>Part 2:</b> GRUB Configuration</h2>
<h4 align="center">Enabling flags needed for Virtualization/QEMU/KVM/libvirtd</h4>
<h4 align="center">This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/2)-Editing-GRUB">Editing GRUB</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.</h4>
<br>

<br>

Start by using your favorite terminal text editor. In this example, we'll be using nano.

```
sudo nano /etc/default/grub
```

We'll need to check our GRUB CMD Line flags and add various ones depending on the users' hardware.

| AMD / AMD GPU  | Intel CPU | Needed Regardless|
| ---- | ----- | ----- |
| amd_iommu=on | intel_iommu=on | iommu=pt |
| video=efifb:off |  |  |

Example GRUB configuration for an AMD CPU host.

```
amd_iommu=on iommu=pt video=efifb:off
```

When you're done make sure you use ``grub-mkconfig`` to update the GRUB Bootloader. Restart Required.

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

<br>
<br>

<h2 align="center"><b>Part 3:</b> Bridge Networking</h2>
<h4 align="center">Creation of the Bridge interface for your DKVM.</h4>
<h4 align="center">This section has been derived from the <a href="https://github.com/royalgraphx/DarwinKVM/tree/main/BridgeNetworking">Bridge Networking</a> Submodule.</h4>
<br>

<br>

<h3 align="center"><b>Overview</b></h3>

<br>

First things first, I highly recommend you take the time out of your day to not skip this process, just as you shouldn't skip over any other steps. To understand the point of a network bridge, you'll need to know that when you use QEMU or Virt-Manager to start a Virtual Machine with networking, you will typically be using the default network provided by libvirt. This creates its own DHCP server, meaning that our Machines are created with IP addresses such that, we see "192.168.68.2" or something along those lines, which does not match up with our local IPs on our broader network. The point of setting this Bridge interface up is to strip our ethernet controller of an assigned IP address and stop any other Network Managers that may be present on the users' system so that we can leverage systemd-networkd to automate the bridge creation. What it simply does, is create a new interface named "br0". It then modifies the users' current ethernet interface to "master br0", meaning that br0 is now providing the information to the users' physical ethernet interface. We then give br0 an IP address via DHCP using ipv4. When we use Virt-Manager in this configuration, we can use a bridge interface, we set it to ``br0`` and the result is our Virtual Machines now appear on the broader network as physical, real devices. Allowing SSH via and to any other devices on the LAN.

<br>

<h2 align="center"><b>A. Goal Examples</b></h2>

<br>

<h3 align="center">This is the guest macOS talking to devices on the broader network.</h3>

<p align="center">
  <img src="./Assets/BridgeNetworkingHypervisorSSH.png">
</p>

<p align="center">
  <img src="./Assets/BridgeNetworkingLocalTerminal.png">
</p>

<p align="center">
  <img src="./Assets/BridgeNetworkingRPI.png">
</p>

<p align="center">
  <img src="./Assets/BridgeNetworkingRouterDash.png">
</p>

<br>

<h2 align="center"><b>B. Prerequisites to the script</b></h2>

<br>

In my opinion, this is the number one step to set up practically right after the installation of a new host operating system. Allowing your virtual machines to be visible to the broader network may seem like something you can ignore, and while you very well can... I enjoy my Virtual Machines appearing as real, physical ethernet devices. The most popular and commonly used package for managing your network connection will most likely be "NetworkManager", and this can be checked by issuing a systemctl command to check the status.

```
sudo systemctl status NetworkManager
```

If you see that it is running, you can choose to stop it but for this guide, we'll be making use of the DKVM Bridge Networking submodule. It contains a script that will quickly go through a few checks and create a bridge interface for your use. You must have systemd in some form, install it prior or check your system for systemd-networkd with the following command.

```
sudo systemctl status systemd-networkd
```

For more information and the completion of this section, refer to [Bridge Networking](https://github.com/royalgraphx/DarwinKVM/tree/main/BridgeNetworking).


<br>
<br>

<h2 align="center"><b>Part 4:</b> Package Installation</h2>
<h4 align="center">Package requirements for base DKVM.</h4>
<h4 align="center">This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt
</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.</h4>
<br>

Since everything in this guide is outlined for simply Arch, you may need to find the package equivalent to your system. Here is the command to install all required packages.

```
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf
```

Please note: Conflicts may happen when installing these programs.
A warning like the below example may appear in your terminal:

```
iptables and iptables-nft are in conflict. Remove iptables? [y/N]
```

If you do encounter this kind of message, press y and enter to continue the installation.

<br>
<br>

<h2 align="center"><b>Part 5:</b> Libvirtd Configuration</h2>
<h4 align="center">Necessary changes to use Virt-Manager via User.</h4>
<h4 align="center">This section has been derived from the <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/4)-Configuration-of-libvirt">Configuration of libvirt
</a> section via <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/home">RisingPrism</a>.</h4>
<br>

<br>

<h2 align="center"><b>A. Modifying Files</b></h2>

<br>

There are two files we must edit. Please make the changes accordingly. Not too much to say, follow this step-by-step and you'll be fine along with getting logs printed.

<br>

Use your favorite text editor to make the following changes:
```
/etc/libvirt/libvirtd.conf
```

``Read/Write permissions and Group - Uncomment the following lines.``

```
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```

``Logging - Add to the very bottom.``

```
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```

<br>
<br>

Use your favorite text editor to make the following changes:
```
/etc/libvirt/qemu.conf
```

``Read/Write permissions and Group - Uncomment and Edit the following lines.``

```
user = "root"
group = "root"

To username:

user = "royalgraphx"
group = "royalgraphx"
```

<br>

<h2 align="center"><b>B. Libvirtd Services</b></h2>

<br>

You now need to add your user to the libvirt group, to allow libvirt to write files properly.

```
sudo usermod -a -G kvm,libvirt $(whoami)
```

Now enable, start, and restart the libvirtd Service to fully apply changes.

```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo systemctl restart libvirtd
```


<br>
<h1 align="center">OpenCore Configuration</h1>
<h2 align="center">Current OpenCorePkg supported: 0.8.8</h2>
<p align="center">
  <img src="./Assets/OpenCorePkgBase.png">
</p>


<br>
<h2 align="center"><b>Part 1:</b> ACPI Tables</h2>
<h4 align="center">This section has been derived from the <a href="https://dortania.github.io/Getting-Started-With-ACPI/">Getting Started with ACPI</a> guide. It may be out of date.</h4>
<br>

``So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT(Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT(Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project.``

You can read more about ACPI and it's spec [here](https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf).

``macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:``

 - Embedded controllers(EC)
   - All semi-modern Intel machines have an EC (usually called H_EC, ECDV, EC0, etc...) exposed in their DSDT, with many AMD systems also having it exposed. These controllers are generally not compatible with macOS and can cause a kernel panic, so they need to be hidden from macOS. macOS Catalina requires a device named EC to be present though, so a dummy EC is created.
 - Plugin type
   - This allows the use of XCPM providing native CPU power management on Intel Haswell and newer CPUs, the SSDT will connect to the first thread of the CPU.


For our Virtual Machine use case, we will be emulating an Intel Cascade-Lake CPU so regardless of the host architecture, the only ACPI's we require to boot macOS will be EC and PLUG.

You can view the CPU ACPI requirements by generation [here](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-platform.html#desktop). 

``Note: Cascade Lake supersedes Skylake although not shown on the chart.``

<br>
<h4><b>The required files can be found in the DarwinOCPkg/ACPI folder.</b></h4>

<br>
<h2 align="center"><b>Part 2:</b> Drivers</h2>
<h4 align="center">This section has been derived from the <a href="https://dortania.github.io/OpenCore-Install-Guide/installer-guide/opencore-efi.html">Adding The Base OpenCore Files</a> guide. It may be out of date.</h4>
<br>

``Now something you'll notice is that it comes with a bunch of files in Drivers and Tools folder, we don't want most of these:``
 - Keep the following from Drivers (if applicable):

| Driver  | Status | Description | 
| ----- | ----- | ----- |
| OpenRuntime.efi | Required | Required for proper operation |
| ResetNvramEntry.efi | Required | Required to reset the system's NVRAM |
| OpenHfsPlus.efi | Optional | Open sourced HFS Plus driver, quite slow so we recommend not using unless you know what you're doing |