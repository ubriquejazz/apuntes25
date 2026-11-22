#!/bin/sh
for i in $*
do
	echo -e '\n\n'
	echo "    ---- ## `ls -d $i` ## ----"
	cat $i
done
