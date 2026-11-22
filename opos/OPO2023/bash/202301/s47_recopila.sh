#!/bin/bash

<< 'Enunciado'

Enunciado
    Material


#!/bin/bash
# Script que calcula el número de ficheros scripts (.sh) 
# de todos los usuarios o del usuario recibido como argumento (opcional)
# Sintaxis:
# ./recopila.sh [usuario] <fichero_salida>
#

# Función ayuda
function ayuda {
    echo ""
    echo "Script que realiza la cuenta de ficheros script de un usuario concreto"
    echo "o de todos los usuarios en su defecto."
    echo "Se generará un fichero resultado pasado como parámetro"
    echo ""
    echo "Sintaxis:"
    echo "$0 [usuario] <fichero_salida>"
    exit 1
}

function salida () {		#Función para mostrar un mensaje y terminar script con código de terminación 1
	echo "Aviso: $1"
	exit 1
}
# PROGRAMA PRINCIPAL

# Comprobación del número de parámetros
if [[ $# -lt 1 || $# -gt 2 ]]				#Número incorrecto de parámetros
then
	echo "Número de parámetros no válido"
	ayuda	
fi

vnomusu=""          #Inicialización de variable que contiene el nombre de usuario detectado
vfichero=$1         # En caso de no detectar argumento usuario, el fichero es el primer argumento
if [[ $# -eq 2 ]]   # Si se dan dos argumentos, compruebo que $1 es un usuario válido
then
	id $1 &>/dev/null && vnomusu=$1 || salida "No existe el usuario"	# Comprobación de existencia del usuario
	vfichero=$2	#Si hay un usuario válido, entonces el fichero es el segundo argumento
fi

#Creamos el fichero de salida con cabecera
echo -e "DIRECTORIO DE USUARIO \t NUMERO DE FICHEROS SCRIPTS (.SH)" | tee ${vfichero}	

if [[ ${vnomusu} != "" ]] 	# si se ha indicado un nombre de usuario
then
	vnumf=$(find /home/${vnomusu} -name "*.sh" | wc -l)
	# Escribir línea en fichero (-e para que interprete caracteres de control)
	echo -e "/home/${vnomusu} \t\t ${vnumf}" | tee -a ${vfichero}			
else
	vtotal=0
	for i in $(ls -d /home/*)
	do
		vnumf=$(find ${i} -name "*.sh" | wc -l)
		echo -e "${i} \t\t ${vnumf}" | tee -a ${vfichero}			
		vtotal=$((${vtotal}+${vnumf}))
	done
	echo "------------------" | tee -a ${vfichero}
	echo -e "TOTAL FICHEROS \t\t ${vtotal}" | tee -a ${vfichero}
fi

exit 0	# Salida con código de terminación 0



