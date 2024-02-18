---
layout: default
title: OS Debugging
parent: Debugging DKVM
nav_order: 2
---

# How to debug the Mac OS.
#### Issues related to Darwin and Boot Process.

## Configuring Serial output to file:

For starters, let's add a new device to our Virtual Machine which will be a Serial connection. Select "Add Hardware" to view the following dialog box. In this case, we'll want to set it up to output to a file somewhere such as your root directory.

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManDebuggingSerialAddHW.png"><img src="../../../assets/VManDebuggingSerialAddHW.png" alt=""></a>

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/VManDebuggingSerial.png"><img src="../../../assets/VManDebuggingSerial.png" alt=""></a>

But we're not done yet! If you attempt to boot the Virtual Machine in this current state, you will only recieve data such as the following from OpenCore booting:

```bash
BdsDxe: loading Boot0001 "UEFI Non-Block Boot Device" from PciRoot(0x0)/Pci(0x1,0x1)/Pci(0x0,0x0)
BdsDxe: starting Boot0001 "UEFI Non-Block Boot Device" from PciRoot(0x0)/Pci(0x1,0x1)/Pci(0x0,0x0)
#[EB|LOG:EXITBS:END] _
#[EB.BST.FBS|-]
#[EB|B:BOOT]
#[EB|LOG:HANDOFF TO XNU] _
======== End of efiboot serial output. ========
```

To continue and get information from the Darwin kernel in our Serial output, we'll need to configure OpenCore's config.plist to enable a quirk, and a boot flag.

Enable the following quirk:

```bash
Misc -> Serial -> Init -> True
```

And add the following boot flag:

```bash
serial=3
```

Example of an updated config.plist

<a href="https://raw.githubusercontent.com/royalgraphx/DarwinKVM/main/docs/assets/OCSerialDebug.png"><img src="../../../assets/OCSerialDebug.png" alt=""></a>

With these changes made, on your next boot of the Mac OS system, Darwin will begin outputting verbose boot data to the serial output file we defined.

You will now see output such as the following:

```bash
BdsDxe: loading Boot0001 "UEFI Non-Block Boot Device" from PciRoot(0x0)/Pci(0x1,0x1)/Pci(0x0,0x0)
BdsDxe: starting Boot0001 "UEFI Non-Block Boot Device" from PciRoot(0x0)/Pci(0x1,0x1)/Pci(0x0,0x0)
#[EB|LOG:EXITBS:END] _
#[EB.BST.FBS|-]
#[EB|B:BOOT]
#[EB|LOG:HANDOFF TO XNU] _
======== End of efiboot serial output. ========
mem_actual: 0xd00800000
 legacy sane_size: 0xc20000000
PMAP: Supervisor Mode Execute Protection enabled
PMAP: Supervisor Mode Access Protection enabled
Darwin Kernel Version 23.3.0: Wed Dec 20 21:28:58 PST 2023; root:xnu-10002.81.5~7/RELEASE_X86_64
pmap_startup() delaying init/free of page nums > 0x200000
pmap_startup() init/release time: 26585 microsec
pmap_startup() delayed init/release of 10971141 pages
vm_page_bootstrap: 1499438 free pages, 12101330 wired pages, (up to 10971141 of which are delayed free)
VM boostrap: 73 maps, 153 entries and 128 holes available
Maximum number of VM swap files: 100
kext submap [0x<ptr> - 0x<ptr>], kernel text [0x<ptr> - 0x<ptr>]
"vm_compressor_mode" is 4
VM bootstrap done: 57 maps, 110 entries and 118 holes left
OSLog stream configured: stream: 8192 bytes, cache: 2112 bytes
Long logs support configured: size: 16384
Firehose configured: 16 chunks, 8 io pages
Log queues configured: slot count: 112, per-slot size: 32768, total size: 3670016
standard timeslicing quantum is 10000 us
standard background quantum is 2500 us
mig_table_max_displ = 54 mach_kobj_count = 375
TSC Deadline Timer supported and enabled
ACPI: RSDP 0x000000007F97E014 000024 (v02 BOCHS )
ACPI: XSDT 0x000000007F9E5000 00006C (v01 BOCHS  BXPC     00000001      01000013)
ACPI: FACP 0x000000007F979000 0000F4 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
ACPI: DSDT 0x000000007F97A000 0024FF (v01 BOCHS  BXPC     00000001 BXPC 00000001)
ACPI: FACS 0x000000007F9DD000 000040
ACPI: APIC 0x000000007F978000 0000F0 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
ACPI: HPET 0x000000007F977000 000038 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
ACPI: MCFG 0x000000007F976000 00003C (v01 BOCHS  BXPC     00000001 BXPC 00000001)
ACPI: WAET 0x000000007F975000 000028 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
Darwin Image4 Validator Version 5.0.0: Tue Jan  9 00:13:48 PST 2024; root:AppleImage4-247~2545/AppleImage4/RELEASE_X86_64
calling mpo_policy_init for AppleImage4
Security policy loaded: AppleImage4 sysctl hook (AppleImage4)
AppleImage4: no options node: 19
ACPI: VFCT 0x000000007EAF6000 00AA84 (v01 BOCHS  BXPC     00000001 AMD  31504F47)
ACPI: BGRT 0x000000007F974000 000038 (v01 INTEL  EDK2     00000002      01000013)
ACPI: SSDT 0x000000007F9E7000 00010B (v02 ACDT   SsdtEC   00001000 INTL 20190509)
ACPI: SSDT 0x000000007F9E6000 00006D (v02 CORP   CpuPlug  00003000 INTL 20200925)
ACPI: 3 ACPI AML tables successfully acquired and loaded
AMFI: queried model name from device tree: MacPro7,1
```

