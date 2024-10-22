## 13.2 Configure a basic WLAN on the WLC

- 13.2.1 **WLC Topology**

        Configure the wireless LAN controller with two WLANs. One WLAN will use WPA2-PSK authentication. The other WLAN will use WPA2-Enterprise authentication. You will also configure the WLC to configure a DHCP scope that will be used by the wireless management network.

        WLAN VLAN 2     SSID-2    WPA2-PSK              192.168.2.0/24
        WLAN VLAN 5     SSID-5    WPA2-Enterprise       192.168.5.0/24

- 13.2.2 **Configure WLAN interface**

        Name: WLAN 2
        VLAN Identifier: 2
        Port Number: 1
        Interface IP Address: 192.168.2.254/24
        Gateway: RTR-1 G0/0/0.2 address 
        Primary DHCP Server: Gateway address

- 13.2.3 **Create WLANs**

        Profile Name: Wireless VLAN 2
        WLAN SSID: SSID-2
        ID: 2
        Interface: WLAN 2
        Security: WPA2-PSK
        Passphrase: Cisco123

- 13.2.4 **DHCP scope for wireless management network**
        
        Scope Name: management
        Pool Start Address: 192.168.100.235
        Pool End Address: 192.168.100.245
        Network: 192.168.100.0/24
        Default Routers: 192.168.100.1

        SW1 administration VLAN 100 at 192.168.100.x/24
        Server administration VLAN 100 192.168.100.x/24

        El AP está usando la dirección IP 192.168.100.x Debido a que el protocolo CDP esta activo en esta red, el WLC sabe que el AP está conectado al puerto FastEthernet 0/1 del switch.

- 13.2.5 **Inter-VLAN Routing**
    
        R1 with subinterfaces:
                G0/0.2   192.168.2.1
                G0/0.5   192.168.5.1
                G0/0.100 192.168.100.1/24
        
        