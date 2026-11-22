#!/bin/bash
# Programa que calcula el factorial de un número 
# Este script no recibe parámetros

clear

read -p "Introduce un número: " numero

# Comprobar que es una expresión numérica
					# Mediante expresiones regulares
if [[ $numero =~ ^[0-9]+$ ]]		# Solo admite digitos del 0 al 9
then
	echo "Se ha introducido un valor numérico"
	factorial=1
	cadena="1"
	for ((i=1;$i<=$numero;i++))
	do
		factorial=$(($factorial*$i))
		echo "iteración $i =====> $cadena x $i = $factorial"
		cadena="$cadena x $i"
	done

else
	echo "El valor introducido no es numérico"
fi

