#!/bin/bash

v1=AAA
v2=100

function mostrar() {
  local v2=200
  v1=BBB
  echo "Funcion mostrar: v1=$v1, v2=$v2"
}

echo Antes: v1 = $v1 v2 = $v2
mostrar
echo Despues: v1 = $v1 v2 = $v2