# Informatica PES (107)

## R1. Algoritmo de encamiento IP

Imagina un paquete IP saliendo de un Host A en la **Red A**.

Host A (por ejemplo, 192.168.1.10) quiere enviar un paquete a Host B (por ejemplo, 10.0.0.5).

El Host A compara la dirección IP de destino (10.0.0.5) con su propia red (192.168.1.0/24). Como no están en la misma red, el Host A envía el paquete a su puerta de enlace predeterminada, que es la interfaz de un **Router 1** (por ejemplo, 192.168.1.1).

El Router 1 recibe el paquete. Consulta su tabla de enrutamiento. Si en su tabla de enrutamiento tiene una entrada que dice "para llegar a la red 10.0.0.0/8, el siguiente salto es 172.16.0.2 (que es la interfaz de un Router 2)", entonces el Router 1 reenviará el paquete a la interfaz del **Router 2**.

El paquete viaja a través de una **Red B** (por ejemplo, 172.16.0.0/30) que conecta el Router 1 y el Router 2.

El Router 2 recibe el paquete. Consulta su propia tabla de enrutamiento. Encuentra que la red 10.0.0.0/8 está directamente conectada a una de sus interfaces (por ejemplo, 10.0.0.1).

El Router 2 envía el paquete a la **Red C** (por ejemplo, 10.0.0.0/8), donde finalmente llega al Host B (10.0.0.5).

Un diagrama mostraría estos elementos conectados con líneas y flechas, indicando claramente las direcciones IP de las interfaces, las redes y los hosts, y cómo un paquete "salta" de un router a otro hasta llegar a su destino.

## R2. Tabla de encaminamiento

Cada entrada en una tabla de encaminamiento suele incluir la siguiente información:

- Red de Destino: La dirección IP de la red o subred a la que se quiere llegar (por ejemplo, 192.168.1.0/24). Esto puede ser una red directamente conectada o una red remota.
- Máscara de Subred: Se utiliza junto con la dirección de red para definir el rango de direcciones IP dentro de esa red.
- Puerta de Enlace (Gateway) / Siguiente Salto (Next Hop): La dirección IP del siguiente router en el camino hacia la red de destino, o la interfaz de salida si la red de destino está directamente conectada al dispositivo.
- Interfaz de Salida: La interfaz de red específica del dispositivo por la que se debe enviar el paquete para alcanzar el siguiente salto o la red de destino.
- Métrica: Un valor numérico que indica la "distancia" o el "costo" de una ruta. Los dispositivos utilizan la métrica para elegir la mejor ruta cuando hay varias opciones disponibles para el mismo destino (por ejemplo, la ruta con la métrica más baja suele ser la preferida).

Las entradas en una tabla de encaminamiento pueden generarse de varias maneras:

- Rutas directamente conectadas: Se añaden automáticamente cuando una interfaz de red se configura con una dirección IP y se activa. El router sabe cómo llegar a los dispositivos de esa red sin necesidad de un salto adicional.

- Rutas estáticas: Son rutas que un administrador de red configura manualmente. Son fijas y no cambian a menos que se modifiquen manualmente. Son útiles para redes pequeñas o para dirigir tráfico a destinos específicos.

- Rutas dinámicas: Son rutas que se aprenden y actualizan automáticamente mediante protocolos de enrutamiento dinámico (como OSPF, EIGRP, BGP, RIP). Estos protocolos permiten a los routers intercambiar información sobre la topología de la red, adaptar las rutas a los cambios y encontrar las rutas más eficientes.

- Ruta por defecto (Default Route): Es una ruta especial que se utiliza cuando no hay ninguna otra entrada en la tabla de encaminamiento que coincida con la dirección IP de destino del paquete. Actúa como un "último recurso" y a menudo apunta a la puerta de enlace a Internet.

## R3.Cuántos ordenadores se pueden conectar a una red con una máscara de subred 255.255.255.240

La direccion de la red en formato CIDR es A.B.C.D/28

Una dirección IPv4 tiene 32 bits en total. Si 28 bits son para la red, los bits restantes son para los hosts: 32−28=4 bits para hosts. En este caso: 16 direcciones IP.

En cualquier subred, dos direcciones IP están reservadas y no pueden ser asignadas a hosts:

- La dirección de red (la primera dirección en el rango), que se utiliza para identificar la subred.

- La dirección de broadcast (la última dirección en el rango), que se utiliza para enviar datos a todos los dispositivos en esa subred.

Por lo tanto, el número de direcciones de host utilizables es: 16−2=14.

## R4. Si la puerta de enlace es 192.168.0.1, escriba 7 direcciones IP que pudieran tener los equipos de dichar red

Esto significa que la red a la que pertenecen los equipos muy probablemente sea la 192.168.0.0/28, las direcciones IP utilizables para los equipos van desde la 192.168.0.2 hasta la 192.168.0.14.



## Bases de datos

1. Diseñar el esquema E-R empleando el modelo extendido
1. Obtener las tablas correspondientes a dicho modelo respetando la normalizacion 3FN
1. En que posibles materias de la ESO y Bachillertao podrian encuatrarse los contenidos desarrollados en este ejercicio.

## Programacion

Codigo C para 1-Sumar, 2-Restar, 3-Dividir, 4-Multiplicar, 5-Salir
