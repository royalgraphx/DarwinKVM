<p align="center">
  <img width="650" height="200" src="../Assets/HeaderBridgeNetworkingTextOnly.png">
</p>

<h1 align="center">DKVM Bridge Networking Submodule</h1>
<h4 align="center">Automates the creation of the Bridge interface for your DKVM.</h4>

## About

This tool automates the process of creating and setting up a Bridge interface for use with QEMU. It performs the following actions:

- Checks if an Ethernet interface is actively used and Wi-Fi is not active.
- Prompts the user for confirmation to proceed.
- Shuts down the Ethernet interface.
- Checks if the Ethernet interface has an IP address assigned and prompts the user to remove it if necessary
- Checks and stops the NetworkManager and systemd-networkd services if they are running
- Backs up existing configuration files in the /etc/systemd/network folder.
- Copies new configuration files (br.netdev, 1-br0-bind.network, and 2-br0-dhcp.network) to the /etc/systemd/network folder.
- Modifies the 1-br0-bind.network file to match the detected Ethernet interface name.
- Enables and starts the systemd-networkd service.
- Checks the logs of systemd-networkd to verify if the bridge successfully acquired an IP address via DHCP.
- Verifies the route table and adds a default gateway if it is missing.
- Performs a ping test to google.com to check network connectivity.

## Requirements

* Software/Packages:
  * sed
  * systemd
  * iproute2
  * NetworkManager

Example Arch-based dependency installation:</br>
``sudo pacman -S networkmanager systemd iproute2 sed``

## Usage

Open a terminal and navigate to the directory containing the script files.

1. Ensure the script has executable permissions:

``chmod +x init.sh``

2. You can now run the init script to begin:

``./init.sh``

Example output:

Here you can see this is being run on a live USB to prove it works OOB.

```
[liveuser@eos-2023.03.26 BridgeNetworking]$ ls -l
total 24
-rw-r--r-- 1 liveuser liveuser   38 Jun 21 11:34 1-br0-bind.network
-rw-r--r-- 1 liveuser liveuser   37 Jun 21 11:35 2-br0-dhcp.network
-rw-r--r-- 1 liveuser liveuser   29 Jun 21 11:34 br.netdev
-rwxr-xr-x 1 liveuser liveuser 7276 Jun 22 11:47 init.sh
-rw-r--r-- 1 liveuser liveuser 1539 Jun 21 14:52 README.md
```

Let's quickly go over what we're doing here. This is a default system's ``ip a s`` output.

```
[liveuser@eos-2023.03.26 BridgeNetworking]$ ip a s
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:00:00:00:00:00 brd 00:00:00:00:00:00
    altname enp5s0
    inet6 0000:000:0000:0000:0000:0000:0000:0000/00 scope global tentative dynamic noprefixroute 
       valid_lft 7201sec preferred_lft 7201sec
    inet6 0000::0000:0000:0000:0000/00 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 00:00:00:00:00:00 brd 00:00:00:00:00:00 permaddr 00:00:00:00:00:00
```

This is a laptop that has WiFi + Ethernet, so that's how I'm testing the detection. As you can see, neither is currently active, I have not authenticated to a wireless network, and I haven't plugged in an ethernet cable so let's see what the script will tell us.

```
[liveuser@eos-2023.03.26 BridgeNetworking]$ ./init.sh 
DEBUG: Variable wifi_interface reports: wlan0 ...
DEBUG: Variable wifi_state reports: DOWN ...
WiFi was detected but is not active.
DEBUG: Variable ethernet_interface reports: eno1 ...
DEBUG: Variable ethernet_state reports: DOWN ...
An active Ethernet connection is needed.
```

You won't be seeing any debug messages but this gives you an idea of what it's doing. Let's go ahead and plug an ethernet cable in and retry.

```
[liveuser@eos-2023.03.26 BridgeNetworking]$ ./init.sh 
DEBUG: Variable wifi_interface reports: wlan0 ...
DEBUG: Variable wifi_state reports: DOWN ...
WiFi was detected but is not active.
DEBUG: Variable ethernet_interface reports: eno1 ...
DEBUG: Variable ethernet_state reports: UP ...
Ethernet connection is active, WiFi interface is down. All checks passed!
This script will detect any running network managers and disable them.
Please make sure you understand the alternative network management solution being created before continuing.
Do you want to proceed? (y/n): y
```

