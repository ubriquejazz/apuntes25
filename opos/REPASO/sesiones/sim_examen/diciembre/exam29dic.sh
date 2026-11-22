#!/bin/bash
echo Generador login de usuarios
echo

# Declaracion de funciones
function ayuda() {
    echo Pide por teclado nombre, apellido y dni
    echo para anadir una linea al fichero pasado 
    echo como argumento.
    echo Sintaxis:
    echo "./exam29dic.sh <file>"
}

# Comprobacion de argumentos
if [[ $# -ne 1 ]]; then
    echo Numero de argumentos incorrecto
    ayuda
    exit 1
fi

# Comprobacion del fichero
if [[ -f $1 ]]; then
    echo El fichero $1 existe. Se anade al final
else
    touch $1
    echo "FirstName; LastName; Dni; Login" >> $1
fi

# Cuerpo principal del script
read -p "Nombre: " vNombre
while [[ ${vNombre} > 0 ]]
do
    # login en minusculas
    read -p "Apellido: " vApe1
    nom=$(echo $vNombre | cut -c1-1)
    ape1=$(echo $vApe1 | cut -c1-4)
    xlogin=$nom$ape1
    xlogin=$(echo $xlogin | tr '[:upper:]' '[:lower:]')
    
    # dos ultimos caracteres del DNI
    read -n 9 -p "DNI: " vDni
    dni=$(echo ${vDni: -2})
    user=$xlogin$dni

    echo Buscando el usuario $user ...
    cat $1 | grep $user > /dev/null
    if [[ $? -eq 0 ]]; then
        echo Usuario encontrado en $1
        cat $1 | grep $user
    else
        echo El usuario no existe, escribiendo ..
        linea="$vNombre; $vApe1; $vDni; $user"
        echo $linea >> $1
    fi
    
    # Nuevo usuario
    read -p "Nombre: " vNombre
done

echo Mostrando el contenido del fichero $1
more $1
exit 0