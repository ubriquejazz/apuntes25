
## 10.X Categories of attacks and solutions

		Category					Includes
		--------					--------
	x	MAC Table Attacks			MAC address flooding.
		VLAN Attacks				hopping, double-tagging, attacks between devices on a common VLAN
	x	DHCP Attacks				DHCP starvation, DHCP spoofing.
	x	ARP Attacks					ARP spoofing, ARP poisoning.
	x	Address Spoofing 			MAC and IP address spoofing.

		Solution					Prevents
		--------					--------
	x	Port Security				MAC address flooding, DHCP starvation.
		?							VLAN hopping, double-tagging,
	x	DHCP Snooping				DHCP starvation, DHCP spoofing.
	x	Dynamic ARP Inspection		ARP spoofing, ARP poisoning.
	x	IP Source Guard (IPSG)		MAC and IP address spoofing.


## 10.4 MAC Address Attacks

- 10.4.2 **Table Flooding**
- 10.4.3 **Port Security**

## 10.5 LAN Attacks

- 10.5.x **VLAN Hopping**
- 10.5.x **VLAN Double Tagging**

- 10.5.5 **DHCP Attacks (Snooping)**
	DHCP starvation -> DoS of the DHCP server (multiple MACs)
	DHCP spoofing -> DORA process against a rouge DHCP server

- 10.5.7 **ARP Attack**
 	ARP spoofing: Man In The Middle (MITM) Attack
	ARP poisoning (DAI)

- 10.5.8 **Address Spoofing**
	La suplantación puede ser mitigada con IPSG.

- 10.5.10 **CDP Reconnaissance**
	S1(config)# no cpd run
