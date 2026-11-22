#!/bin/bash
# Script que calcula el número de ficheros scripts (.sh) de todos los usuarios o del usuario recibido como argumento (opcional)
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

vnomusu=""			#Inicialización de variable que contiene el nombre de usuario detectado
vfichero=$1			# En caso de no detectar argumento usuario, el fichero es el primer argumento
if [[ $# -eq 2 ]]		# Si se dan dos argumentos, compruebo que $1 es un usuario válido
then
	id $1 &>/dev/null && vnomusu=$1 || salida "No existe el usuario"	# Comprobación de existencia del usuario
	vfichero=$2	#Si hay un usuario válido, entonces el fichero es el segundo argumento
fi

echo -e "DIRECTORIO DE USUARIO \t NUMERO DE FICHEROS SCRIPTS (.SH)" | tee ${vfichero}	#Creamos el fichero de salida con cabecera


case $# in
	1)
	#Proceso para todos los usuarios recogidos en /etc/passwd
	vtotal=0
	while IFS=':' read vnomusu vx2 vx3 vx4 vx5 vruta vshell
	do
	   if [[ -d ${vruta} ]] # Procesamos el usuario si existe el directorio de trabajo
	   then 

		vnumf=$(find ${vruta} -name "*.sh" 2>/dev/null | wc -l)
		echo -e "${vruta} \t\t ${vnumf}" | tee -a ${vfichero}			# Escribir línea en fichero
		vtotal=$((${vtotal}+${vnumf}))
	   fi
	done < /etc/passwd
	echo "------------------" | tee -a ${vfichero}
	echo -e "TOTAL FICHEROS \t\t ${vtotal}" | tee -a ${vfichero}
	# Fin proceso para todos los usuarios	
	;;
	
	2)
	vruta=$(cat /etc/passwd | grep ${vnomusu} | cut -d: -f6)
	vnumf=$(find ${vruta} -name "*.sh" | wc -l)
	echo -e "/home/${vnomusu} \t\t ${vnumf}" | tee -a ${vfichero}			# Escribir línea en fichero (-e para que interprete caracteres de control)
	;;
esac

exit 0	# Salida con código de terminación 0

