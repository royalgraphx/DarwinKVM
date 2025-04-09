---
layout: default
title: First VMM Launch
description: "Placeholder"
nav_order: 2
has_children: false
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

  .top-button {
    margin: 10px;
    align: center;
  }
</style>

<p align="center">
  <img width="650" height="200" src="../../assets/Headers/Header-VMM.png">
</p>

{: .internalnote }
Basically, this needs screenshots from Linux, but I won't get around to this until I fully reset my entire machine and fresh install Arch. This page is kind of empy rn. We'll want to make sure we include a quick troubleshooting guide by having systemctl status logs let us know whats wrong with the service.

<p align="center">You're now able to open Virtual Machine Manager, also known as Virt-Manager for the first time! This is to verify that our configuration of the package succeeded, and we see <code>Connecting...</code> disappear and <code>QEMU/KVM</code> actively connected and ready to create VMs on.</p>

<p align="center"><i>Placeholder Image</i></p>

<p align="center">The above is a successful connection to the KVM module as a root user.</p>

<h2 align="center">
  <br>
  <div class="navigation-container">
    <a class="nav-button" href="../01-Introduction">&larr; Back Page</a>
    <a class="nav-button" href="../03-XML-Importer">Next Page &rarr;</a>
  </div>
  <br>
</h2>

<hr>

<h2 align="center">Common Troubleshooting Tips</h2>

<p align="center">If your Virt-Manager window looks like the following:</p>

<p align="center"><i>Placeholder Image</i></p>

<p align="center">You'll need to go through some basic steps to read the logs and determine the appropriate fix.</p>

{: .internalnote }
The rest of this page, will have that information lol, this is all being written from within macOS, so it's hard to be super in depth at the moment.

<h2 align="center">
  <br>
  <div>
    <a class="top-button" href="#">&uarr; Go to the Top &uarr;</a>
  </div>
  <br>
</h2>
