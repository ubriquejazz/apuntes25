
7. Explain the operation of and differences between a hub, a switch and a router. 

8. I have a choice between a UTP and an STP cable. 
How do they differ and which might I prefer to use for a standard non-critical LAN?

________________________________________________________________________

Why Does Shielding Work?
• In 1836 Michael Faraday put a foil covering around a room and showed that a charge applied to the foil did not effect anything inside the room. This is known as a “Faraday Cage”.
• By putting a mesh “shield” around a cable we are creating a Faraday Cage around the wire protecting it from electromagnetic interference

Why Do We Twist the Wires?
• As we know it takes two wires to make a circuit (think of the battery and bulb experiments at school which need two wires).
• This means that in effect each of the two wires has an equal but opposite signal in it.
• If the wires are twisted any electromagnetic interference is cancelled out as it causes induction in each (opposite) wire.

== Hub ==

A repeater is known as a level 1 device as its functionality is part of the physical layer protocols.
• Retransmits data on one network segment onto adjacent segments.
• Assumes same protocols used on segments but may use different media (for example could link UTP and fibre).
A hub is essentially a multiport repeater
• All data is repeated on all ports
• Hubs connect to for twisted-pair or fibre media.

== Switch ==

Simplest version at level 2 has the same relationship to a bridge that a hub has to a repeater, 
• It is essentially a multiport bridge.
• Like a bridge it can create separate collision domains.
• It prevents packets from one LAN reaching another if they do not need to (better than a hub)
• At level 3 more complex switches can control access to and between the collision domains.
• At level 3 it is possible to set up a set of switches so that we can create a virtual LAN (or VLAN) where the actual layout of devices differs from the one perceived by users.
• For example if my network device is physically moved by reconfiguring my VLAN I can make it look to the network as if it is still in the same place and part of the same LAN
• Conversely, two nodes on the same physical LAN can appear to be on separate ones.
• Also, network configuration can be done by software rather than moving devices: packet-tracer.

== Router ==

A level 3 device which retransmits data onto adjacent segments like a bridge or switch.
• May perform protocol and media conversion provided segments use same transport protocol.
• On networks with many segments it can determine the best route between stations
• Like a switch it can divide a network into collision domains.
• Can additionally divide the network into broadcast domains.