
## Pregunta 1: 
Entre las tareas que corresponden a un administrador de bases de datos encontramos:
Compra de equipos, resolución de problemas de los usuarios.
Mantenimiento de usuarios, backups y recuperación ante caídas.
Imprimir los listados solicitados por los usuarios, garantizar la conexión a Internet desde cualquier punto de la empresa, mantenimiento antivirus.
## Pregunta 2: 
El almacenamiento MyISAM y el InnoDB:
No pueden coexistir en una misma base de datos, las tablas se definen de una u otra forma de forma excluyente.
Sí que pueden coexistir en una misma base de datos, pudiéndose cambiar el formato en cualquier momento.
Para que puedan coexistir se deben dar unas circunstancias especiales que casi nunca están presentes en la base de datos.
## Pregunta 3: 
Una de las diferencias entre los motores de almacenamiento MyISAM y InnoDB es:
En InnoDB el bloqueo se realiza a nivel de fila.
En MyISAM el bloqueo se hace a nivel de tabla.
Las dos afirmaciones anteriores son ciertas.
## Pregunta 4: 
Para conocer la versión de MySQL que tenemos instalada, desde la ventana de comando ejecutaremos:
VERSION ( )
SHOW VERSION( )
SELECT VERSION ( )
## Pregunta 5: 
Para conectarnos desde la ventana de comandos con el servidor de la base de datos MySQL, lanzaremos un comando con la sintaxis:
mysql -s servidor -u usuario -p
mysql-m servidor -u usuario -p
mysql -h servidor -u usuario -p
## Pregunta 6: 
Una de las principales características de la versión 5 de MySQL que no encontramos en versiones anteriores es:
La implementación de vistas.
El soporte.
El almacenamiento compartido.
## Pregunta 7: 
Para ejecutar únicamente una porción del fichero de LOG, lo hacemos:
Seleccionando el código necesario y ejecutándolo en la ventana de ejecución de MySQL.
Mediante mysqlbinlog indicando -start-position y -stop position
mediante mysqlbinlog, pegando en su ventana de ejecución el código necesario.
## Pregunta 8: 
Para analizar los ficheros de LOG generados por el servidor de MySQL, utilizamos:
Un editor de textos.
mysqlshowlog
mysqlbinlog
## Pregunta 9: 
Cuando trabajamos en MySQL con tablas MyISAM, los archivos de datos que almacenan las filas de las tablas, son ficheros con extensión:
.FRM
.MYD
.MYI
## Pregunta 10: 
Los ficheros de configuración se denominan:
my.ini en Windows y my.cnf en Linux
my_sql.ini bajo Windows y my_sql.cnf bajo Linux
sql.ini en Windows y sql.cnf bajo Linux
