#!/bin/bash
# Relación de scripts de junio 2022

# Ej5.sh --> Empleando array o lista, recibe argumento $1 un directorio e introduce en un array todos los ficheros del directorio
# A continuación pedir por teclado introducir un valor desde 1 hasta número máximo de elementos del array
# Mediante función: Mostrar el elemento del array indicado por el número introducido y el numero de caracteres que tiene
# Repetir hasta pulsar cero (0)

function ayuda () {
	echo "Script Shell Bash de Linux"
	echo "Guarda ficheros del directorio pasado como argumento en un array para despues consultar los elementos del array"
	echo "Sintaxis:"
	echo " $0 directorio"
}

# Comprobación argumentos
if [[ $# -ne 1 ]] ; then
	ayuda
	exit 1
fi

#Comprobación de que existe el directorio
if [[ -d $1 ]]; then
	# realizar el contenido del script
	lista=()
	for x in $1/*; do
		lista=("${lista[@]}" "$x") 
	done
	echo "${lista[@]}"
	
	read -p "Introduce un número entre 1 y ${#lista[@]} " tecla	
	# Damos por hecho que el usuario no se equivoca
	while [[ tecla -ne 0 ]]; do	
		echo "El elemento $tecla en el array es: ${lista[$tecla-1]}"	# Array empieza en 0 hasta max-1
		echo 
		read -p "Introduce un número entre 1 y menor que ${#lista[@]} " tecla	
		# Damos por hecho que el usuario no se equivoca
		echo "La tecla pulsada es: $tecla"
	done
else
	echo "No existe el directorio pasado como paramétro: $1"
	exit 1
fi

# Terminación normal de programa
exit 0
