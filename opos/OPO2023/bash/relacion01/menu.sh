#!/bin/bash

op=1
clear
echo "Ejercicio 2: calculadora post-orden"

darpermiso() {
    read -p "Introduce un directorio: " directorio
    if [ -d $directorio ]
    then
        chmod u+x $directorio || echo "la operacion ha fallado"
    else
        echo "no existe"
    fi
}

quitarpermiso() {
    read -p "Introduce un directorio: " directorio
    if [ -d $directorio ]
    then
        chmod u-x $directorio || echo "la operacion ha fallado"
    else
        echo "no existe"
    fi
}

hacercopia() {
    read -p "Introduce usuario: " usuario
    if [ -d /home/$usuario ]
    then
        tar -cvf copia.tar /home/$usuario || echo "la operacion ha fallado"
    else
        echo "no existe"
    fi
}

recientes() {
    last -10 | tee ultimos10.log
}

while [ $op != 0 ]
do

echo "1 - Dar permiso de ejecución a todos los archivos de un directorio"
echo "2 – Quitar permiso de ejecución a todos los archivos de un directorio"
echo "3 – Hacer copia de seguridad del directorio de trabajo de un usuario"
echo "4 – Obtener en un archivo los 10 inicios de sesión más recientes"
echo "0 – Salir"
read -p "Selecciona opcion: " op
case $op in
    1) darpermiso;;
    2) quitarpermiso;;
    3) hacercopia;;
    4) recientes;;
    0) echo "";;
    *) echo "opcion no valida"; sleep 2;;
esac

done
