#!/bin/bash
echo "Introduce la tabla que quieres ver: "
read tabla
vuelta=1
while [ $vuelta -le 10 ]
do
    R=$[vuelta*tabla]
    echo "$vuelta x $tabla = $R"
    let vuelta=$vuelta+1
done