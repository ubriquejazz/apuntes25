#!/bin/bash
# Crear un fichero desde el script y que contenga la siguiente información:

#Fecha 
Get-Date >> alotofinfo.txt 
#Variables del sistema 
Get-Variable >> alotofinfo.txt 
#Procesos en ejecución 
Get-Process >> alotofinfo.txt 
#Usuarios conectados 
Get-RDUserSession >> alotofinfo.txt 
#Info. de configuración de la red (ip, mask, interfaces)
Get-NetIPConfiguration >> alotofinfo.txt 
#Tabla enrutado 
Get-NetRoute >> alotofinfo.txt
