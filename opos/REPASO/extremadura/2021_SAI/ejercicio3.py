'''
Escribir un script para un sistema GNU/Linux que dispone de systemd como sistema de inicio. El script recibe un máximo de dos argumentos: 
 
a. El nombre de la cuenta del usuario a crear 
b. El tamaño en MB de la carpeta personal 
 
Los requisitos que se deben cumplir son los siguientes: 

a.  Deberá  crear  una  nueva  cuenta  de  usuario  con  el  nombre  proporcionado.  La  carpeta personal (HOME) de la cuenta creada consisten en un sistema de ficheros en RAM con el tamaño indicado en el argumento b 

b.  Deberá poner en marcha el mecanismo para copiar el contenido de la carpeta /etc/inicio/ y 
todas sus subcarpetas a la carpeta personal del usuario cada vez que se inicie el sistema 
'''