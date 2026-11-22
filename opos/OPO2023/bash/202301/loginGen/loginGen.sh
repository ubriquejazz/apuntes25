#!/bin/bash
echo Generar login de usuarios loginServ.txt
true > loginServ.txt
while IFS=: read -r nom ape1 dni; do
    nom=$(echo $nom | cut -c1-1)
    ape1=$(echo $ape1 | cut -c1-3)
    xlogin=$nom$ape1
    xlogin=$(echo $xlogin | tr '[:upper:]' '[:lower:]')
    dni=$(echo $dni | cut -c8-9)
    xlogin=$xlogin$dni
    echo $xlogin>>loginServ.txt
done < usuarios.txt

# Pedir por teclado nombre, primer apellido y número de DNI (letra incluida) y 
# crear un fichero cuyo nombre será pasado como primer argumento en la llamada 
# al script y que contendrá lo siguiente:
#   NOMBRE;APELLIDO;DNI;NOMBRE_USUARIO 
#   Francisco;Haro;11222333A;fhar3A
#   José;Martínez; 22333444B;jmar4B
#
# El nombre_usuario se generará con la primera letra del nombre en minúscula, 
# las tres primeras letras del apellido en minúsculas y los dos últimos caracteres 
# del DNI (número y letra mayúscula)
# El programa pedirá que se introduzcan datos de usuarios hasta que sea introducido 
# un nombre vacío, en cuyo caso terminará y mostrará el contenido del fichero creado.
# Si el fichero existiera al ejecutar el script, este no se sobreescribirá, sino que 
# se añadirá al final del fichero los nuevos datos.
# Se valorará la comprobación de la existencia de nombre de usuario en el fichero 
# antes de añadir una nueva línea al fichero para evitar los nombres de usuario repetidos.


