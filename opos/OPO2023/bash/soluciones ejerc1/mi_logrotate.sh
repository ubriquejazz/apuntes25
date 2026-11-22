rotar ()
{
	if [ -s old_rot/$FICH.rot4.gz ]
		then rm old_rot/$FICH.rot4.gz
	fi
	if [ -s old_rot/$FICH.rot3.gz ]
		then mv old_rot/$FICH.rot3.gz old_rot/$FICH.rot4.gz
	fi
	if [ -s old_rot/$FICH.rot2.gz ]
		then mv old_rot/$FICH.rot2.gz old_rot/$FICH.rot3.gz
	fi
	if [ -s old_rot/$FICH.rot1.gz ]
		then mv old_rot/$FICH.rot1.gz old_rot/$FICH.rot2.gz
	fi
	head -n `expr $LINEAS - 1000` < $FICH | gzip > old_rot/$FICH.rot1.gz
	tail -n 1000 < $FICH > $FICH.$$
	rm $FICH
	mv $FICH.$$ $FICH
}

typeset -i LINEAS=0
mkdir old_rot 2> /dev/null
for FICH in `ls *.log`
do
	LINEAS=`cat $FICH | wc -l`
	if [ $LINEAS -gt 2000 ]
		then 
		   echo "$FICH $LINEAS ==> rot"
		   rotar FICH
		else
		   echo "$FICH $LINEAS"
	fi
done
