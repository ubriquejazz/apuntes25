# IPTABLES

El firewall es un linux con IPTABLES: la politica por defecto es DROP en las cadenas IN, OUT y FORWARD.
Escriba dos lineas de comando para anadir las reglas que permitan:

- a los equipos de la red PROTEGIDA realizar conexiones https (443) a la maquina WEBSERVER
- a las respuestas de dicho servidor (192.168.1.100) volver a la red PROTEGIDA (2.0/24)

    iptables -A FORWARD -i en03 -s 192.168.2.0/24 -o en02 -d 192.168.1.100 -p tcp --dport 443 -j ACCEPT

    iptables -A FORWARD -i en02 -s 192.168.1.100 -o en3 -d 192.168.2.0/24 -p tcp --dport 443 -j ACCEPT
    