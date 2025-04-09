---
layout: default
title: Configuring Virt-Manager
parent: Single GPU Passthrough
grand_parent: GPU Passthrough
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
</style>

<br>
<h2 align="center"><b>Configuring Virt-Manager</b></h2>
<br>

<h3 align="center">1. Removing the Virtual Display</h3>
<br>

<p align="center">First things first, we must remove the <code>Display</code> and <code>Video</code> devices from the left hand side in our Virt-Manager details window. As you can see here, they are now removed.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughRemoveVirtIODisplay.png" alt=""></a></p>

<hr>

<h3 align="center">2. Removing Keyboard & Mouse</h3>
<br>

<p align="center">Now let's go ahead and remove the Keyboard and Mouse as we'll now be passing through our actual USB controllers later. You'll have to select the <code>Overview</code> tab on your left-hand side, and swap to the <code>XML</code> tab at the top. Scroll to the very bottom and delete the highlighted section. Be sure to hit apply!</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughRemoveRecoveryKBM.png" alt=""></a></p>

<hr>

<h3 align="center">3. Enabling Topoext / AMD Simultaneous Multithreading (SMT) for Multithreading</h3>
<br>

<p align="center">If you have an AMD CPU, you should enable Topoext / AMD Simultaneous Multithreading (SMT) for the guest. This should already be applied, just double check the Dynamic XML did its job.</p>

```xml
<feature policy='require' name='topoext'/>
```

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughAddMultithreading.png" alt=""></a></p>

<hr>

<h3 align="center">4. IOMMU Groups</h3>
<br>

<p align="center">Now here's the tricky bit. You'll need to check your IOMMU groups. This can be done within the DarwinKVM Main Menu by selecting Option 3. This requires Sudo to use the command.</p>

{: .note }
Sample Output, this is a host using <a href="https://github.com/zen-kernel/zen-kernel">Zen Kernel</a> and <a href="https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Bypassing_the_IOMMU_groups_(ACS_override_patch)">ACS Patches</a>. You will not get as clean groups as this output, you will see multiple devices within groups, <span style="color: #bfa6ff;"><b>you can only pass through devices in a group, if you can pass all the objects in the same entire group</b></span>. This means that if your GPU and Ethernet are in the same group, you must pass through the entire group. This is where many people will run into issues. You can read more about this <a href="../../../../hypervisor/07-IOMMU-Viability">here</a>

{: .warning }
<b>DO NOT ADD BRIDGES TO YOUR VIRTUAL MACHINE</b>. That means devices like <code>PCI bridge [0604] Navi 10 XL Upstream Port of PCI Express Switch</code> do not count as devices in your groups that must be passed through. Only actual full devices.

```
IOMMU Group 24:
	08:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch [1002:1478] (rev c7)
IOMMU Group 25:
	09:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
IOMMU Group 26:
	0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c7)
IOMMU Group 27:
	0a:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
IOMMU Group 28:
	0b:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Function [1022:148a]
IOMMU Group 29:
	0c:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Reserved SPP [1022:1485]
```

<p align="center">If everything seems fine as it did the first time we determined viability, and you can pass your USB controllers, and Graphics card + it's audio without issues, you can move on.</p>

<hr>

<h3 align="center">5. Adding GPU + Audio</h3>
<br>

<p align="center">Let's go ahead and add the GPU and its Audio to our Virtual Machine.</p>

<p align="center">On the left-hand side, select the PCI Host Device section.</p>

<p align="center">You can now scroll down and select your GPU device.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughAddGPU.png" alt=""></a></p>

<p align="center">Let's go ahead and add the Audio portion of the GPU device now.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughAddGPUAudio.png" alt=""></a></p>

<hr>

<h3 align="center">6. Correcting GPU Multifunction + Audio Bus</h3>
<br>

<p align="center">Here's what a lot of people don't check. This will be required here as on macOS if you want your HDMI/DP Audio to work, this must be configured correctly. Windows doesn't care so it's not an issue.</p>

<p align="center">Essentially, your GPU and Audio must be on the same <code>Bus</code> in the Virtual Machine, but your Audio must be a <code>Function</code> of the GPU. Thus creating a multifunction GPU in the VM which has an accompanying Audio device. This displays the GPU as a single PCIe Device as it's supposed to be. Allowing for HDMI/DP Audio in macOS.</p>

<p align="center">Go Ahead and select your GPU from the left-hand side. Note the Bus assigned by Virt-Manager when you added the device.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughFindGPUBus.png" alt=""></a></p>

<p align="center">Go Ahead and select your GPU Audio from the left-hand side. Note the Bus assigned to this device does not line up with that which was assigned to the GPU. We will now correct it to the same value. You must also switch the <code>0x0</code> to <code>0x1</code> to assign the Audio as a <code>Function</code> of the GPU device before hitting apply.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughCorrectAudioBusBefore.png" alt=""></a></p>

<p align="center">The corrected Audio device:</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughCorrectAudioBusAfter.png" alt=""></a></p>

<p align="center">Now you can see the GPU is a multifunction device.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughCorrectedGPUMultifunction.png" alt=""></a></p>

<hr>

<h3 align="center">7. Adding USB Controllers</h3>
<br>

<p align="center">Go ahead and add your USB Controllers as you'll need to use your Keyboard and Mouse now.</p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughAddUSBController1.png" alt=""></a></p>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughAddUSBController2.png" alt=""></a></p>

<hr>

<h3 align="center">Example VM ready to start</h3>
<br>

<p align="center"><a href=""><img src="../../../../assets/Virtual-Machine-Manager/VManGPUPassthroughCompletedExample.png" alt=""></a></p>

<p align="center">If you've gone ahead and verified everything, your IOMMU groups, and your multifunction GPU, you are now ready! Here's an example of what a completed GPU Passthrough Virt-Manager will look like. Note that in this example image, the BaseSystem.dmg is still included within the OpenCore image.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../02-HookModification">&larr; Back Page</a>
    <a class="nav-button" href="../04-Finish">Next Page &rarr;</a>
  </div>
  <br>
</h2>
