
# grafica.sh 1 3 5 6 7 5 6 4 3 2 2 1  
#for dato
for dato in $*
do
	if [ $dato -lt 1 ] || [ $dato -gt 75 ]
		then echo "Los argumentos deben estar comprendidos entre 1 y 75"
		exit
	fi
done
clear 
for dato in $*
do
  n=0
  until [ $n -eq $dato ]
  do
     echo -e  "*\c"
     let n+=1
  done
  echo
done
