#!/bin/bash 
function introalumno() { 
    read -p "Introduzca el nombre: " NOMBRE 
    read -p "Introduzca los apellidos: " APELLIDOS 
    echo "$APELLIDOS, $NOMBRE" >> $HOME/datosalumnos.txt 
    sort < $HOME/datosalumnos.txt > $HOME/dbalumnos.txt 
    read -n 1 -p "Pulse una tecla para continuar..." TECLA 
}

OPC=0 
until [ $OPC = "3" ]; do

    clear 
    echo "MENÚ" 
    echo "1) Introducir alumno" 
    echo "2) Mostrar listado" 
    echo "3) Salir " 
    read -n 1 -p "Pulse una opción? " OPC 
    echo  
    case $OPC in

        1) introalumno;;
        2) cat -n $HOME/dbalumnos.txt

        read -n 1 -p "Pulse una tecla para continuar..." TECLA;;
        3) echo "Adiós";; esac

done