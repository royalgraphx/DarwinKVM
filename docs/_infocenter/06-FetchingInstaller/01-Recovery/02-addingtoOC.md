---
layout: default
title: Adding to OpenCore Drive
parent: Recovery
grand_parent: Fetching Installer
nav_order: 3
---

# Adding to OpenCore
#### You'll need to have your OC image mounted.

DarwinFetch sorts all downloads within its respective downloads folder. Within that folder, you will find a named subfolder that has the version number, and the build number of whatever macOS RecoveryOS image you chose to fetch. Within that folder it then creates a ``com.apple.recovery.boot`` folder. Inside you'll find a BaseSystem.dmg and a chunklist file which holds the recoveryOS for retrieving and installing macOS from scratch over the internet.

<p align="center">
  <img src="../../../../assets/DarwinFetchDirectoryRecovery.png">
</p>

Because we'd like to maintain SecureBootModel and various other aspects for security reasons, we'll want to follow the same method as using a baremetal USB. Drag the ``com.apple.recovery.boot`` folder to the root of the OpenCore image.

With this, you can later boot Base System and thus, RecoveryOS.

<p align="center">
  <img width="650" height="200" src="../../../../assets/BaseSystemInstallLegacyScreenshot.png">
</p>

Now that you've completed configuring your OpenCore disk image, <span style="color: #ffab52;">**DO NOT FORGET TO UNMOUNT**</span> before continuing to the XML importing and OS Installation sections.

<h3 align="center">You can now proceed to the <a href="../../../07-XML/index">Import XML</a> section!</h3>

<h3 align="center">An example of installing via recoveryOS is shown <a href="../03-Installation">here</a></h3>
