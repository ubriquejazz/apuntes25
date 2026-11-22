#!/bin/bash

# Script que recibe tres argumentos. Los dos primeros deben ser ficheros y existir. 
# Mostrará las diferencias de los ficheros recibidos en los dos primeros argumentos
# Y guardará el resultado en un fichero pasado como tercer argumento.

function ayuda {
    echo ""
    echo "Script para comparación de dos archivos con salida a un tercer fichero"
    echo "Uso:"
    echo "./ej3.sh <fichero1> <fichero2> <fichero3>"
    echo ""
}

if [[ $# -ne 3 ]]
then
    echo "Número de argumentos incorrecto"
    ayuda
else

    #Comprobar que existen ficheros argumento1 y argumento 2
    if [[ -f $1 ]] && [[ -f $2 ]]           # Existen ambos ficheros - 2 primeros argumentos
    then
        diff -y $1 $2 | nl | tee $3         # Comparar ficheros y guardar resultado en fichero $3
    else
        echo "Los ficheros pasados como primer y segundo argumento deben existir"
    fi
fi

exit 0          # salida sin errores
