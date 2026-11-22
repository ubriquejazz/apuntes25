#!/bin/bash

# Mostrar información legible por pantalla sobre el usuario del sistema
# 	Nombre de usuario (obtenido de la variable del sistema)
# 	Directorio de trabajo: /home/jgago
# 	Shell asociada al usuario: /bin/bash

function ayuda () {
	echo "Script que muestra información del usuario pasado como argumento"
	echo "Sintaxis:"
	echo "	$0 <usuario>"
	echo " "
}

# Comprobación de número de argumentos
if [[ $# -ne 1 ]]; then
	echo "Número de argumentos incorrecto"
	ayuda
	exit 1	#salida con error
fi

# Buscar usuario
cat /etc/passwd | grep $1 >/dev/null
if [[ $? -eq 0 ]]	# Usuario encontrado
then
	echo "Nombre de usuario: $1"
	echo "Directorio de trabajo: $(cat /etc/passwd | grep $1 | cut -d: -f6)"
	echo "Shell asociada al usuario: $(cat /etc/passwd | grep $1 | cut -d: -f7)"
else
	echo "Usuario no encontrado"
	exit 1	#salida con error
fi

exit 0	#salida sin error