---
layout: default
title: Importing XML
parent: DarwinPPC.xml
grand_parent: XML Import/Usage
nav_order: 1
---

# Importing XML
#### This imports a blank Virtual Machine titled "DarwinPPC" ready to be used for Mac OS X Guests.

Run the following command in the root directory of DarwinKVM:

``virsh --connect qemu:///system define DarwinPPC.xml``

Which will now allow you to view it in Virt-Manager.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VMMDarwinPPC.png"><img src="../../../../assets/VMMDarwinPPC.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManTemplatePPCImport.png"><img src="../../../../assets/VManTemplatePPCImport.png" alt=""></a>

## You can now continue to the next <a href="../01-EnableXMLediting">page</a>.
