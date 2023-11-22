---
layout: default
title: Part 2 - Disabling NetworkManager
parent: Bridge Networking
nav_order: 2
---

# Disabling NetworkManager
#### This step may vary depending on your system's network manager package.

The most popular and commonly used package for managing your network connection will most likely be "NetworkManager", and this can be checked by issuing a systemctl command to check the status.

```bash
sudo systemctl status NetworkManager
```

{: .warning }
You will be disconnected from your internet connection while following the process, as you must completely strip your ethernet controller of even an IP adress. I recommend opening all steps to this write-up BEFORE following the next steps.

We will now stop NetworkManager, and disable it from autostarting on boot.

```bash
sudo systemctl stop NetworkManager
```

```bash
sudo systemctl disable NetworkManager
```

# Stripping IP Address

You will no longer have an active ethernet connection. Our next step is to strip our ethernet interface of an IP address which was assigned by NetworkManager or your default manager.

You can first run ``ip a s`` to get some output similar to whats below:

```bash
[liveuser@eos-2023.03.26 ~]$ ip a s
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc state UP group default qlen 1000
    link/ether 4e:1e:25:1d:61:4c brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.3/24 brd 192.168.0.255 scope global dynamic noprefixroute enp0s1
       valid_lft 86312sec preferred_lft 86312sec
    inet6 fdd3:7ef0:5a91:683b:b7bf:1f22:b876:c7be/64 scope global dynamic noprefixroute 
       valid_lft 2591992sec preferred_lft 604792sec
    inet6 fe80::259e:d05f:c6fd:bd8/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
[liveuser@eos-2023.03.26 ~]$
```

We can see from the output that the ``enp0s1`` interface has the ip address ``192.168.0.3`` assigned to it, with the ``24`` bits reserved. To remove it, we can use the following commands, substituting any values for yours:

We can remove the IP address with the following example
```
sudo ip addr del 192.168.0.3/24 dev enp0s1
```

Then set the interface down
```
sudo ip link set down enp0s1
```

and as we can see now, our ethernet is fully shut off and stripped of an IP address.

```bash
[liveuser@eos-2023.03.26 ~]$ ip a s
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s1: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 4e:1e:25:1d:61:4c brd ff:ff:ff:ff:ff:ff
    inet6 fe80::26c8:af0:90c6:da77/64 scope link tentative noprefixroute 
       valid_lft forever preferred_lft forever
[liveuser@eos-2023.03.26 ~]$
```

## You can now continue to the next <a href="../03-UsingSysDNetD">page</a>.
