#!/bin/bash
# Para cada elemento del $PATH
for i in `echo $PATH | tr ":" " "`
do
	# Compropar la coincidencia con cada uno de los ficheros
	# encontrados en ese directorio y para cada uno de ellos
        for j in `ls $i 2> /dev/null | egrep  "^$1$" 2> /dev/null`
        #for j in `ls $i 2> /dev/null `
        do
                echo
                echo `ls -liad $i/$j 2> /dev/null`
                whatis $j
        done
done

