## 11.4 ARP Attacks

- 11.4.1 **DAI Inspection**

    To prevent ARP spoofing and the resulting ARP poisoning, a switch must ensure that only valid ARP Requests and Replies are relayed.

    1. Enable DHCP snooping globally for the switch.
    2. Trust the interfaces for both DHCP snooping and DAI
    3. Enable DHCP snooping and DAI for VLANs 10,20,30-49

- 11.4.3 **Example**

    S1(config)# ip dhcp snooping
    S1(config)# ip dhcp snooping vlan 10
    S1(config)# ip arp inspection vlan 10

    S1(config)# interface fa0/24
    S1(config-if)# ip dhcp snooping trust
    S1(config-if)# ip arp inspection trust
