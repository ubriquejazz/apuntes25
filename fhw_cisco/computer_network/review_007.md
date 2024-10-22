
13. My system administrator has informed me their IP domain is 192.168.145.0/8. What does that tell me about the domain and its subnet? Will packets from this domain be routed using their own IP address?

15. What is the purpose of the “ping” command? Would I be able to ping a node with IP address 10.0.15.2 which is not on my LAN? How will the router use Boolean logic to determine if the node is on my LAN?

________________________________________________________________________

== 13 ==
 
- CIDR consists of the domain number (with the node part zero), a slash then the number of bits used in the subnet mask. Therefore the domain is 192.168.145.0 with no subnets. Any IP address starting by 192 belongs to the domain.
 
ð    Pretty much, but just to clarify, the /8 means the subnet mask is 8 bits, i.e. 255.0.0.0. This means that the class C domain 192.168.145.0 is actually treated as a class A domain.
 
- Packets from this domain are non routable. Addresses from 192.168.0.0 to 192.168.255.255 do not get routed over the internet. Overloaded NAT is used instead.
 
ð    Again, yes however you cannot say for sure overloaded NAT is being used, only that it could be.
 
 
== 15 ==

- The ping command operates by sending ICMP requests to the target host and waiting for an ICMP echo reply.  Options may include the size of the payload or limits for the number of network hops (TTL) that probes traceability (traceroute).
 
- The IP address 10.0.15.2/8 is a non routable address, so you won't be able to ping it from any other LAN.
 
- The router determine it by doing an AND operation between the destination IP number and its subnet mask. If the result is equal to the local net address (10.0.0.0 for instance) means that the destination is in its LAN.
 
