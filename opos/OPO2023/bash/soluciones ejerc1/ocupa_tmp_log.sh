#!/bin/bash
# Obtiene la ocupacion de los directorios presentes en el sistema 
# cuyo nombre sea de la forma '*tmp' o '*log', ordenados por orden 
# de ocupacion.
#
# Debera mostrar el numero de errores provocados por 'find'.
# Si se decide usar algzn fichero temporal debera usar el
# directorio '/tmp' para ello y usar un nombre que contenga 
# el nombre del proceso que lo origino y su pid.
#
du -s `find / -type d \( -name '*tmp' -or -name '*log' \) 2> /tmp/$0.$$.err` | sort -n
echo "Errores de acceso con find `wc -l /tmp/$0.$$.err`"
