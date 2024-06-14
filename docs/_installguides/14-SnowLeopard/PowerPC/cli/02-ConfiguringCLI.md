---
layout: default
title: Configuring QEMU
parent: PowerPC (CLI)
grand_parent: Snow Leopard
nav_order: 3
---

# Configuring QEMU
#### Customization of a script to boot PowerMac via CLI.

{: .headsup }
None of the Configuring CLI pages include steps of within the OS X installation! This page assumes you can go through the OS X installation process on your own, but explains key knowledge for changing the boot order for post installation.

All DarwinPPC Installation Targets come with an accompanying Template.sh located within the ``DarwinPPC`` folder from the root of the DarwinKVM repository.

This guide targets Snow Leopard, as such, we will use ``Template-SnowLeopard.sh`` to run this release via CLI.

Theoretically, all you have to do at the moment is simply update the following line to tell QEMU to boot from the Installation Media that is on the CD-ROM Drive.

{: .important }
Specify C to boot from the Hard Drive, and specify D to boot from the first CD-ROM device !

```bash
-boot d \
```

You can now start the Virtual Machine, and run through the Mac OS X Cheetah Installation Process.

Once prompted to restart the machine, you should instead fully shut it down.

Update the script once more, to return the boot option to the C drive.

```bash
-boot c \
```

After a few seconds, you will begin seeing Verbose Boot of your installation.

## You can now continue to the next <a href="../03-Completion">page</a>.
