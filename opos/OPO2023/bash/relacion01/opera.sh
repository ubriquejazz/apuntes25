#!/bin/bash

echo "Ejercicio 1: calculadora post-orden"

#comprobar numero de argumentos
if [ $# -ne 3 ]
then
    echo "numero de argumentos incorrecto, usar ./opera.sh v1 v2 op"; exit 1
fi
# argumento operador
case $3 in '+' | '-' | '\' | '*') op=$3;;
    *) echo "el operador no es valido"; exit 1;;
esac
r=$(($1 $op $2))
echo "$1 $op $2 = $r"
