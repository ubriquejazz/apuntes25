#!/bin/bash
#Comentario de cabecera con descripción de Script
# Dados los parámetros -l, --legible, -m, --modificable, -x, --ejecutable, -h, --help y un nombre de fichero
#


# Función ayuda
function ayuda {
    echo ""
    echo "supuesto.sh [opciones] fichero|directorio"
    echo "-l | --legible para saber si el fichero o directorio se puede leer o no "
    echo "-m | --modificable para saber si el fichero o directorio se puede modificar "
    echo "-x | --ejecutable para saber si el fichero o directorio es ejecutable o no "
    echo "-h | --help muestra esta ayuda "
    echo ""
}

#Función que comprueba la existencia del usuario. Si no existe finaliza el script

function valida_usuario {
	echo "Introduce nombre de usuario: "
	read -s vusuario
	cat /etc/passwd | cut -d: -f1 | grep $vusuario >/dev/null
	if [[ $? -eq 0 ]]
	then
		echo "Usuario correcto"
	else	
		echo "No existe el usuario en el sistema"
		exit 2			 # código de terminación cuando no existe el usuario
	fi
	
}


# PROGRAMA PRINCIPAL

# Comprobación del número de parámetros
if [[ $# -lt 2 || $# -gt 4 ]]				#Número incorrecto de parámetros
then
	echo "Número de parámetros no válido"
	ayuda	
	exit 3
fi


valida_usuario	# Llamada a función que comprueba si existe el usuario

echo "Información sobre el proceso....."
echo "El último parámetro es el nombre del fichero ${!#}"
echo "Número de parámetros recibidos  $#"


# Recorremos los parámetros
param_r=0
param_w=0
param_x=0
param_h=0

for i in $* 
do
	echo "Procesando parámetro... $i"

#Comprobar y Capturar cada parámetro recibido cuando no es el último parámetro (nombre fichero)
	
    if [[ $i == ${!#} ]]		# Si es el último parámetro (fichero o directorio)
    then 
     	#Capturamos el nombre de fichero o directorio
	echo "Detectado último argumento con nombre de fichero o directorio: $i"
     	nom_fd=$i
    else				# Si no es el último parámetro...
    	echo "Leyendo parámetro $i"
	case $i in
		"-l" | "--legible") 	param_r=1;; 
		
		"-m" | "--modificable")param_w=1;;
		
		"-x" | "--ejecutable") param_x=1;;
		
		"-h" | "--help")	ayuda; exit 0;;	#Finaliza el script correctamente mostrando ayuda.
		
		*) echo "Parámetro no válido"; exit 3;;	#Parámetro no válido y finaliza con código terminación 3
	esac	
	     
     fi  
done
# Fin de procesar parámetros ........................................................

#Comprobación de existencia de fichero
echo "Comprobamos existencia de fichero o directorio $nom_fd"

if [[ -d $nom_fd || -f $nom_fd ]] 	#Comprobación de si existe el directorio o fichero
then
	echo "$nom_fd es un fichero o directorio válido: $(ls -l $nom_fd)"

   # Comprobación de los permisos según los parámetros recibidos
   	
   if [[ $param_r -eq 1 ]]; then
	if [[ -r $nom_fd ]] 	#Comprobación permiso de lectura
	then 
		echo "Es legible"
	else
		echo "No legible"
	fi
   fi
	
   if [[ $param_w -eq 1 ]]; then
	
	if [[ -w $nom_fd ]]	#Comprobación permiso de escritura
	then 
		echo "Es modificable"
	else
		echo "No modificable"
	fi
   fi
   
   if [[ $param_x -eq 1 ]]; then
	if [[ -x $nom_fd ]]	#Comprobación permiso de ejecución
	then 
		echo "Es ejecutable"
	else
		echo "No ejecutable"
	fi
   fi
   	
	
else
	echo "Fichero o directorio no válido"
	exit 1		#finalización script con código de terminación 1
fi