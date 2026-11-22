#!/bin/bash 

#Creación de la lista con los meses del año 
meses=(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)

echo "Mostramos todos los elementos de la lista" 
echo ${meses[@]}

echo "En la lista hay un total de ${#meses[@]} elementos"
echo "El elemento 2 de la lista (${meses[2]}) tiene ${#meses[2]} carácteres" 
echo "El elemento 8 de la lista (${meses[8]}) tiene ${#meses[8]} carácteres"

#Recorrido de la lista mediante un bucle  
for i in "${meses[@]}"; do echo "$i"; done

#Modificar el elemento 6 por el valor JULY 
meses[6]="JULY"

echo "Cambiamos el elemento 6 por el valor JULY y mostramos la lista completa" 
echo ${meses[@]}

echo "eliminamos el mes de noviembre (posición 10)" 
unset meses[10] 
echo "La lista ahora queda así ${meses[@]} y tiene un total de ${#meses[@]} elementos"
meses=( ${meses[@]:0:10} "noviembre" ${meses[@]:11:1} )

echo "Volvemos a añadir noviembre en su lugar y la lista queda así:" 
echo "${meses[@]}" 
echo "Que tiene un total de ${#meses[@]} elementos" 
mesesB=${meses[@]//o/0} 
echo "Cambiamos todas las ocurrencias de la letra o por un cero 0" 
echo ${mesesB[@]}
