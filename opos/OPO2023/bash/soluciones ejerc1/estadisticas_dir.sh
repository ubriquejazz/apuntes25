#!/bin/bash
typeset -i P_LEC=0
typeset -i P_ESC=0
typeset -i P_EJE=0
typeset -i NP_LEC=0
typeset -i NP_ESC=0
typeset -i NP_EJE=0
typeset -i F_REG=0
typeset -i DIR=0
typeset -i DIS_B=0
typeset -i DIS_C=0
typeset -i FIFOS=0
typeset -i SLINK=0
for i in `find $1 2> /dev/null`
do
	if [ -r $i ]
	then let P_LEC+=1
	else let NP_LEC+=1
	fi
	if [ -w $i ]
	then let P_ESC+=1
	else let NP_ESC+=1
	fi
	if [ -x $i ]
	then let P_EJE+=1
	else let NP_EJE+=1
	fi
	
	if [ -f $i ]
	then let F_REG+=1
	elif [ -d $i ]
	then let DIR+=1
	elif [ -L $i ]
	then let SLINK+=1
	elif [ -b $i ]
	then let DIS_B+=1
	elif [ -c $i ]
	then let DIS_C+=1
	elif [ -p $i ]
	then let FIFOS+=1
	fi
done
NF="Numero de ficheros en los cuales"
echo "$NF disponemos de permiso de lectura = $P_LEC"
echo "$NF disponemos de permiso de escritura = $P_ESC"
echo "$NF disponemos de permiso de  ejecucion = $P_EJE"
echo "$NF carecemos de permiso de lectura =  $NP_LEC"
echo "$NF carecemos de permiso de escritura =  $NP_ESC"
echo "$NF carecemos de permiso de ejecucion =  $NP_EJE"
echo "Numero de ficheros regulares encontrados = $F_REG"
echo "Numero de directorios encontrados = $DIR"
echo "Numero de dispositivos de bloques encontrados = $DIS_B"
echo "Numero de dispositivos de caracters encontrados = $DIS_C"
echo "Numero de fifos encontrados = $FIFOS "
echo "Numero de Links simbolicos encontrados = $SLINK"
