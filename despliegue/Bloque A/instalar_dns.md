# Instalacion y configuracion

```
apt-get install bind9
cd /etc/bind
cp db.local prueba.local

nano named.conf.local
nano prueba.local
named-checkconf
```

## Recarga del servicio y prueba

```
service bind9 reload
dig @locahost www.prueba.com
```
![img](https://github.com/ubriquejazz/despliegue/blob/main/fig/dns_dig_cname.PNG)

## Instalación de servidor DNS

Bind es el estándar de facto para servidores DNS. Es una herramienta  de software libre y se distribuye con la mayoría de plataformas Unix y  Linux, donde también se le conoce con el sobrenombre de named (name  daemon). Bind9 es la versión recomendada para usarse y es la que  emplearemos.

Para instalar el servidor DNS en Ubuntu Server, usaremos los  repositorios oficiales. Por ello, podremos instalarlo como cualquier  paquete en Ubuntu:

```
sudo apt-get install bind9 bind9utils bind9-doc 
```

## Configuración del servidor

Puesto que en clase sólo vamos a utilizar IPv4, vamos a decírselo a Bind, en su archivo general de configuración. Este archivo `named` se encuentra en el directorio:

```
/etc/default
```

Y para indicarle que sólo use IPv4, debemos modificar la línea siguiente con el texto resaltado:

```
OPTIONS = "-u bind -4"
```

El archivo de configuración principal `named.conf` de Bind está en el directorio:

```
/etc/bind
```

Si lo consultamos veremos lo siguiente:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_1.png)

Este archivo sirve simplemente para aglutinar o agrupar a los  archivos de configuración que usaremos. Estos 3 includes hacen  referencia a los 3 diferentes archivos donde deberemos realizar la  verdadera configuración, ubicados en el mismo directorio.

### configuración *named.conf.options*

Es  una  buena  práctica  que  hagáis  siempre  una  copia  de   seguridad  de  un  archivo  de configuración cada vez que vayáis a  realizar algún cambio:

```
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup
```

Ahora editaremos el archivo `named.conf.options` e incluiremos los siguientes contenidos:

- Por motivos de seguridad, vamos a incluir una lista de acceso para  que sólo puedan hacer consultas recursivas al servidor aquellos hosts  que nosotros decidamos.

  En nuestro caso, los hosts confiables serán los de la red  192.168.X.0/24 (donde la X depende de vuestra red de casa). Así pues,  justo antes del bloque `options {…}`, al principio del archivo, añadiremos algo así:

  ![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_2.png)

Si nos fijamos el servidor por defecto ya viene configurado para ser  un DNS caché. El directorio donde se cachearán o guardarán las zonas es `/var/cache/bind`.

```
/var/cache/bind
```

- Que sólo se permitan las consultas recursivas a los hosts que hemos decidido en la lista de acceso anterior

- No permitir transferencia de zonas a nadie, de momento

- Configurar el servidor para que escuche consultas DNS en el puerto 53 (por defecto DNS utiliza puerto 53 UDP) y en la IP de su interfaz de la red privada. **Deberéis colocar la IP de la interfaz de vuestra Debian**, puesto que resolverá las consultas DNS del cliente/s de esa red.

- Permitir las consultas recursivas, ya que en el primer punto ya le hemos dicho que sólo puedan hacerlas los hosts de la ACL.

- Además, vamos a comentar la línea que pone `listen-on-v6 { any; };` puesto que no vamos a responder a consultas de IPv6. Para [comentarla](http://astro.uni-tuebingen.de/software/bind/comments.html) basta añadir al principio de la línea dos barras `//`. También podría hacerse con una almohadilla pero aparecería resaltado  con color ya que estos comentarios los suele utilizar el administrador  para aclarar algún aspecto de la configuración.

  ![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_3.png)

Podemos comprobar si nuestra configuración es correcta con el comando:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_4.png)

Si hay algún error, nos lo hará saber. En caso contrario, nos devuelve a la línea de comandos. 

Reiniciamos el servidor y comprobamos su estado:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_5.png)

### Configuración *named.conf.local*

En este archivo configuraremos aspectos relativos a nuestras zonas.  Vamos a declarar la zona “deaw.es”. Por ahora simplemente indicaremos  que el servidor DNS es maestro para esta zona y donde estará ubicado el  archivo de zona que crearemos más adelante:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_6.png)

### Creación del archivo de zona

Vamos a crear el archivo de zona de resolución directa justo en el  directorio que hemos indicado antes y con el mismo nombre que hemos  indicado antes.

El contenido será algo así (procurad respetar el formato):

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_7.png)

Recordad de teoría que los registros SOA son para detallar aspectos  de la zona autoritativa, los NS para indicar los servidores DNS de la  zona y los A las IPs respectivas.

Donde aparecen las X debéis poner vuestras IPs privadas correspondientes, tanto de vuestro servidor como de vuestro cliente..

### Creación del archivo de zona para la resolución inversa

Recordad que deben existir ambos archivos de zona, uno para la  resolución directa y otro para la inversa. Vamos pues a crear el archivo de zona inversa.

En primer lugar, debemos añadir las líneas correspondientes a esta zona inversa en el archivo **`named.conf.local`**, igual que hemos hecho antes con la zona de resolución directa:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_8.png)

Donde la X es el tercer byte de vuestra red.

Y la configuración de la zona de resolución inversa:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_9.png)

Podemos comprobar que la configuración de las zonas es correcta con el comando adecuado.

### Comprobación de las configuraciones

Para comprobar la configuración de la zona de resolución directa:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_10.png)m

Y para comprobar la configuración de la zona de resolución inversa:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_11.png)

Si todo está bien, devolverá OK. En caso de haber algún error, nos informará de ello.

Reiniciamos el servicio y comprobamos el estado:

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_12.png)

Atención

Es muy importante que el cliente esté configurado para usar como  servidor DNS el que acabamos de instalar y configurar. Ya sea Windows,  ya sea Linux, debéis cambiar vuestra configuración de red para que la  máquina con la que hagáis las pruebas utilice este servidor DNS como el  principal.

### Comprobación de las resoluciones y de las consultas

Podemos comprobar desde los clientes, con dig o nslookup las resoluciones directas e inversas:

Comprobación usando *dig*Comprobación usando *nslookup*

![img](https://raul-profesor.github.io/DEAW/img/3.1.bind_13.png)