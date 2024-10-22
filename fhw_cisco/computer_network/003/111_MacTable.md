## 11.1 MAC Table Attacks

- 11.1.1 **Unused Ports**

- 11.1.2 **Learn MAC addresses**

  	S1(config)# interface fa0/1
  	S1(config-if)# switchport mode access
    S1(config-if)# switchport port-security
    S1(config-if)# switchport port-security maximum 2
    S1(config-if)# switchport port-security mac-address aaaa.bbbb.1234
    S1(config-if)# switchport port-security mac-address sticky 

- 11.1.6 **Violation Modes**

  	S1(config)# interface fa0/1
    S1(config-if)# switchport port-security violation { protect | restrict | shutdown} 

- 11.1.8 **Verify Port Security**

    S1# show run interface fa0/1
        switchport mode access
        switchport port-security maximum 2
        switchport port-security mac-address sticky
        switchport port-security mac-address sticky a41f.7272.676a
        switchport port-security mac-address aaaa.bbbb.1234

