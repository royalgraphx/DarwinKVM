---
layout: default
title: Outline of Plist
parent: Custom Memory Mapping
nav_order: 2
---

# CustomMemoryMap[GB].plist
#### DarwinKVM Includes a set of standardized maps.
#### This section has been derived from the <a href="https://dortania.github.io/OpenCore-Post-Install/universal/memory.html">Fixing MacPro7,1 Memory Errors</a> section via <a href="https://dortania.github.io/OpenCore-Post-Install/">OpenCore Post-Install</a>. The included sets can be modified to your liking.

For explaining the creation of these premade maps, we'll break down the sections.

<p align="center">
  <img width="650" height="200" src="../../../assets/PTMemMap32GBDefault.png">
</p>

{: .new }
Advanced users, Feel free to run a copy of baremetal Windows and [DmiDecode for Windows](https://gnuwin32.sourceforge.net/packages/dmidecode.htm) with your memory. Capture the DmiDecode output, and parse it with MemInfoGen.sh to provide you the proper custom information needed to create your own map! Help can be provided via Discord.

Firstly, to create the template maps, I first ran baremetal Windows to capture my RAM configuration output via dmidecode. When running ``MemInfoGen.sh`` the following output can be seen: 

```bash
Data Width
        Data Width: 64 bits
        Data Width: 64 bits
        Data Width: 64 bits
        Data Width: 64 bits
Error Correction Type
        Error Correction Type: None
Form Factor
        Form Factor: DIMM
        Form Factor: DIMM
        Form Factor: DIMM
        Form Factor: DIMM
Total Width
        Total Width: 64 bits
        Total Width: 64 bits
        Total Width: 64 bits
        Total Width: 64 bits
Type
        Error Correction Type: None
        Type: <OUT OF SPEC>
        Type: <OUT OF SPEC>
        Type: <OUT OF SPEC>
        Type: <OUT OF SPEC>
Type Detail
        Type Detail: Synchronous
        Type Detail: Synchronous
        Type Detail: Synchronous
        Type Detail: Synchronous

Device Properties

Asset Tag
        Asset Tag: Not Specified
        Asset Tag: Not Specified
        Asset Tag: Not Specified
        Asset Tag: Not Specified
Bank Locator
        Bank Locator: BANK 0
        Bank Locator: BANK 1
        Bank Locator: BANK 2
        Bank Locator: BANK 3
Device Locator
        Locator: DIMM_A1
        Bank Locator: BANK 0
        Locator: DIMM_A2
        Bank Locator: BANK 1
        Locator: DIMM_B1
        Bank Locator: BANK 2
        Locator: DIMM_B2
        Bank Locator: BANK 3
Manufacturer
        Manufacturer: G-Skill
        Manufacturer: G-Skill
        Manufacturer: G-Skill
        Manufacturer: G-Skill
Part Number
        Part Number: F4-3600C16-16GTZNC
        Part Number: F4-3600C16-16GTZNC
        Part Number: F4-3600C16-16GTZNC
        Part Number: F4-3600C16-16GTZNC
Serial Number
        Serial Number: 00000000
        Serial Number: 00000000
        Serial Number: 00000000
        Serial Number: 00000000
Size
        Size: 16384 MB
        Size: 16384 MB
        Size: 16384 MB
        Size: 16384 MB
Speed
        Speed: 3600 MHz
        Speed: 3600 MHz
        Speed: 3600 MHz
        Speed: 3600 MHz
```

As you can see, I have 4 sticks of 16GB for a total of 64GB of RAM. In the virtual machine, I only have 32GB of RAM. Meaning that for the 32GB map, we are using 4 Sticks of 8GB. Below you will see how the following values were derived. Again, you can use this information to make your own.

## DataWidth

Specifies the data width, in bits, of the memory.

From the output, you can see 64 was chosen.

```
Data Width
        Data Width: 64 bits
        Data Width: 64 bits
        Data Width: 64 bits
        Data Width: 64 bits
```

## Error Correction (EC)

Specifies ECC support. The following chart explains possible outcomes.

| Support | Value |
| ---- | ----- |
| Other | 1 |
| Unknown | 2 |
| None | 3 |
| Parity | 4 |
| Single-bit | 5 |
| Multi-bit | 6 |
| CRC | 7 |

From the output, you can see 3 was chosen.

```
Error Correction Type
        Error Correction Type: None
```

## FormFactor

Specifies Memory Form Factor. The following chart explains possible outcomes. I would recommend not changing this. Modern PC's and Modern Mac's mostly use DIMM or SO-DIMM memory.

| Type | Value |
| ---- | ----- |
| Other | 1 |
| Unknown | 2 |
| DIMM | 9 |
| SO-DIMM | 13 |
| FB-DIMM | 15 |

From the output, you can see 9 was chosen.

```
Form Factor
        Form Factor: DIMM
        Form Factor: DIMM
        Form Factor: DIMM
        Form Factor: DIMM
```

## MaxCapacity

Specifies maximum supported memory in your system. Written in Bytes.

{: .important }
If you're creating a custom map for non-standard RAM sizes, please convert your Guest Virtual Machines RAM size to Bytes. A working converter I can suggest is [here](https://convertlive.com/u/convert/gigabytes/to/bytes). Hexley should be able to do conversions soon! Stay tuned for updates by joining the discord.

| Guest Amount | Amount in Bytes |
| ---- | ----- |
| 8GB | 8589934592 |
| 16GB | 17179869184 |
| 32GB | 34359738368 |
| 64GB | 68719476736 |
| 128GB | 137438953472 |
| 256GB | 274877906944 |

Knowing the Virtual Machine in this example is 32GB, you can see why ``34359738368`` was chosen.

## TotalWidth

Specifies the total width, in bits, of the memory, including any check or error-correction bits. If there are no error-correction bits, this value should be equal to DataWidth.

Because I had no error-correction bits, I have kept this equal to DataWidth.

## Type

The Type of Memory in the system.

| Type | Value |
| ---- | ----- |
| Other | 1 |
| Unknown | 2 |
| SDRAM | 15 |
| DDR | 18 |
| DDR2 | 19 |
| DDR2 FB-DIMM | 20 |
| DDR3 | 24 |
| DDR4 | 26 |
| LPDDR | 27 |
| LPDDR2 | 28 |
| LPDDR3 | 29 |
| LPDDR4 | 30 |

Based on the fact that I know the RAM in my system is DDR4, that is why 26 was chosen.

## TypeDetail

Specifies other memory type information. You will need to combine your parsed output together to get a final value.

Here is the output for reference

```
Type Detail
        Type Detail: Synchronous
        Type Detail: Synchronous
        Type Detail: Synchronous
        Type Detail: Synchronous
```

| Type | Bit Value |
| ---- | ----- |
| Reserved | 0 |
| Other | 1 |
| Unknown | 2 |
| Synchronous | 7 |
| Registered (buffered) | 13 |
| Unbuffered (unregistered) | 14 |

Because they are all ``Synchronous``, the final value is 7. There was nothing to add besides 7.

{: .note }
If you had a mix of ``Bit 13 — Registered (buffered)`` and ``Bit 14 — Unbuffered (unregistered)``, your TypeDetail should be 27. You add up the bits of those which are different.

# RAM Sticks

Now that you've fully read though everything that was chosen and defined, we'll now talk about what defines the RAM sticks themselves. There are three different kind of states a Slot can be in, either Real, Fake, or Empty. We're going to define all 12 sticks even though they're not all going to be used. We will however, define 4 RAM Sticks, each that add up to the total Virtual Machines RAM. In this case, 4 sticks of 8GB RAM Sticks, with a defined RAM Speed. To help you understand the options available so that you can set this to cosmetically appear correctly, we'll go over the three devies.

## Real RAM Sticks

<p align="center">
  <img width="650" height="200" src="../../../assets/PTMemRAMReal.png">
</p>

## Fake RAM Sticks

<p align="center">
  <img width="650" height="200" src="../../../assets/PTMemRAMFake.png">
</p>

## Empty DIMM Slots

<p align="center">
  <img width="650" height="200" src="../../../assets/PTMemRAMEmptyDIMM.png">
</p>

## Explaining RAM Layout

<p align="center">
  <img width="650" height="200" src="../../../assets/MemoryMapHostMobo.png">
</p>

Just like on your typical motherboard, you would reference the manual to check for the optimal RAM layout. Typically being the Second and Fourth slot. MacPro7,1 also has a layout design. For simplicity and standardization, we will use 4 RAM Sticks. First, Third, Fifth, and 7th DIMM slot will have a stick. The other DIMM's will be empty.

<p align="center">
  <img width="650" height="200" src="../../../assets/PTMemMapLayout.png">
</p>

Note the 6th device is there, just did not fit in the screenshot. This results in the following map below

<p align="center">
  <img width="650" height="200" src="../../../assets/MemoryMappedMacPro71.png">
</p>

<p align="center">
  <img width="650" height="200" src="../../../assets/MemoryMapGuestLayout.png">
</p>

## Customizing the 4 Mapped Sticks

If you need to change the size of the RAM Sticks, refer to the chart below.

| GB | MB |
| ---- | ----- |
| 1GB | 1024 |
| 2GB | 2048 |
| 4GB | 4096 |
| 8GB | 8192 |
| 16GB | 16384 |
| 32GB | 32768 |
| 64GB | 65536 |

As you can see from above, to create your own map, you simply must update the MaxCapacity, and update the 4 Real RAM sticks to equal the total, as well as updating the RAM speed to yours. If you have standard RAM size, you can quickly use the included plists. If you need to modify the data, you now should understand how Memory Mapping works. Lets apply this to our OpenCore config.plist!

## You can now continue to the next <a href="../03-AddingToConfig">page</a>.
