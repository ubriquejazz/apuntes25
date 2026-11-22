#!/bin/bash

# Script al que se le pasa como argumento el nombre de un fichero y muestra en pantalla el contenido cambiando:
# R_minusculas.txt: contenido del fichero todo en minusculas
# R_mayusculas.txt: contenido del fichero en mayúsculas
# R_sinA.txt: contenido del fichero eliminando todas las ocurrencias de la letra "a"
# R_VOCALES.txt: contenido del fichero pasando todas las vocales a mayúsculas
# https://linuxhint.com/bash_tr_command/


function ayuda () {
	echo "Script que qe hace cambios en el contenido de un fichero generando ficheros"
	echo "- R_minusculas.txt: contenido del fichero todo en minusculas"
	echo "- R_mayusculas.txt: contenido del fichero en mayúsculas"
	echo "- R_sinA.txt: contenido del fichero eliminando todas las ocurrencias de la letra a"
	echo "- R_VOCALES.txt: contenido del fichero pasando todas las vocales a mayúsculas"
	echo "Sintaxis:"
	echo "	$0 <fichero_texto_plano>"
	echo " "
}

# Comprobación del número de argumentos
if [[ $# -ne 1 ]]
then
	echo "Número de argumentos incorrecto"
	ayuda
	exit 1	#salida con error
fi

clear 
echo "Generar fichero en minúsculas"
cat $1 | tr [:upper:] [:lower:] | tee data/R_minusculas.txt	
echo
echo "Generar fichero en mayusculas"
cat $1 | tr [:lower:] [:upper:] | tee data/R_mayusculas.txt	
echo
echo "Generar fichero sin la vocal a,A"
cat $1 | tr aA ' ' | tee data/R_sinA.txt	# ponemos un espacio en blanco en su lugar
echo
echo "Todas las vocales en mayúsculas"
cat $1 | tr [aeiou] [AEIOU] | tee data/R_VOCALES.txt	
echo
exit 0

