---
layout: default
title: Part 3 - Automation with systemd-networkd
parent: Bridge Networking
nav_order: 3
---

# Automation with systemd-networkd
#### This section assumes you have a properly working systemd setup prior to attempting.

We'll be using our favorite text editor to create a few configuration files that a ``systemctl`` service can use to automatically create and assign our bridge an IP address! This makes it much easier to have a bridge that persists through reboots, while this can be done manually via the instructions in the video, there is also a great section containing steps for the automation part, and that's what we'll focus on here for our production use.

Let's begin by checking if systemd-networkd is enabled or running. If you know you already have this set up, please back up your current configuration files in preparation for the bridge configuration.

```bash
sudo systemctl status systemd-networkd
```

```bash
[liveuser@eos-2023.03.26 ~]$ sudo systemctl status systemd-networkd
○ systemd-networkd.service - Network Configuration
     Loaded: loaded (/usr/lib/systemd/system/systemd-networkd.service; disabled; preset: enabled)
     Active: inactive (dead)
TriggeredBy: ○ systemd-networkd.socket
       Docs: man:systemd-networkd.service(8)
[liveuser@eos-2023.03.26 ~]$
```
On this system we can see that it's disabled and inactive. Perfect, let's get started using our favorite text editor! For this example we'll use Nano.

```bash
cd /etc/systemd/network
```

We'll begin with the first file ``br.netdev`` which will define the Bridge interface.

```bash
sudo nano br.netdev
```

```bash
[NetDev]
Name=br0
Kind=bridge
```

Next, let's create the file ``1-br0-bind.network`` which will bind our ethernet to the bridge interface it will create. Please note the ``*`` is a <span style="color:gold">wildcard</span>. This means it will autocomplete and work on any interface starting with enp. Since you got the name last page, you can write it specifically down, or use a wildcard as seen here.

```bash
sudo nano 1-br0-bind.network
```

```bash
[Match]
Name=enp*

[Network]
Bridge=br0
```

Now we're going to create our final file ``2-br0-dhcp.network``. This is responsible for telling br0 it's to get an IP address assigned to it by DHCP using IPV4.

```bash
sudo nano 2-br0-dhcp.network
```

```bash
[Match]
Name=br0

[Network]
DHCP=ipv4
```

Our setup is now complete! To begin tesing, let's go ahead and enable systemd-networkd, as well as starting the service to see if our internet connection returns.

```bash
sudo systemctl enable systemd-networkd
```

```bash
sudo systemctl start systemd-networkd
```

You can check the logs to see if it properly worked by checking the status.


```bash
sudo systemctl status systemd-networkd
```

Example output of a success:

```bash
[liveuser@eos-2023.03.26 BridgeNetworking]$ sudo systemctl status systemd-networkd
● systemd-networkd.service - Network Configuration
     Loaded: loaded (/usr/lib/systemd/system/systemd-networkd.service; enabled; preset: enabled)
     Active: active (running) since Fri 2023-07-14 03:29:43 CDT; 1min 26s ago
TriggeredBy: ● systemd-networkd.socket
       Docs: man:systemd-networkd.service(8)
   Main PID: 3512 (systemd-network)
     Status: "Processing requests..."
      Tasks: 1 (limit: 9403)
     Memory: 3.7M
        CPU: 709ms
     CGroup: /system.slice/systemd-networkd.service
             └─3512 /usr/lib/systemd/systemd-networkd

Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: Enumeration completed
Jul 14 03:29:43 EndeavourOS systemd[1]: Started Network Configuration.
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: enp0s1: Configuring with /etc/systemd/network/1-br0-bind.network.
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: br0: Configuring with /etc/systemd/network/2-br0-dhcp.network.
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: br0: Link UP
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: enp0s1: Link UP
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: enp0s1: Gained carrier
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: br0: Gained carrier
Jul 14 03:29:43 EndeavourOS systemd-networkd[3512]: br0: DHCPv4 address 192.168.0.5/24, gateway 192.168.0.1 acquired from 192.168.0.1
Jul 14 03:29:44 EndeavourOS systemd-networkd[3512]: br0: Gained IPv6LL
[liveuser@eos-2023.03.26 BridgeNetworking]$
```

## You can now continue to the next <a href="../04-FixingPingFailed">page</a>.