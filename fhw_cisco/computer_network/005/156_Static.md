## 15.3 Configuracion de Static Routes: default routes

- 15.3.2 **Configuración de una ruta estática predeterminadas**
    R1# ip route 0.0.0.0 0.0.0.0 192.168.1.2
    R1# show ip route static
    --
    R1# ipv6 route ::/0 2001:db8:acad:2::2
    R1# show ipv6 route static
    
## 15.4 Configuracion de Static Routes: floating routes

- 15.4.1 **Configuracion de rutas flotantes IPv4 y IPv6**
    R1# ip route 0.0.0.0 0.0.0.0 192.168.1.2 5
    R1# show ip route static
    --
    R1# ipv6 route ::/0 2001:db8:acad:2::2 5
    R1# show ipv6 route static

## 15.5 Configuracion de Static Routes: host routes

- 15.5.4 **Configuracion de rutas de host estaticas**
    R1# ip route 192.168.0.10 255.255.255.255 10.10.10.1
    R1# ip route 192.168.0.10 255.255.255.255 S0/0/0 5

- 15.5.6 **Config de rutas de host estaticas con Link-Local de Next Hop**
    R1# ipv6 route 2001:db8:f:f::10/128 2001:db8:a:1::1
    R1# ipv6 route 2001:db8:f:f::10/128 S0/0/0 5