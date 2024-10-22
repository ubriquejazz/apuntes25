
14. Explain the term overloaded NAT. 
Why do we often prefer to use this? How might it be combined with DHCP?

________________________________________________________________________


Network Address Translation is the system used to enable nodes on a private network (that is, nodes with non routable IP numbers such as 192.168.n.n) to access the internet while ensuring they go via a router.
• When used in certain modes it can also allow sharing of a small number of IP addresses among a larger number of users.
• The basic manner of operation of NAT is that the real nodes on a LAN are given non routable IP addresses with each node being configured to send all its non LAN traffic to a router.
• The router sends the packet out using a real IP address then when the message comes back routes it to the correct LAN node.

There are three basic ways NAT can be configured to work:
• Static (each non routable address has a corresponding actual IP address)
• Dynamic (the router has a pool of real IP addresses it uses as needed)
• Overloaded (all traffic sent out has a single IP number and ports are used to identify the LAN node)

== Overloaded NAT ==

• This is the most complex but is the most useful.
• It is where the router has only one real IP address and sends out all LAN traffic via these addresses
• It permits us to have very large LANs sharing as few as one real IP address.

How Overloaded NAT Works:
• The router receives the packet from the computer on the LAN with a private IP address (192.168.n.n)
• It allocates the packet a free port number and puts that port number and the node’s private IP address into an address translation table (ATT)
• The router replaces the sending node's source port (that is, the port number of the local node’s demon process which sent the packet) with the free port number it put in the address translation table (ATT)
• It then sends the packet out replacing the node’s private address with its own real IP address.
• When a packet comes back from the destination computer, the router checks the destination port on the packet (which will be the allocated “free” port put in the source port field when the packet was sent out).
• It then looks in the address translation table (ATT) to see which computer on the LAN the port was allocated to. 
• It changes the destination address and destination port to the one saved in the address translation table and sends it to that computer.

Here is what the address translation table (ATT) might contain:

Record	IP Address 			Port 	Allocated Port (return port sent to remote site)
1 		192.168.32.10 		80		34009
2 		192.168.32.13 		23		32250
3 		192.168.32.15 		43		43750
4 		192.168.32.18 		80		12061

== DHCP ==

(Dynamic Host Configuration Protocol) is a means by which a node can borrow an IP number from a pool held by a server.
• It is useful as it allows us to have less IP numbers than nodes (on the assumption not all nodes need access at the same time)
• It is the normal method used by ISPs. ISPs like it because as well as the above advantage it also stops home users setting up servers as their IP number changes from session to session.

• A node broadcasts a request for a DHCP server to give it an IP number
• The server notes the node’s MAC address and (provided the node is permitted/authenticated) “leases” it an IP number and tells it other info such as the IP number of the LAN gateway and DNS server(s).
• The lease may be indefinite (until released) or time out after a allotted time or a predetermined period of inactivity.

