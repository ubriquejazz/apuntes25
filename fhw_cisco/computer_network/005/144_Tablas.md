## 14.4  Tabla de enrutamiento IP

- 14.4.1 **Origen de la ruta**
    L 10.0.1.1/32 default gateway
    C 10.0.1.0/24 network
    O 10.0.5.0/24 [111/40] a 10.0.3.2, Serial 0/1/1
    S 10.0.4.0/24 [1/0] via 10.0.3.2
    *

- 14.4.3 **Tabla Enrutamiento**
    1. Origen de la ruta (O, C, L)
    2. Red remota (mascara o long. prefijo)
    3. Distancia administrativa / metrica
    5. Siguiente salto
    6. Interfaz de salida

- 14.4.4 **Redes conectadas directamente**
- 14.4.5 **Rutas estaticas**

- 14.4.6 **Rutas estaticas en tablas de enrutamiento**
    R1# ip route 10.0.4.0 255.255.255.0 10.0.3.2
    R1# show ip route static

- 14.4.7 **Protocolos enrutamiento dinamico**
- 14.4.8 **Rutas dinamicas en tablas de enrutamiento**
- 14.4.9 **Ruta predeterminada**
- 14.4.10 **Estructura de una tabla de enrutamiento**
  
- 14.4.12 **Distancia administrativa**
    000 - Conectado directamente
    001 - Ruta estatica
    090 - EIGRP
    110 - OSPF
    120 - RIP, Routing Protocol