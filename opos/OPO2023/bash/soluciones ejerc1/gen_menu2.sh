#!/bin/bash
typeset -i IND=1
typeset -i NUM=0
typeset -i opcion=0

# Leer todos los parametros
LITERAL[0]='Terminar'
COMANDO[0]='exit'
until [ $# -eq 0 ]
do
   LITERAL[$IND]=$1
   COMANDO[$IND]=$2
   let IND+=1
   shift 2
done  

# Bucle principal de entrada de comados
while true
do
   echo
   NUM=0
   # Mostrar todas las opciones (literales)
   while [ $NUM -lt $IND ] 
   do
     echo $NUM ${LITERAL[$NUM]}
     let NUM+=1
   done
   echo
   echo "Elija opción."
   read opcion
   ${COMANDO[$opcion]}
   echo "Fin (${COMANDO[$opcion]})"
   echo "Pulse <intro> para continuar"
   read
done