From there, you can continue reading the output, and identify the Kernel Panic information:

```bash
AppleKeyStore:12139:96: operation failed (sel: 35 ret: e00002f0, -1)
AppleKeyStore:12139:96: operation failed (sel: 35 ret: e00002f0, -1)
AppleKeyStore:12139:96: operation failed (sel: 35 ret: e00002f0, -1)
AppleKeyStore:12139:96: operation failed (sel: 35 ret: e00002f0, -1)
tx_flush:1336: disk3 xid 3613506 tx stats: # 80 finish 82 enter 199 wait 18 25411us close 3391us flush 76421us
panic(cpu 13 caller 0xffffff8005fded6f): zone_require_ro failed: element improperly aligned (addr: 0xffffff8fbeae3c00) @zalloc.c:7288
Panicked task 0xffffff9955f9abe8: 2 threads: pid 772: xpcproxy
Backtrace (CPU 13), panicked thread: 0xffffff948b2f9b30, Frame : Return Address
0xfffffff98031faf0 : 0xffffff8005836c41 mach_kernel : _handle_debugger_trap + 0x4b1
0xfffffff98031fb40 : 0xffffff80059955c0 mach_kernel : _kdp_i386_trap + 0x110
0xfffffff98031fb80 : 0xffffff8005984d0c mach_kernel : _kernel_trap + 0x55c
0xfffffff98031fc00 : 0xffffff80057d3971 mach_kernel : _return_from_trap + 0xc1
0xfffffff98031fc20 : 0xffffff8005836f2d mach_kernel : _DebuggerTrapWithState + 0x5d
0xfffffff98031fd10 : 0xffffff80058365d3 mach_kernel : _panic_trap_to_debugger + 0x1e3
0xfffffff98031fd70 : 0xffffff8005fd8d0b mach_kernel : _panic + 0x84
0xfffffff98031fe60 : 0xffffff8005fded6f mach_kernel : ___smr_stail_invalid + 0x2c2d
0xfffffff98031fea0 : 0xffffff8005ce6070 mach_kernel : _kauth_cred_proc_ref + 0x160
0xfffffff98031fec0 : 0xffffff8005ce5e15 mach_kernel : _mach_kauth_cred_thread_update + 0x95
0xfffffff98031fef0 : 0xffffff800596a2c8 mach_kernel : _mach_call_munger64 + 0x1b8
0xfffffff98031ffa0 : 0xffffff80057d3dd6 mach_kernel : _hndl_mach_scall64 + 0x16

Process name corresponding to current thread (0xffffff948b2f9b30): xpcproxy
Boot args: -v keepsyms=1 serial=3 

Mac OS version:
23D56

Kernel version:
Darwin Kernel Version 23.3.0: Wed Dec 20 21:28:58 PST 2023; root:xnu-10002.81.5~7/RELEASE_X86_64
Kernel UUID: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
roots installed: 0
KernelCache slide: 0x0000000005400000
KernelCache base:  0xffffff8005600000
Kernel slide:      0x00000000054e0000
Kernel text base:  0xffffff80056e0000
__HIB  text base: 0xffffff8005500000
System model name: MacPro7,1 (Mac-xxxxxxxxxxxxxxx)
System shutdown begun: NO
Panic diags file available: YES (0x0)
Hibernation exit count: 0

System uptime in nanoseconds: 60032304101
Last Sleep:           absolute           base_tsc          base_nano
  Uptime  : 0x0000000dfa5d9e55
  Sleep   : 0x0000000000000000 0x0000000000000000 0x0000000000000000
  Wake    : 0x0000000000000000 0x0000003bc7e37588 0x0000000000000000
Compressor Info: 0% of compressed pages limit (OK) and 0% of segments limit (OK) with 0 swapfiles and OK swap space
Zone info:
  Zone map: 0xffffff8953157000 - 0xffffffa953157000
  . PGZ   : 0xffffff8953157000 - 0xffffff895995c000
  . VM    : 0xffffff895995c000 - 0xffffff8e2568e000
  . RO    : 0xffffff8e2568e000 - 0xffffff8fbeaf4000
  . GEN0  : 0xffffff8fbeaf4000 - 0xffffff948a826000
  . GEN1  : 0xffffff948a826000 - 0xffffff9956558000
  . GEN2  : 0xffffff9956558000 - 0xffffff9e2228a000
  . GEN3  : 0xffffff9e2228a000 - 0xffffffa2edfbd000
  . DATA  : 0xffffffa2edfbd000 - 0xffffffa953157000
  Metadata: 0xffffffdef3170000 - 0xffffffdf13170000
  Bitmaps : 0xffffffdf13170000 - 0xffffffdf1cd76000
  Extra   : 0 - 0


** In Memory Panic Stackshot Succeeded ** Bytes Traced 359065 (Uncompressed 854672) **
Transmitting kernel state, please wait:

Beginning dump of kernel stackshot
100..
100..Recorded panic stackshot in corefile at offset 0x8000, compressed to 338912 bytes
```

### Thanks for reading!
