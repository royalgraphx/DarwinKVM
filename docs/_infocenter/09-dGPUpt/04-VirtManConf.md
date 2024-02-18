---
layout: default
title: Configuring Virt-Manager
parent: Dual GPU Passthrough
nav_order: 4
---

# Configuring Virt-Manager
#### Adding your GPU to the guest.

{: .note }
Screenshots are not fully updated yet.

## Removing the virt-manager Display

First things first, we must remove the ``Spice Display`` and ``Video Virtio`` from the left hand side in our Virt-Manager window for DarwinKVM. As you can see here, they are now removed.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughRemoveVirtIODisplay.png"><img src="../../../assets/VManGPUPassthroughRemoveVirtIODisplay.png" alt=""></a>

## Removing recoveryOS Keyboard & Mouse

Now let's go ahead and remove the recoveryOS Keyboard and Mouse as we'll now be passing through our actual USB controllers later. You'll have to select the ``Overview`` tab on your left-hand side, and swap to the XML tab at the top. Scroll to the very bottom and delete and save this change.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughRemoveRecoveryKBM.png"><img src="../../../assets/VManGPUPassthroughRemoveRecoveryKBM.png" alt=""></a>

## Enabling Topoext / AMD Simultaneous Multithreading (SMT) for Multithreading

If you have an AMD CPU, you should enable Topoext / AMD Simultaneous Multithreading (SMT) for the guest.

```
<feature policy='require' name='topoext'/>
```

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughAddMultithreading.png"><img src="../../../assets/VManGPUPassthroughAddMultithreading.png" alt=""></a>

## IOMMU Groups

Now here's the tricky bit. You'll need to check your IOMMU groups. This can be done within the DarwinKVM repository by simply issuing the command ``./iommu-check.sh``

Sample Output, this is a host using [Zen Kernel](https://github.com/zen-kernel/zen-kernel) and [ACS Patches](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Bypassing_the_IOMMU_groups_(ACS_override_patch)):

Note that you will not get this output, you will see multiple devices within groups, <span style="color: #ffab52;">**you can only pass through devices in a group, if you can pass the entire group**</span>. This means that if your GPU and Ethernet are in the same group, you must pass through the entire group. This is where many people will run into issues. You can read more about this <a href="../../../docs/02-HostPreparations/06-IOMMU">here</a>.

<b>And remember for later, DO NOT ADD BRIDGES to your VM, that means devices like PCI bridge [0604] in your groups. </b>

```
IOMMU Group 21:
	03:09.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device [1022:43ea]
IOMMU Group 22:
	04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF100 [GeForce GTX 470] [10de:06cd] (rev a3)
IOMMU Group 23:
	04:00.1 Audio device [0403]: NVIDIA Corporation GF100 High Definition Audio Controller [10de:0be5] (rev a1)
IOMMU Group 24:
	05:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller 980 (DRAM-less) [144d:a809]
IOMMU Group 25:
	07:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3] (rev 02)
```

<span style="color: #ffab52;">If everything seems fine, if you think that you can pass your USB controllers, and Graphics card + it's audio without issues, you can move on.</span>

## Adding GPU + Audio

Let's go ahead and add the GPU and its Audio to our Virtual Machine.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughAddSecondaryGPU.png"><img src="../../../assets/VManGPUPassthroughAddSecondaryGPU.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughAddSecondaryGPUAudio.png"><img src="../../../assets/VManGPUPassthroughAddSecondaryGPUAudio.png" alt=""></a>

## Correcting GPU Multifunction + Audio Bus

Here's what a lot of people don't check. This will be required here as on macOS if you want your HDMI/DP Audio to work, this must be configured correctly. Windows doesn't care so it's not an issue.

Essentially, your GPU and Audio must be on the same ``Bus`` in the Virtual Machine, but your Audio must be a ``Function`` of the GPU. Thus creating a multifunction GPU in the VM which has an accompanying Audio device. This displays the GPU as a single unit. Allowing for HDMI/DP Audio in macOS.


Go Ahead and select your GPU from the left-hand side. Note the Bus assigned.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughFindGPUBus.png"><img src="../../../assets/VManGPUPassthroughFindGPUBus.png" alt=""></a>

Go Ahead and select your Audio from the left-hand side. Note the Bus assigned does not line up with that which was assigned to the GPU. We will now correct it to the same value. You must also switch the ``0x0`` to ``0x1`` to assign the Audio as a ``Function`` of the GPU device.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughCorrectAudioBusBefore.png"><img src="../../../assets/VManGPUPassthroughCorrectAudioBusBefore.png" alt=""></a>

The corrected Audio device:

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughCorrectAudioBusAfter.png"><img src="../../../assets/VManGPUPassthroughCorrectAudioBusAfter.png" alt=""></a>

Now you can see the GPU is a multifunction device.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughCorrectedGPUMultifunction.png"><img src="../../../assets/VManGPUPassthroughCorrectedGPUMultifunction.png" alt=""></a>

## Adding USB Controllers

Go ahead and add your USB Controllers as you'll need to use your Keyboard and Mouse now.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManDualGPUPassthroughAddUSBController1.png"><img src="../../../assets/VManDualGPUPassthroughAddUSBController1.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManDualGPUPassthroughAddUSBController2.png"><img src="../../../assets/VManDualGPUPassthroughAddUSBController2.png" alt=""></a>

## Adding NVMe (Optional)

If you have two NVMe drives in your system, and you'd like to dedicate one completely to the installation of macOS for maximum performance, you can add your NVMe drive. It still needs to be supported by macOS, or at least not reported to be problematic with macOS. I won't be adding it, but here it is for the example. For more information about whether or not you can pass your NVMe drive, please refer to the following [Support Table](../../05-NVMeSupport/index).

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManDualGPUPassthroughAddNVME.png"><img src="../../../assets/VManDualGPUPassthroughAddNVME.png" alt=""></a>

## Example VM ready to start

If you've gone ahead and verified everything, your IOMMU groups, and your multifunction GPU, you are now ready! Here's an example of what a completed GPU Passthrough Virt-Manager will look like. Note that in this example image, the BaseSystem.dmg is still included within the OpenCore image.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManGPUPassthroughCompletedExample.png"><img src="../../../assets/VManGPUPassthroughCompletedExample.png" alt=""></a>

## You can now continue to the next <a href="../05-Finish">page</a>.