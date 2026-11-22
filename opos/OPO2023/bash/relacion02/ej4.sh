#!/bin/bash
# Relación de scripts de junio 2022

# Ej4.sh --> Obtener listado del directorio actual (ls) ordenados por nombre de fichero
# salida en un fichero pasado como argumento $1 y de forma que exista un separador de campo (dos puntos)

function ayuda () {
	echo "Script Shell Bash de Linux"
	echo "Obtiene el listado del directorio actual ordenado por nombre"
	echo "en un fichero pasado como argumento y con separador de campo (:)"
	echo "Sintaxis:"
	echo " $0 fichero_salida"
}

# Comprobación de argumentos
if [[ $# -ne 1 ]] ; then
	ayuda
	exit 1
fi

for x in * ; do
	echo -n "$x:" >>$1
done
echo "Creado el fichero resultado $1"