#!/bin/bash
#####################################################################
echo ; echo
# 
DIAMES=`date '+%d'`
if [ "$1" ]
	then DIAMES=$1
fi
# Hay que eliminar los posibles ceros a la izquierda obtenidos
# en la variable DIAMES. Usamos para ello printf(1)
DIAMES=`printf %d $DIAMES`
# Resaltar el día del més correspondiente al día de hoy,
# Si es el último día del mes añadiremos un blanco al final y así 
# usaremos siempre como patrón de sustitución el día més $DIAMES
# entre dos caracteres blancos sin errores en el último diá del mes. 
cal | head -n 1 
cal | tail -n 7 | sed 's/$/& /g' | sed 's/   / 0 /g' |  sed 's/.[0-9a-zA-Z] /&  /g' |  sed 's/ 0 /   /g' |  sed 's/^/ /g' | sed "s/ $DIAMES /\[${DIAMES}\]/"
