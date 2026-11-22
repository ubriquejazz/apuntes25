# iptables

    iptables -A [INPUT/OUTPUT/FORWARD]
    [-i] [-o]
    [-s 'direccion de origen'] [-d 'direccion destino']
    [-p tcp|udp|icmp] 
    [--sport 'puerto origen'] [--dport 'puerto destino']
    [-m state] [--state New|Established]
    [-j ACCEPT|DROP|REJECT]

## permitir pings entre todas las maquinas

## permitir acceso de red al DNS en server1

## permitir acceso de red local a http/https en server02

## permitir acceso de red local a http/https a traves de eth0