#!/bin/bash

# Leer dos números por teclado e indicar cual de ambos es el mayor. 
# a) Leyendo los dos números por teclado.
# b) Tomando los dos números como argumentos.

# Write-Output "Introduce el primer número" $numero1 = Read-Host
$numero1 = $args[0]
# Write-Output "Introduce el segundo número" $numero2 = Read-Host
$numero2 = $args[1]

if($numero1 -gt $numero2){ Write-Output "$numero1 es mayor que $numero2" }
if($numero1 -lt $numero2){ Write-Output "$numero2 es mayor que $numero1" }