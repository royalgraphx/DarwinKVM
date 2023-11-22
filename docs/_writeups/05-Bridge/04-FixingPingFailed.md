---
layout: default
title: Part 4 - Fixing Ping Failed
parent: Bridge Networking
nav_order: 4
---

# Fixing Ping Failed
#### If you can no longer connect to the outside internet, fix it below

Now, some of you may run into issues communicating with the outside world now that you've created your bridge. This is because if you don't already have a custom DNS configured for your local network such as a Pi-Hole or other DNS services on your linux box, you'll by default be missing a defined ``nameserver``.

How do I know for sure if i'm having issues? If your pings fail with an error such as below, this fix will work for you.

```bash
ping google.com
```

```bash
[liveuser@eos-2023.03.26 BridgeNetworking]$ ping google.com
ping: google.com: Temporary failure in name resolution
[liveuser@eos-2023.03.26 BridgeNetworking]$
```

We can fix this by easily modify the following file using your favorite text editor.

```bash
sudo nano /etc/systemd/resolved.conf
```

with the following contents (or your own chosen DNS):

```bash
DNS=1.1.1.1
```

Save the changes and exit the editor, and restart the systemd-resolved service to apply the changes

```bash
sudo systemctl restart systemd-resolved.service
```

Now your ping should go through! Bridge success!

```bash
[liveuser@eos-2023.03.26 BridgeNetworking]$ ping google.com
PING google.com (142.250.191.238) 56(84) bytes of data.
64 bytes from ord38s32-in-f14.1e100.net (142.250.191.238): icmp_seq=1 ttl=56 time=13.8 ms
64 bytes from ord38s32-in-f14.1e100.net (142.250.191.238): icmp_seq=2 ttl=56 time=13.5 ms
64 bytes from ord38s32-in-f14.1e100.net (142.250.191.238): icmp_seq=3 ttl=56 time=12.5 ms
^C
--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2007ms
rtt min/avg/max/mdev = 12.534/13.299/13.830/0.554 ms
[liveuser@eos-2023.03.26 BridgeNetworking]$
```

## You can now continue to the next <a href="../05-Results">page</a>.
