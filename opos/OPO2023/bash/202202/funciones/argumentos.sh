#!/bin/bash

function suma() {
    echo "La funcion suma ha recibido $# argumentos y son $*"
    return $(($1 + $2))
}

suma 3 4
echo "la funcion suma ha devuelto el resultado $?"