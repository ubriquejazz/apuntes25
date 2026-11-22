#!/bin/bash

# Declaración de funciones
f_usuarios(){ # Apartado c true> loginServ.txt
    while IFS=: read -r ape1 ape2 nom dni do
        xlogin="$(echo $nom | cut -c1-1)$(echo $ape1|cut -c1-3)$(echo $ape2|cut -c1-3)$(echo $dni|cut -c6-8)" 
        xlogin=$(echo $xlogin | tr '[:upper:]' '[:lower:]') 
        echo $xlogin>>loginServ.txt
    done < usuarios.txt 
}

f_red(){ 
    # Apartado d 
    read -p "Introduzca una IP: " teclaIP 
    read -p "Introduzca una cantidad: " cantidad 
    contador=1 
    prefijoIP="$(echo $teclaIP | cut -d'.' -f1).$(echo $teclaIP | cut -d'.' -f2).$(echo $teclaIP | cut -d'.' -f3)." 
    comprobarIP=$(echo $teclaIP | cut -d'.' -f4)
}

while [ $contador -le $cantidad ] do
    ping -c 1 -W 2 $prefijoIP$comprobarIP >/dev/null # salida ping 0 --> correcto ; 1 incorrecto
    if [ $? != 0 ]
    then
        resultado="IP $prefijoIP$comprobarIP no activa"
    else
        resultado="IP $prefijoIP$comprobarIP activa"
    fi echo $resultado contador=$((contador+1)) 
        comprobarIP=$((comprobarIP+1))
    done 
}
