#!/bin/bash
incr2 ()
{
IND2=0
while [ $IND2 -lt 1000 ]
do
	IND2=`expr $IND2 + 1`
done
}

incr1 ()
{
IND1=0
while [ $IND1 -lt 1000 ]
do
	let IND1+=1
done
}

PruebaDiezSegundos()
{
time $1 
SEGINI=`date '+%s'`
SEGINST=$SEGINI
CONT=0
while [ `expr $SEGINI + 10` -gt $SEGINST ]
do
	let CONT+=1
	SEGINST=`date '+%s'`
	$1
done
echo "INCR1 .... $CONT"
}

########################### MAIN ########################
typeset -i IND1=0
typeset -i IND2=0
typeset -i SEGINI
typeset -i SEGINST
typeset -i CONT=0


PruebaDiezSegundos incr1
PruebaDiezSegundos incr2
