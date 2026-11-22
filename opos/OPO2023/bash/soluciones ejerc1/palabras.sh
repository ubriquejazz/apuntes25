#!/bin/bash
while true
do
	echo "escriba tres palabras separadas por blancos"
	read pal1 pal2 pal3
	if [ "$pal1" = "$pal2" ]
	then
		if [ "$pal1" = "$pal3" ]
		then
			echo "Las tres son iguales"
		else
			echo "Son iguales primera y segunda"
		fi
	else
		if [ "$pal1" = "$pal3" ]
		then
			echo "Son iguales primera y tercera"
		else
			if [ "$pal2" = "$pal3" ]
			then
				echo "Son iguales segunda y tercera"
			else
				echo "Son las tres distintas"
			fi
		fi
	fi
done
