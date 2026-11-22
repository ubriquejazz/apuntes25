# Subnetting VLSI

## Ejercicio 08

Superred 10.16.10.0/24

Subred R1 - 10.16.10.0/26
    - mascara 0xC0 = 255.255.255.192
    - bcast 10.16.10.63 (0x3F = B'0011 1111)

Subred R2 - 10.16.10.192/28
    - mascara 0xF0 = 255.255.255.240
    - cuarto byte = 192 = 0xC0
    - bcast = 10.16.10.207

Subred R3 para 25 < 2^5 host
    - mascara 32-5 = 27
    - subred 10.16.10.64/27

## Necesitamos conectar 1000 nodos a internet 

1000 nodos = 2^10

Tipo C - 199.143.120.0/24
32 - 10 = 22 --> CIDR/22, FF.FF.FC.00 

Tercer byte:

- 120 = 0x78 = B'0111 1000
- mask  0xFC = B'1111 1100

Superred 199.143.120.0/22

Mascara 255.255.252.0

Broadcast 199.143.123.255/22

- 0xFC = B'1111 1100
- B'0111 1011 = 0x7B = 123

