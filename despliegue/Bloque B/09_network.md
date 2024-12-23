# Network traffic analisys

## Objectives

- Understand some UNIX commands
- DNS lookup and routing table
- Using a script to find the IP address of all the machines alive in the same network

## Printing the list of network interfaces

    % ifconfig en0            
    en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        options=400<CHANNEL_IO>
        ether ac:bc:32:ce:93:f5 
        inet6 fe80::c07:d079:ba6f:5bdc%en0 prefixlen 64 secured scopeid 0x4 
        inet 192.168.0.113 netmask 0xffffff00 broadcast 192.168.0.255
        nd6 options=201<PERFORMNUD,DAD>
        media: autoselect
        status: active

    ifconfig en0 | grep inet
        net6 fe80::c07:d079:ba6f:5bdc%en0 prefixlen 64 secured scopeid 0x4 
        inet 192.168.0.113 netmask 0xffffff00 broadcast 192.168.0.255

Depending on how your network is setup on your virtual machine, the interface may be eth0 or wlan0 (en0 will be used for the rest of this lab)

## DNS lookup

**host** and **nslookup** are two DNS lookup utilities. 

**host** lists all the IP addresse attached to the domain name;
**nslookup**  is used to query all the DNS records in the servers. For instance:

    host google.com
    google.com has address 64.11.22.33

We can alse list out all the DNS records as follows:

    nslookup google.com
    Server: 192.168.118.2
    Address: 192.168.118.2#53
    No-authorative answer
    Name: google.com
    Addres: 64.11.22.33
    [...]
    Name: google.com
    Addres: 88.11.22.33

The last line corresponds to the default name server used for resolution.

Without DNS server, it's still possible to add a symbolic name to a IP address resolution, just adding entries in the /etc/hosts file:

    echo <ip_address> <name> >> /etc/hosts

For example:

    echo 192.168.0.1 backupserver >> /etc/hosts

After this, whenever resolution to backupserver occurs, it will resolve 192.168.0.1

## Showing the routing table information

Let's image a college where each department may be on different networks. In this case, when a device wants to communicate with a device on different network, it needs to go throught a device that is common to both networks. This device is called **gateway** and its function is to route packets from and to different networks.

    route -n

Unix mantains a table which contain the information about how the packets are to be fowarded throught machines on the network. The routing table may looks like this:

| Destination | Gateway | Mask | Iface
| ----------- | ------- | ---- | -----
| 192.168.0.1 | * | 255.255.255.0 | wlan0
| default | p4.local | 0.0.0.0 | wlan0

The option -n shows the IP address of the nodes instead of its symbolic hostnames.

| Destination | Gateway | Mask | Iface
| ----------- | ------- | ---- | -----
| 192.168.0.1 | * | 255.255.255.0 | wlan0
| 0.0.0.0 | 192.168.0.4 | 0.0.0.0 | wlan0

A default gateway is set as follow:

    route add default gw 192.168.0.1 wlan0

## Listing all the machines alive in a network

When we deal with a large local area network, we may need the availability of other machines in the network.

A machine may not to be alive due to two conditions: is not powered on or a problem in the network. With this script, we can find out which machines are alive on the network.

    scan.sh

We use a for loop for iterating through a list of IP addresses generated through the expression 192.168.1{1..255}. This notation will expand and will generate a list of IP adresses such as 192.168.1.1, 192.168.1.2, ... up to 192.168.1.255

ping $ip -c 2 &> /dev/null will run a ping command in each iteration of the loop. The -c option is used to restrict the number of echo packets to be sent to a finite number. Finally /dev/null is used to redirect both the stderr and stdout to this file, so that it will not be printed on the terminal.

Using $? we evaluate the exits status of the last command. If it's succesfull, the exit status is 0. Hence, the IP address of the machine that is pinged, will be printed out.

In this script, every ping command is executed one after the other. It takes the delay of sending two echo packets and receiving them or the time-out. 