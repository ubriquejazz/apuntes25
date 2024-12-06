# Network traffic analisys

## Objectives

- Using a script to find the IP address of all the machines alive in the same network
- Understand UNIX commands
- DNS lookup and routing table

## DNS lookup

**host** and **nslookup** are two DNS lookup utilities. 

**host** lists all the IP addresse attached to the domain name;
**nslookup**  is used to query all the DNS records in the servers. For instance:

    host google.com
    nslookup google.com

The last line corresponds to the default name server used for resolution.

Without DNS server, it's still possible to add a symbolic name to a IP address resolution, just adding entries in the /etc/hosts file:

    echo <ip_address> <name> >> /etc/hosts

For example:

    echo 192.168.0.1 backupserver >> /etc/hosts

After this, whenever resolution to backupserver occurs, it will resolve 192.168.0.1

## Showing the routing table information



## Listing all the machines alive in a network