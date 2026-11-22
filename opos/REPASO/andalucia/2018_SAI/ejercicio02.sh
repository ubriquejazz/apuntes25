#!/bin/bash

# Oposicion PFTP-SAI
# Date: 201806
# Autor: Juan Gago
# File: ejercicio02

function ayuda () {
	echo "Script para automatizar las copias de seguridad"
	echo "Asume ./arespaldar, ./backups (crear si no existe)"
    echo "Mensajes solo en ./CSeg.log (nada por terminal)."
    
	echo "Sintaxis:"
	echo "	$0 "
	echo " "
}
