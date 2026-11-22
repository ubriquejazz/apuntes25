#!/bin/bash

function suma() {
	#echo Suma recibe $# params que son: $*
	echo $(($1 + $2))
	return 0
}

resultado=$(suma 3 5)
echo "La variable del sistema es $?"
echo "La funcion ha devuelto $resultado"
