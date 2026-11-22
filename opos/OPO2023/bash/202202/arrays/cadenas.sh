#!/bin/bash

cadena="hola mundo"
echo "la cadena tiene ${#cadena} caracteres"
echo "la primera en mayusculas ${cadena^}"

cadenaM="HOLA MUNDO"
echo "convierto ${cadenaM} en minuscula ${cadenaM,,}"
echo "la primera pos. en minuscula ${cadenaM,}"

echo ' '
echo "extraigo subcadena de 5 char desde la pos 2: ${cadena:2:5}"
echo "extraigo desde la pos 5 hasta el final: ${cadena:5}"
echo "extraigo los ultimos 5 caracteres:      ${cadena:(-5)}"

echo "elimino la primera 'o': ${cadena/o}"
echo "elimino todas las 'o' : ${cadena//o}"
echo "sustituyo la primera 'o' por una Z: ${cadena/o/Z}"
echo "sustituyo todas las 'o' por Z     : ${cadena//o/Z}"

echo "eliminar desde la aparicion de 'la'      : ${cadena#*la}"
echo "eliminar desde la ultima aparicion de 'o': ${cadena##*o}"
echo "eliminar desde la 'o' mas lejana:  ${cadena%o*}"
echo "eliminar desde la 'o' mas cercana: ${cadena%%o*}"