#!/bin/bash
# Relación de scripts de junio 2022
# Ejercicio ej1.sh

# Pedir dos números por teclado (x,y) y mostrar en pantalla la cuenta desde x hasta y.
# Se repetirá todo el proceso hasta que el valor x sea 99, que finalizará.
# La información se presentará de la siguiente forma:
#  x=2; y=4 --> 2/4, 3/4, 4/4

vx=0
vy=0
read -p "Introduce el valor de X: " vx

while (($vx!=99))					# comparacion tipo string
do
	read -p "Introduce el valor de Y: " vy
	echo -n "X=$vx; Y=$vy --> "		# Opción -n para omitir salto linea 
#	for (( i=$vx; i<$vy, i++ )) 
	for i in $(seq $vx $vy)	; do	# Bucle contador
		echo -n  "$i/$vy; " 
	done

	echo 
	read -p "Introduce el valor de X: " vx		
done

# Al introducir 99 terminará el programa
exit 0

