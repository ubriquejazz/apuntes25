#!/bin/bash
echo "Introduce la tabla que quieres ver: "
read tabla
for i in $(seq 1 10)
# for in in {1..10}
do
    echo "$tabla x $i = `expr $tabla \* $i`"
done