## 11.2 VLAN Attacks

Attack the switch to enter trunking mode. From here, the attacker can send traffic tagged with the target VLAN, and the switch then delivers the packets to the destination.

Introducing a rogue switch and enabling trunking. The attacker can then access all the VLANs on the victim switch from the rogue switch.

Another type of VLAN hopping attack is a double-tagging (or double-encapsulated) attack. This attack takes advantage of the way hardware on most switches operate.

- 11.2.2 **Hopping Attack**

  	Ports 0/1 to 0/16 are access ports and therefore trunking is disabled 
  	S1(config)# interface range fa0/1 - 16
  	S1(config-if-range)# switchport mode access
  	
  	Ports 0/17 to 0/20 are unused ports and assigned to an unused VLAN
  	S1(config)# interface range fa0/17 - 20
  	S1(config-if-range)# switchport mode access
  	S1(config-if-range)# switchport access vlan 1000
  	S1(config-if-range)# shutdown
  	
  	Ports 0/21 to 0/24 are trunk links and are manually enabled as trunks with DTP disabled. The native VLAN is also changed from the default to an unused.
  	S1(config)# interface range fa0/21 - 24
  	S1(config-if-range)# switchport mode trunk
  	S1(config-if-range)# switchport nonegotiate
  	S1(config-if-range)# switchport trunk native vlan 999
  	
