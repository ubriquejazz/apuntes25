#!/bin/bash
typeset -i TOTAL=0
for var in $*
do
	let TOTAL+=$var
done
#let TOTAL*=10
#let TOTAL/=$#
#echo $TOTAL
echo "scale=40 ; $TOTAL / $# " | bc
	
