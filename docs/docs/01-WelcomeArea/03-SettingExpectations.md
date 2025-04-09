---
layout: default
title: Setting Expectations
description: "Explaining several basic issues with Virtual Machines and how to navigate them. Properly configuring the host machine is the number one requirement and you can't move past this section without understanding it fully or else you'll struggle the rest of the way."
parent: Welcome
nav_order: 3
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

  .image-container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin: 20px 0;
  }

  .image-item {
    text-align: center;
    max-width: 300px;
    margin: 0 10px;
  }

  .image-item img {
    max-width: 100%;
    height: auto;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/HeaderSettingExpectations.png">
</p>

<h2 align="center">Why Linux?</h2>
<h5 align="center">You at the moment have a choice when it comes to what software to use for hosting virtual machines, and how. The program you decide to use, has a <code>Type</code>. The idea of a <code>Type 1</code> or <code>Type 2</code> hypervisor, is simply the level of granular control you have over the guest. There is much debate on what defines a Type 1 hypervisor specifically but what makes a piece of software Type 1 or 2 is actually the ability to give physical hardware to the guest. To have that much control, is to be Type 1. In that sense, using Windows and VirtualBox or VMWare Player/Workstation, are Type 2 hypervisors because the host (Windows) does not allow for PCIe passthrough. This limits how far you can take the guest machine because you are stuck with the emulated hardware that your software provides you. As you'll learn later, OS X / macOS require a graphics card that is Metal supported (or OpenGL on older releases) for the operating system to be usable.</h5>
<br>

<h2 align="center">What happens without a supported GPU?</h2>
<div class="image-container">
  <div class="image-item">
    <h3>VESA / VGA</h3>
    <a href="../../assets/Carnations/HighSierraNoGPUAccel.gif" target="_blank">
      <img src="../../assets/Carnations/HighSierraNoGPUAccel.gif" alt="VESA / VGA">
    </a>
  </div>
  <div class="image-item">
    <h3>AMD RX 6600 8GB</h3>
    <a href="../../assets/Carnations/SonomaGPUAccel.gif" target="_blank">
      <img src="../../assets/Carnations/SonomaGPUAccel.gif" alt="AMD RX 6600 8GB">
    </a>
  </div>
</div>
<h4 align="center"><i>These are both QEMU virtual machine guests on AMD hardware</i></h4>
<br>
<h5 align="center">When you run the Mac operating system without a properly supported graphics card, you are running the entire OS in VESA / VGA mode. This means you have 0 graphics acceleration, it is being done via CPU rendering, which as you can see above is a non usable experience. Imagine if your Windows PC did not have a graphics card, that's basically what you're doing to your OS X / macOS guest. Virtual Machine softwares do not provide guests with emulated graphics cards that are complex and capable of rendering 3D. Most software provide a basic VGA or SVGA compatible GPU, and VGA Display for output. The Mac operating system heavily relies on a GPU to properly use, because every Mac has always <i>had</i> a GPU that worked (iGPU, or dGPU), and makes heavy use of it for things like Drop Shadows, Gaussian Blur, Dock Transparency, Minimizing/Maximizing animations, and other Aqua effects. <i>The experience is much worse than non accelerated Windows, and is considered to be unusable in this state as it is not intended to be in VGA fallback on any Apple hardware.</i></h5>

<h5 align="center">This is actually why VirtualBox and VMware are not supported platforms for hosting OS X / macOS guests (Not to mention the fact that they require Unlockers, and the respective companies do not provide support for running the Mac operating system as guests). With the requirement of a real natively supported GPU, means the requirement of a Type 1 Hypervisor that can do PCIe passthrough, which is essentially used to move a real GPU to the Virtual Machine, which can only be done with platforms like Hyper-V on Windows Server and KVM on Linux hosts. For this project, we use Linux as it already comes with kernel modules for PCIe passthrough. Moving forward, we expect you to be using a modern Linux host and kernel.</h5>
<br>

<h2 align="center">So, Virtual or Bare Metal?</h2>
<h5 align="center">If you suddenly thought, I want to run OS X / macOS as a VM and don't have much experience with advanced virtual machine management and usage along with background understanding of the logic for extending the hardware of your Virtual Machines, then it's going to be very understandably tough to understand and come to terms with limitations that cannot be circumvented. For starters, when it comes to managing a Hypervisor machine, your goal is to <code>containerize</code> various operating systems you already ran, run, or can run on your host hardware configuration. What this basically means is that, you first need to be able to run (or have the hardware to run) OS X / macOS natively on the host machine before you even consider using it as a virtual machine.</h5>
<h5 align="center">That means your CPU, and GPU must both be supported on OS X / macOS prior to continuing with any configuration of DarwinKVM. Using Linux + QEMU carries several advantages over bare metal under specific circumstances. The main point would be known as <code>Hardware Abstraction</code> which means that you are leveraging emulated hardware as a way to abstract or mitigate issues your own physical hardware would face if it was running the guest OS natively. On Intel CPUs newer than 10th Generation, you would get native power management and CPU clocking from using Linux as a host. On AMD CPUs, you can spoof as an Intel CPU to mitigate all AMD CPU related issues such as patching applications, and not requiring AMD Vanilla Patches.</h5>
<h5 align="center">For both AMD and Intel, if you have multiple NVMes or SSDs, along with other pieces of hardware which do not play nice natively such as a motherboard, you can simply not pass that hardware through and leave it for Linux. An example would be an unsupported NVMe drive that Kernel Panics and you cannot disable via SSDTs, but that you instead use to run Linux and host a virtual raw <code>.img</code> file for the virtual machine's paravirtualized VirtIO NVMe. At the end of the day, this project enables you to simply require a GPU that is known to be natively supported by the OS X / macOS guest so that you can move it over and enjoy graphics acceleration on any release, even if that release is not able to run on bare metal. (i.e Snow Leopard on AMD with ATI GPU)</h5>
<br>

<h2 align="center">What are the differences between this and similar projects?</h2>
<h5 align="center">The major distinction is that this is not something you can use right away. You must read a fair amount first. Virt-Manager, QEMU, PCIe Object passthrough, OpenCore Bootloader, Kexts, config.plist, OVMF... these things already exist. They're all either software/files, guides, or concepts of Linux/OS X/macOS. We're putting all of these things together in these Docs to help you build your own machine from scratch with security and learning in mind. The goal is to walk through the entire process from fresh Linux install to fully complete Hypervisor.</h5>
<br>

<h2 align="center">Do I have to read everything then?</h2>
<h5 align="center">The Docs are broken up into nice sections for easily going through the process. In the next page you'll learn more about how to use the information here! It is not possible to say that you'll need to read all of them, as it will heavily depend on your harware but for the most part, the standardization of DarwinKVM allows for minimal post-setup. While the ordering being linear, helps keep you on track unless a skip is needed.</h5>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="02-Requirements.html">&larr; Back</a>
    <a class="nav-button" href="04-DocsExplained.html">Next Page &rarr;</a>
  </div>
  <br>
</h2>
