---
layout: default
title: ACPI Tables
parent: OpenCore Files Overview
nav_order: 2
---

# ACPI Tables
#### This section has been derived from the <a href="https://dortania.github.io/Getting-Started-With-ACPI/">Getting Started with ACPI</a> guide. It may be out of date. Please refer to latest documentation when possible.

{: .note }
So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT (Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT (Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project.

#### You can read more about ACPI and it's specs [here](https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf).

# What would we need?

macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:

 - Embedded controller (EC)
   - macOS Catalina+ requires a device named EC to be present, so we create a dummy EC. The USBX devices (See next) also requires an EC device to work.
 - USBX
   - This sets the correct USB power properties for charging devices like phones.
 - Plugin type
   - This generally allows the use of XCPM providing native CPU power management on Intel CPUs. Our version will enable VMPlatformPlugin XCPM, exactly like a Parallels VM.

For our Virtual Machine use case, we will be emulating an Intel Cascade Lake CPU <span style="color: #ffab52;">so regardless of the host architecture, the only ACPI's we require to boot macOS will be SSDT-EC-USBX and SSDT-PLUG.</span>

Thanks to [ExtremeXT](https://github.com/ExtremeXT) for allowing me to include his manually created SSDT-EC-USBX which combines them into a single file, as well as the included SSDT-PLUG file. We've both tested it and it works as expected, and I use it for my daily machine so I'm confident including it, feel free to manually make your own or possibly try the ones from Acidanthera! As long as you complete this ACPI section, you can go ahead to the next step.

You can view the baremetal CPU ACPI requirements by generation [here](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-platform.html#desktop).

{: .note }
Cascade Lake supersedes Skylake although not shown on the chart.

<h3><span style="color: #ffab52;">The required files can be found in the DarwinOCPkg/X64/EFI/OC/ACPI folder.</span></h3>

## You can now continue to the next <a href="../02-Drivers">page</a>.
