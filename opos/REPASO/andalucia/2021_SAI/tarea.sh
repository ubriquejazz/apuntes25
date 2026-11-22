#!/bin/bash

# Apartado c)
# generar el login de los usuarios 
f_users() {
    echo Generar login de usuarios loginServ.txt
    true > loginServ.txt
    while IFS=: read -r ape1 ape2 nom dni; do
        nom=$(echo $nom | cut -c1-1)
        ape1=$(echo $ape1 | cut -c1-3)
        ape2=$(echo $ape2 | cut -c1-3)
        dni=$(echo $dni | cut -c6-8)
        xlogin=$nom$ape1$ape2$dni
        xlogin=$(echo $xlogin | tr '[:upper:]' '[:lower:]')
        echo $xlogin>>loginServ.txt
    done < usuarios.txt
}

# Apartado d)
# solicitar una dirección IP y un número entero
f_net() {
    echo Comprobacion de red
    read -p "Introduzca direccion IP: " teclaIP
    read -p "Introduzca cantidad (C): " cantidad
    #echo $teclaIP | cut -d'.' -f4
    net01=$(echo $teclaIP | cut -d'.' -f1)
    net02=$(echo $teclaIP | cut -d'.' -f2)
    net03=$(echo $teclaIP | cut -d'.' -f3)
    host=$(echo $teclaIP | cut -d'.' -f4)
    contador=1
    while [ $contador -le $cantidad ]; do
        ping -c 1 $net01.$net02.$net03.$host > /dev/null
        # 0 correcto; 1 incorrecto
        if [ $? -eq 0 ]; then
            echo "IP $net01.$net02.$net03.$host activa"
        fi
        contador=$((contador+1))
        host=$((host+1))
    done
}

pinging() {
    # {1} read -p "Introduce una IP: " ip
    # {2} read -p "Introduce un numero: " range

    for i in `seq ${2} ${3}`
    do
        ping -c 1 ${1}.${i} > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                echo "${1}.${i} responded."
            else
                echo "${1}.${i} did not respond."
            fi
    done

}

#######################################

clear
select tecla in Login Network Salir; do
    case $tecla in
        Login) f_users;;
        Network) f_net;;
        Salir) break
    esac
done