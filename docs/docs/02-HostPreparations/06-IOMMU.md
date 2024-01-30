---
layout: default
title: IOMMU Viability
parent: Host Preparations
nav_order: 6
---

# IOMMU Viability
#### How to read and understand your IOMMU groups for viability.

{: .warning }
ACS Patches do **NOT** physically change your IOMMU groups. They simply trick the Linux kernel into thinking objects (PCI Devices) are in seperate groups, thus QEMU does not complain. Be aware that because this is a software-side modification, there are always risks to using patches like these. While it is safe to use, even daily, be aware that DarwinKVM is not responsible for any sort of corruption that can occur. i.e forcing nonviable NVMe drives into your guest, leading to corruption in the event of any sort of PCI bus error or any other shenanigans.

{: .warning }
If you do not see any output from running the ``./iommu-checker.sh`` script, this may indicate your motherboard does not have IOMMU support! Make sure all BIOS settings have been activated prior to reading this section! IOMMU Support is required for passing physical devices to a guest.

{: .highlight}
Make sure to ignore PCI Bridges, Host Bridges, Non-Essential Instrumentation, and Encryption Controllers when considering passing *all* objects through when groups *are* viable.

This page serves as an introduction to understanding the basics of IOMMU group viability. What we mean by this is simply that the intended object/device you are interested in isolating and passing through to a Virtual Machine, must not reside in any groupings that will force you to passthrough unwanted objects. This is because to successfully passthrough PCIe objects/devices to a QEMU Guest, you must pass every object/device in the same group. This can become problematic in situations where you want to passthrough a USB Controller, but it's in the same group as your Ethernet Controller. Other times, your GPU could be in two different groups, making it impossible to passthrough all devices and objects in both groups to simply passthrough the GPU successfully.

{: .note}
The following output has been modified to create a situation where an issue would arise. Not indicative of real output.

Here is some example IOMMU output that would be deemed unviable:

```bash
IOMMU Group 0:
        01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Black SN770 / PC SN740 256GB / PC SN560 (DRAM-less) NVMe SSD [15b7:5017] (rev 01)
        02:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset USB 3.1 xHCI Compliant Host Controller [1022:43d5] (rev 01)
        02:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset SATA Controller [1022:43c8] (rev 01)
        03:04.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset PCIe Port [1022:43c7] (rev 01)
        05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
IOMMU Group 1:
        00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Host Bridge [1022:1482]
IOMMU Group 11:
        0a:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Function [1022:148a]
IOMMU Group 12:
        0b:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Reserved SPP [1022:1485]
IOMMU Group 13:
        0b:00.1 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Cryptographic Coprocessor PSPCPP [1022:1486]
IOMMU Group 14:
        0b:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host Controller [1022:149c]
IOMMU Group 15:
        0b:00.4 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD Audio Controller [1022:1487]
```

Let's begin by breaking this down and teaching you how to read it.

The very base is the group number.

```bash
IOMMU Group 0:
IOMMU Group 1:
IOMMU Group 11:
IOMMU Group 12:
IOMMU Group 13:
IOMMU Group 14:
IOMMU Group 15:
```

Next, we can see the PCI address.

```bash
IOMMU Group 0:
        01:00.0 
        02:00.0
        02:00.1 
        03:04.0 
        05:00.0 
IOMMU Group 1:
        00:02.0
IOMMU Group 11:
        0a:00.0
IOMMU Group 12:
        0b:00.0
IOMMU Group 13:
        0b:00.1
IOMMU Group 14:
        0b:00.3
IOMMU Group 15:
        0b:00.4
```

Then we are told the kind of device we are looking at.

```bash
IOMMU Group 0:
        01:00.0 Non-Volatile memory controller
        02:00.0 USB controller
        02:00.1 SATA controller
        03:04.0 PCI bridge <- IGNORE !!! DO NOT PASSTHROUGH BRIDGES
        05:00.0 Ethernet controller
IOMMU Group 1:
        00:02.0 Host bridge <- IGNORE !!! DO NOT PASSTHROUGH BRIDGES
IOMMU Group 11:
        0a:00.0 Non-Essential Instrumentation <- IGNORE !!! DO NOT PASSTHROUGH
IOMMU Group 12:
        0b:00.0 Non-Essential Instrumentation <- IGNORE !!! DO NOT PASSTHROUGH
IOMMU Group 13:
        0b:00.1 Encryption controller <- IGNORE !!! DO NOT PASSTHROUGH
IOMMU Group 14:
        0b:00.3 USB controller
IOMMU Group 15:
        0b:00.4 Audio device
```

Followed by the actual device manufacturer and device.

```bash
IOMMU Group 0:
        01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Black SN770 / PC SN740 256GB / PC SN560 (DRAM-less) NVMe SSD
        02:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset USB 3.1 xHCI Compliant Host Controller
        02:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset SATA Controller
        03:04.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset PCIe Port
        05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
IOMMU Group 1:
        00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Host Bridge
IOMMU Group 11:
        0a:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Function
IOMMU Group 12:
        0b:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Reserved SPP
IOMMU Group 13:
        0b:00.1 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Cryptographic Coprocessor PSPCPP
IOMMU Group 14:
        0b:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host Controller
IOMMU Group 15:
        0b:00.4 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD Audio Controller
```

Now that you can fully read the output, if my goal was to passthrough my front panel and back panel USB Controllers to my DarwinKVM Virtual Machine, at the moment this is not possible because of my IOMMU Groups being non-viable. The reason for this is because if the User would like to passthrough all of his USB ports, they must passthrough the following objects:

