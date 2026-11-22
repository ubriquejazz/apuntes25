#!/bin/bash

# Según la hora del sistema: Buenos días, tardes, noches
hora=$(date +%H)			# hora <-- hora de la fecha actual
echo "La hora es: $hora"	# muestra en pantalla un mensaje con solo la HORA

if [[ $hora>=05 && $hora<=12 ]]	; then  # Rango de horas para Buenos días
	echo "Buenos días"
fi

if [[ $hora>=13 && $hora<=20 ]]	; then  # Rango de horas para Buenas tardes
	echo "Buenas tardes"
fi

if [[ $hora>=21 || $hora<=04 ]]	; then  # Rango de horas para Buenas noches
	echo "Buenas noches"
fi
