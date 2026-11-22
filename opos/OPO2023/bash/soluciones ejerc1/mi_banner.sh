#!/bin/bash
for PALABRA in $*
do
banner $PALABRA | sed 's/^ //g' | sed 's/ /  /g' | sed 's/#/_\//g' > /tmp/$0.1.$$
typeset -i LINEAS=`cat /tmp/$0.1.$$ | wc -l`
typeset -i CONT1=0
typeset -i CONT2=LINEAS
> /tmp/$0.2.$$ # Crear o vaciar fichero temporal 2
while [ $CONT1 -le $LINEAS ]
do
	while [ $CONT2 -ge $CONT1 ]
	do
		echo -e 'o\c' >> /tmp/$0.2.$$
		let CONT2-=1
	done
	echo >> /tmp/$0.2.$$
	let CONT1+=1
	CONT2=LINEAS
done
paste -d ' ' /tmp/$0.2.$$ /tmp/$0.1.$$ | head -n 8
rm -f /tmp/$0.2.$$ /tmp/$0.1.$$
done
