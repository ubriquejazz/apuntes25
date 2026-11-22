#!/bin/bash 
clear 
read -p "Introduzca un número para calcular su factorial? " NUM 
#LONG=$(expr length "$NUM") 
LONG=3
PATRON="" 
for (( i=1; i<=$LONG; i++ )); do
    PATRON=$PATRON[0-9] 
done
echo $PATRON

VAL=$(expr match "$NUM" $PATRON) 
if [ $VAL = $LONG ]; then
    FACT=1
    for ((i=1;$i<=$NUM;i++)); do
        FACT=$(echo "$FACT*$i" | bc -l)
    done
    echo "El factorial de $NUM es $FACT" 
else
    echo "El número $NUM no es válido" 
fi