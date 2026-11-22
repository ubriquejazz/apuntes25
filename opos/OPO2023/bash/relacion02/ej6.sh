#!/bin/bash

function ayuda() {
	echo Leer pulsación de teclado y decir si la tecla pulsada es numero o letra
	echo El proceso se repetirá hasta pulsar la tecla intro
	echo "	$0 <nthing>"
	echo " "
}

tecla='inicio'
while [[ ${#tecla}>0 ]]; do
	read -n1 -p "Pulsa una tecla (Enter para salir) " tecla	
	echo 
	echo "Se ha pulsado la tecla $tecla"

	numero=$(($tecla))
	echo "Convertido a número sale $numero"	
	
	if [[ "$tecla" = "$numero" ]]; then
		echo "Se ha presionado una tecla numérica"
	else
		if [[ $tecla=[a-z,A-Z] ]]; then
			echo "Se ha pulsado una tecla tipo caracter"
		fi
	fi
	echo
done

echo "Se ha pulsado la tecla Enter"
echo "Programa finalizado"