```bash
IOMMU Group 0:
        02:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset USB 3.1 xHCI Compliant Host Controller [1022:43d5] (rev 01)

IOMMU Group 14:
        0b:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host Controller [1022:149c]
```

But as you can see, the rule of having to passthrough every object would mean to successfully complete their goal of using the USB Controllers, they unfortunately must end up also sending over the following objects/devices in Group 0:

```bash
IOMMU Group 0:
        01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Black SN770 / PC SN740 256GB / PC SN560 (DRAM-less) NVMe SSD [15b7:5017] (rev 01)
        02:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset SATA Controller [1022:43c8] (rev 01)
        05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
```

This unintentionally requires the User to also give their SATA Controller, and NVMe Controller. Both which could potentially be where the Linux Host is running from, making it impossible to do this. As for us on DarwinKVM, the additional problem of the Ethernet Controller makes this also a non-viable group and makes the intended goal of being able to use USB ports in the Virtual Machine a pain and near impossible.

Another possible problematic situation may arise when doing GPU Passthrough, or even a GPU device in general can cause problems, as your primary or secondary GPU may be in a group that will prevent you from considering it viable. An example is below of a GPU that is not in it's own group and in two different groups:

```bash
IOMMU Group 8:
        00:1f.0 ISA bridge [0601]: Intel Corporation B85 Express LPC Controller [8086:8c50] (rev 05)
        01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] [10de:1c03] (rev a1)
        00:1f.2 SATA controller [0106]: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] [8086:8c02] (rev 05)
        00:1f.3 SMBus [0c05]: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller [8086:8c22] (rev 05)
IOMMU Group 9:
        01:00.1 Audio device [0403]: NVIDIA Corporation GP106 High Definition Audio Controller [10de:10f1] (rev a1)
```

{: .headsup}
If you've reviewed your IOMMU Groups and validated their Viability... you may continue to the next page. You do not need to read the rest of the page.

## You can now continue to the next <a href="../03-DiskProvision/">page</a>.

# Using ACS Patches to re-order IOMMU Groups

If you've found that your USB Controllers or GPU are in non-viable groups, and know you require them for future use you can attempt to use a custom kernel that has [ACS Override Patches](https://github.com/benbaker76/linux-acs-override).

Examples of Kernels that have ACS:

- Zen Kernel
- Liquorix Kernel

Once you've successfully installed a custom kernel that supports ACS Override on your distribution, you may enable it in your boot arguments via GRUB or sysd-bootd by adding the following line:

``pcie_acs_override=downstream,multifunction``

Once you reboot your system, and check your groups again with ``./iommu-checker.sh`` you should see your groups broken up.

Example of non ACS Overridden group that is non-viable:

```
IOMMU Group 2:
	00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
	00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus [1022:1635]
	00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus [1022:1635]
	05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir [1002:1636] (rev d8)
	05:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Device [1002:1637]
	05:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) Platform Security Processor [1022:15df]
	05:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1 [1022:1639]
	05:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1 [1022:1639]
	05:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller [1022:15e3]
	06:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] [1022:7901] (rev 81)
```

Example of ACS Overridden groups:

```
IOMMU Group 0:
	00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
IOMMU Group 1:
	00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge [1022:1633]
IOMMU Group 2:
	00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
IOMMU Group 3:
	00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge [1022:1634]
IOMMU Group 4:
	00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge [1022:1634]
IOMMU Group 5:
	00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge [1022:1634]
IOMMU Group 6:
	00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
IOMMU Group 7:
	00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus [1022:1635]
IOMMU Group 8:
	00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus [1022:1635]
IOMMU Group 9:
	00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller [1022:790b] (rev 51)
	00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge [1022:790e] (rev 51)
IOMMU Group 10:
	00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 0 [1022:1448]
	00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 1 [1022:1449]
	00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 2 [1022:144a]
	00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 3 [1022:144b]
	00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 4 [1022:144c]
	00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 5 [1022:144d]
	00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 6 [1022:144e]
	00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir Device 24: Function 7 [1022:144f]
IOMMU Group 11:
	01:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983 [144d:a808]
IOMMU Group 12:
	02:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983 [144d:a808]
IOMMU Group 13:
	03:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
IOMMU Group 14:
	04:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200 [8086:2723] (rev 1a)
IOMMU Group 15:
	05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir [1002:1636] (rev d8)
IOMMU Group 16:
	05:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Device [1002:1637]
IOMMU Group 17:
	05:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) Platform Security Processor [1022:15df]
IOMMU Group 18:
	05:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1 [1022:1639]
IOMMU Group 19:
	05:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1 [1022:1639]
IOMMU Group 20:
	05:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller [1022:15e3]
IOMMU Group 21:
	06:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] [1022:7901] (rev 81)
PCI
```

As you can see, with software kernel patches, we can quickly get around some non-viable situations and setups. Please remember the initial notes and warnings at the top of the page, this is not a permanent solution! If your motherboard IOMMU Groups are wonky, a BIOS update could potentially reorder them. Remember to use caution when attempting such things and be aware that this is a hardware limitation you may hit and there is not much to do but get a different motherboard with better IOMMU support. Plenty of other VFIO places with suggestions for better hardware compatbility!

## You can now continue to the next <a href="../03-DiskProvision/">page</a>.