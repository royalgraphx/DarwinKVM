---
layout: default
title: Importing XML
parent: XML Import/Usage
nav_order: 1
---

# Importing XML
#### This imports a blank Virtual Machine titled "DarwinKVM" ready to be used for macOS Guests.

Run the following command in the root directory of DarwinKVM:

``virsh --connect qemu:///system define DarwinKVM.xml``

Which will now allow you to view it in Virt-Manager.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManTemplateImport.png"><img src="../../../assets/VManTemplateImport.png" alt=""></a>

Notice this template is missing a few things you must set up.

- Has no default Display
- Has no drives configured
- Has no NIC configured

Let's go through these steps quickly.

## You can now continue to the next <a href="../01-ConfigDisplay">page</a>.
