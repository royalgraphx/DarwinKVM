---
layout: default
title: Adding to OpenCore Drive
parent: Recovery
grand_parent: Fetching Installer
nav_order: 3
---

# Adding to OpenCore
#### You'll need to have your OC image mounted.

<br>

DarwinFetch sorts all downloads within its respective downloads folder. 

Within that folder, you will find a named subfolder that has the version number, and the build number of whatever macOS RecoveryOS image you chose to fetch. 

Within that folder it then creates a ``com.apple.recovery.boot`` folder. Inside you'll find a BaseSystem.dmg and a chunklist file which holds the recoveryOS for retrieving and installing macOS from scratch over the internet.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DarwinFetchDirectoryRecovery.png"><img src="../../../../assets/DarwinFetchDirectoryRecovery.png" alt=""></a>

Because we'd like to maintain SecureBootModel and various other settings for security reasons, we'll want to follow the same method as using a baremetal USB. Drag the ``com.apple.recovery.boot`` folder to the root of the OpenCore image.

With this, you can later boot ``Base System`` and thus, RecoveryOS.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/BaseSystemInstallLegacyScreenshot.png"><img src="../../../../assets/BaseSystemInstallLegacyScreenshot.png" alt=""></a>

Now that you've completed configuring your OpenCore disk image, <span style="color: #ffab52;">**DO NOT FORGET TO UNMOUNT**</span> before continuing to the XML importing and OS Installation sections.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionMainMenu.png"><img src="../../../../assets/DiskProvisionMainMenu.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/DiskProvisionOCUnmounting.png"><img src="../../../../assets/DiskProvisionOCUnmounting.png" alt=""></a>

<h3 align="center">You can now proceed to the <a href="../../../07-XML/KVM/index">Import XML</a> section!</h3>

<h3 align="center">An example of installing via recoveryOS is shown <a href="../03-Installation">here</a></h3>
