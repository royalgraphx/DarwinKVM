---
layout: default
title: Getting our input devices
parent: KB/M sharing with Evdev
nav_order: 1
---

# Prerequisites
#### What is Evdev, and what does it do?
**Evdev**, short for "**ev**ent **dev**ice", is a Linux input driver that supports almost all input devices, including keyboards, mice, game controllers, tablets, etc. It takes the raw input events from these devices and turns them into accessible files in the ``/dev/input/`` directory. These files can be then accessed to get input from such input devices. It is considered a type of **character device driver**, which turns raw data (in bytes) into files.

**Evdev** is how Linux communicates with and gets the raw data from these input devices. In our use case, we will use **evdev** to passthrough these input devices into our virtual machine and configure a keyboard shortcut to allow sharing of our mouse and keyboard.
<br><br>

#### Finding our keyboard and mouse
Make sure your keyboard and mouse are plugged in and detected in Linux.

Let's check the input devices currently in use. Enter the following command into the terminal (on Linux):

```bash
ls /dev/input/by-id
```

Example output:

```txt
usb-30fa_USB_Optical_Mouse-event-mouse
usb-30fa_USB_Optical_Mouse-mouse
usb-EVGA_Z12_Gaming_Keyboard-event-if01
usb-EVGA_Z12_Gaming_Keyboard-event-kbd
usb-EVGA_Z12_Gaming_Keyboard-if01-event-mouse
usb-EVGA_Z12_Gaming_Keyboard-if01-mouse
usb-EVGA_Z12_Gaming_Keyboard-if02-event-kbd
```

Only devices that have ``event`` in their names can be passed through. In the example output, the only devices that could be passed through would be

```txt
usb-30fa_USB_Optical_Mouse-event-mouse
usb-EVGA_Z12_Gaming_Keyboard-event-if01
usb-EVGA_Z12_Gaming_Keyboard-event-kbd
usb-EVGA_Z12_Gaming_Keyboard-if01-event-mouse
usb-EVGA_Z12_Gaming_Keyboard-if02-event-kbd
```

Now, we need to figure out which devices should be passed through. For each file in the output, check the contents via ``cat``. For instance,

```bash
cat /dev/input/by-id/usb-30fa_USB_Optical_Mouse-event-mouse
```

Move your cursor or type something on your keyboard. If the terminal spits out garbled characters, that is the correct device. If not, try the other devices in the list.

> [!NOTE]
> Remember to Control-C out of the process after!

Now that you have the two devices, note the paths of these input devices. These will be the devices that we will pass through to our virtual machine.

## You can now continue to the next <a href="./02-EditingConfig">page</a>.