I'll be adding comments in between what's going on to add context, so here we have finally passed all the checks required to run the script. You can go ahead and say yes or no to continue.

```
DEBUG: User agreed...
Shutting down Ethernet interface: eno1
DEBUG: Variable ip_address reports: 192.168.0.13/24 ...
The Ethernet interface (eno1) has an IP address (192.168.0.13/24) assigned.
Do you want to remove the IP address? (y/n): y
The IP address has been removed from the Ethernet interface.
```

We first need to strip your ethernet interface of an IP address. The user is prompted if he would like to continue. If no, the user will be thrown out of the script, prompting the user to remove the IP address of the ethernet interface before continuing, no modifications have been made, the user can simply reboot or set the state to UP via a command to continue as previously.

```
Stopping NetworkManager...
NetworkManager has been stopped.
Disabling NetworkManager...
Removed "/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service".
Removed "/etc/systemd/system/multi-user.target.wants/NetworkManager.service".
Removed "/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service".
NetworkManager has been disabled.
```

In most Desktops, you will typically find NetworkManager to be the main package used for managing the users' Networks. But because we will be swapping to systemd-networkd, we must first check if it is running, stop it, disable it, and continue.

```
systemd-networkd.socket is already stopped.
systemd-networkd is already stopped.
No current configurations found.
New configuration files have been copied to: /etc/systemd/network
```

We must check if the user has previously enabled or used/use systemd-networkd currently. We check the systemd folder for previous configuration files and back them up if found, in this run, we did not find any. We continue to copy over the new configuration files.

```
Matching en* interface found!
```

This one is a redundancy check because some ethernet controllers will not fit the en* wildcard used by our config files, so we can modify the configuration file to the detected ethernet interface from earlier to avoid issues.

```
Enabling systemd-networkd...
Created symlink /etc/systemd/system/dbus-org.freedesktop.network1.service → /usr/lib/systemd/system/systemd-networkd.service.
Created symlink /etc/systemd/system/multi-user.target.wants/systemd-networkd.service → /usr/lib/systemd/system/systemd-networkd.service.
Created symlink /etc/systemd/system/sockets.target.wants/systemd-networkd.socket → /usr/lib/systemd/system/systemd-networkd.socket.
Created symlink /etc/systemd/system/sysinit.target.wants/systemd-network-generator.service → /usr/lib/systemd/system/systemd-network-generator.service.
Created symlink /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service → /usr/lib/systemd/system/systemd-networkd-wait-online.service.
systemd-networkd has been enabled.
```

We then now enable systemd-networkd.

```
Starting systemd-networkd.socket...
systemd-networkd.socket has been started.
Starting systemd-networkd...
systemd-networkd has been started.
```

We then now start systemd-networkd.

```
Waiting on Bridge status...
```

We sleep for 10 seconds to wait for DHCP to take effect.

```
Checking systemd-networkd logs...
br0 successfully acquired an IP address via DHCP.
Performing ping test...
Ping test successful. Bridge is now Operational.
```

Finally, we perform a ping test! If for whatever reason your ping test fails, there will eventually be further code in the script which will go through various tests to automate fixing nameservers, and _gateway on route tables. Enjoy your new bridge interface!


<h1 align="center">Desired Output</h1>
<h4 align="center">Tested on various EndeavourOS VM's and setups. There can and may still be issues.</h4>

```
[liveuser@eos-2023.03.26 BridgeNetworking]$ ip a s
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state DOWN group default qlen 1000
    link/ether 00:00:00:00:00:00 brd 00:00:00:00:00:00
    altname enp5s0
    inet6 0000::0000:0000:0000:0000/00 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 00:00:00:00:00:00 brd 00:00:00:00:00:00
4: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 192.168.0.20/24 metric 1024 brd 192.168.0.255 scope global dynamic br0
       valid_lft 86381sec preferred_lft 86381sec
    inet6 0000:000:0000:0000:0000:0000:0000:0000/00 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 7199sec preferred_lft 7199sec
    inet6 0000::0000:0000:0000:0000/00 scope link 
       valid_lft forever preferred_lft forever
[liveuser@eos-2023.03.26 BridgeNetworking]$
```