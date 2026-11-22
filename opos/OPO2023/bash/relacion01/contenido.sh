#!/bin/bash

op=1
clear
echo "Ejercicio 3: directorio (1) y fichero (2)"

if [ $# -eq 2 ]
then
    if [ -d $1 ]
    then
        if [ -f $1/$2 ]
        then
            read -p "Acceder al contenido de $1/$2(s/n)?  " leer
            if [ $leer == 's' ]
            then
                cat $1/$2
            fi

        else
            echo "file $1/$2 does not exits"
        fi
    else
        echo "folder $1 does not exits"
    fi
else
    echo "num argumentos incorrecto"
fi