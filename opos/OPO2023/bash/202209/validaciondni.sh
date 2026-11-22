#!/bin/bash 
read -p "Introduzca el número de su DNI? " NUMERO 
read -p "Introduzca la letra de su DNI? " LETRA 
LETRA=$(echo $LETRA | tr [a-z] [A-Z]) 
declare -a LETRASDNI=( T R W A G M Y F P D X B N J Z S Q V H L C K E ) 
POS=$[$NUMERO%23] 
LETRACALCULADA=${LETRASDNI[$POS]}

if [ $LETRA = $LETRACALCULADA ];then
    echo "DNI correcto" 
else
    echo "DNI erroneo" 
fi