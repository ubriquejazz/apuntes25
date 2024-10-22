## 11.3 DHCP Attacks

DHCP starvation attack is to create a Denial of Service (DoS) for connecting clients. 
These attacks can be mitigated by using port security because Gobbler uses a unique source MAC address for each DHCP request sent.

DHCP spoofing attacks can be mitigated by using DHCP snooping on trusted ports.

- 11.3.2 **Snooping**

    1. Enable DHCP snooping by using the command ..
    2. Trust the interfaces by using the command ..
    3. Limit the number of DHCP discovery messages that can be received per second on untrusted ports
    4. Enable DHCP snooping by VLAN, or by a range of VLANs, by using ...

- 11.3.3 **Example**

    S1(config)# ip dhcp snooping
    S1(config)# interface f0/1
    S1(config-if)# ip dhcp snooping trust

    S1(config)# interface range f0/5 - 24
    S1(config-if-range)# ip dhcp snooping limit rate 6

    S1(config)# ip dhcp snooping vlan 5,10,50-52
    
    