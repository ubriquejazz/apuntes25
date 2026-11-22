#!/bin/bash

# Shell script de de Linux que simule el comando find
# Podrá recibir de 1 a 3 argumentos
#	- Un par --> el fichero a buscar en el directorio actual
#	- Dos par --> Directorio (absoluto) y fichero a buscar en el
#			o fichero y opción "-s" para buscar ruta actual y subdirectorios
#	- Tres par--> Directorio (absoluto),fichero y opción "-s": buscará el fichero en la ruta y subdirectorios

function ayuda () {
	# Muestra ayuda de como usar el script
	echo "Shell Script para buscar un fichero en una ruta"
	echo "Sintaxis:"
	echo "$0 fichero                  : busca el fichero en la ruta actual"
	echo "$0 ruta fichero             : busca el fichero en la ruta indicada"
	echo "$0 fichero -s               : busca el fichero en la ruta actual y subdirectorios"
	echo "$0 directorio fichero -s    : busca el fichero en la ruta indicada y subdirectorios" 
	echo ""
}

function busca_fichero(){
	# Comprueba si existe el fichero con ruta completa $1/$2
	# Parámetros: $1: fichero
	if [[ -f $1 ]]
	then
		echo "Fichero $1 encontrado"
	else
		echo "No se ha encontrado el fichero $1"
	fi
}

function busca_r() {
	# Comprueba si un fichero existe en una ruta y sus subdirectorios
	# Emplea el comando du para obtener las posibles rutas para buscar el fichero
	# Parámetros: $1: ruta; $2 fichero
	flag=false
	ruta=$1
	fich=$2
	for i in $(du ${ruta} |  cut -f2)		# tomar el segundo campo del resultado de du
	do
		if [[ -f $i/$fich ]]
		then
			echo "Fichero encontrado en la ruta: $i/$fich"
			flag=true
		fi
	done
	if  ! $flag 
	then
		echo "Fichero $2 no encontrado en $1 ni en ninguno de sus subdirectorios"
	fi
}


# PROGRAMA PRINCIPAL
# Verificación de los parámetros de entrada al script

case $# in

	1)	busca_fichero $1;;

	2)	# Faltaría validar los parámetros recibidos
		if [[ $2 == "-s" ]]
		then
			busca_r "." $1
		else
			busca_fichero "$1/$2"
		fi
		;;

	3)	# Faltaría validar los parámetros recibidos
		busca_r $1 $2
		;;
		
	*) echo "Número de parámetros incorrecto"; ayuda; exit 1;;
esac
