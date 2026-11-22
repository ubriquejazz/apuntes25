#!/bin/bash

# Script que recibe un argumento (solo uno) y que hará:
# Si num.arg >1 --> "Número de argumentos incorrecto" + ayuda 
# Arg debe ser un fichero --> comprobar que existe y si no "No existe el fichero"
# Si existe el fichero --> mostrar contenido en pantalla con lineas numeradas
# Mostrar al final el número de lineas del fichero, número de palabras y número de caracteres del fichero

function muestra_ayuda {
    echo ""
    echo "      Sintaxis correcta del script:"
    echo "      ./ej2.sh <nombre_fichero>"
    echo ""
}

if [[ $# -ne 1 ]]; then         #Num.Arg. != 1
    echo "Número de argumentos incorrecto"
    muestra_ayuda
else
    if [[ -f $1 ]]; then        # Si existe el fichero
        cat -n $1 
        palabras="Palabras: $(wc -w $1)"        # Almacenar número de palabras
        lineas="Líneas:  $(wc -l $1)"            # Almacenar número de líneas
        echo
        echo "${palabras%%$1}"                  # Eliminar el nombre del fichero (resultado wc -w $1)
        echo "${lineas%%$1}"
    else 
        echo "No existe el fichero $1"    
    fi
fi
   
# Finalización correcta del Script
exit 0
