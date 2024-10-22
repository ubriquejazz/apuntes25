## 15.2 Configuracion de static routes

- 15.2.1 **Ruta estática de siguiente salto**

    R1()# ip route 192.168.1.0 255.255.255.0 172.16.2.2
    R1()# ip route 192.168.2.0 255.255.255.0 172.16.2.2
    R1# show ip route | begin Gateway
    S     192.168.1.0/24 [1/0] via 172.16.2.2
    S     192.168.2.0/24 [1/0] via 172.16.2.2

- 15.2.3 **Ruta Estática IPv4 conectada directamente**

    R1()# ip route 192.168.1.0 255.255.255.0 s0/1/0
    R1()# ip route 192.168.2.0 255.255.255.0 s0/1/0
    R1# show ip route | begin Gateway
    S     192.168.1.0/24 is directly connected, Serial0/1/0
    S     192.168.2.0/24 is directly connected, Serial0/1/0

- 15.2.5 **Ruta estática completamente especificada**

    R1()# ip route 172.16.1.0 255.255.255.0 G0/0/1 172.16.2.2
    R1# show ip route | begin Gateway
    Gateway of last resort is not set
        172.16.0.0/16 is variably subnetted, 5 subnets, 2 masks
    S        172.16.1.0/24 [1/0] via 172.16.2.2, GigabitEthernet0/0/1
    C        172.16.2.0/24 is directly connected, GigabitEthernet0/0/1
    L        172.16.2.1/32 is directly connected, GigabitEthernet0/0/1
    C        172.16.3.0/24 is directly connected, GigabitEthernet0/0/0
    L        172.16.3.1/32 is directly connected, GigabitEthernet0/0/0

- 15.2.6 **Ruta estática en IPv6**

    R1()# ipv6 route 2001:db8:cafe:1::/64 **next hop**
    R1# show ipv6 route
    S   2001:DB8:CAFE:1::/64 [1/0]
        via 2001:DB8:ACAD:2::2
    S   2001:DB8:CAFE:2::/64 [1/0]
        via 2001:DB8:ACAD:2::2

    **directly connected**
    R1()# ipv6 route 2001:db8:cafe:2::/64 **s0/1/0**
    R1# show ipv6 route
    S   2001:DB8:CAFE:1::/64 [1/0]
         via Serial0/1/0, directly connected
    S   2001:DB8:CAFE:2::/64 [1/0]
        via Serial0/1/0, directly connected

    **completamente especificada**
    R1()# ipv6 route 2001:db8:acad:1::/64 s0/1/0 fe80::2
    R1# show ipv6 route static | begin 2001:db8:acad:1::/64
    S   2001:DB8:ACAD:1::/64 [1/0]
        via FE80::2, Seria0/1/0

- 15.2.7 **Verificacion**

    R1# show ip route static | begin Gateway
    Gateway of last resort is not set
        172.16.0.0/16 is variably subnetted, 5 subnets, 2 masks
    S 172.16.1.0/24 [1/0] via 172.16.2.2

    R1# show running-config | section ip route
    ip route 172.16.1.0 255.255.255.0 172.16.2.2
    
    R1# show ip route 192.168.2.1
    Routing entry for 192.168.2.0/24
    Known via "static", distance 1, metric 0
    Bloques descriptores de enrutamiento:
    * 172.16.2.2
      La métrica de la ruta es 0, y el conteo del tráfico compartido es 1.