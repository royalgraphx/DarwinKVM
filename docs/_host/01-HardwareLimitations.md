---
layout: default
title: Hardware Limitations
description: "We're going to go in-depth and explain why your host machine matters."
nav_order: 1
has_toc: false
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

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/HeaderImportanceOfHW.png">
</p>

<h2 align="center">The importance of using natively compatible hardware.</h2>
<br>

<p align="center">Welcome to the beginning of your journey. Like every journey, you must be prepared before embarking into unknown territory. We’d like to take a quick detour to explain the importance of being familiar with your hardware and what it means to be limited by it.</p>

<p align="center">The Mac operating system was only ever intended to run on a specific set of hardware put together by Apple. This means that for our purposes of running it on non-Apple hardware, the responsibility of properly configuring an environment for OS X / macOS to appropriately use falls on us.</p>

<p align="center">Before we even consider proceeding with the decision to run the Mac operating system on your intended target hardware as a virtual machine, we must thoroughly understand all its individual components and the process, especially if it is a pre-built machine and you are unaware what kind of hardware you have or a laptop which cannot be used for DarwinKVM due to no hardware level MUX chip. After we run through various related topics, we can then verify the viability of your hardware using the support charts provided later in this same section.</p>

<br>
<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../../docs/01-WelcomeArea/04-DocsExplained.html">&larr; Back Page</a>
    <a class="nav-button" href="../02-KnowYourHardware">Next Page &rarr;</a>
  </div>
  <br>
</h2>
