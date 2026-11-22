#!/bin/bash
typeset -i POSICION=1
typeset -i VECES=1
while  [ $POSICION -le $1 ]
do
	VECES=1
	while [ $VECES -le $POSICION ]
	do
		echo -n "`printf %02d $POSICION` "
		let VECES+=1
	done
	echo
	let POSICION+=1
done
