#!/bin/bash
echo "01) Accediendo al fichero /etc/passwd "
read -p "Directorio de trabajo: " ws

while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
        # display fields using f1, f2,..,f7
        printf 'Username: %s, Shell: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
done <"/etc/passwd"

# usuarios sin shell asociada: nologin
echo "usuarios sin shell asociada: nologin ------------------" | tee $ws/RESULTADO.txt
join -t: /etc/passwd shadow | grep nologin | tee -a $ws/RESULTADO.txt

# dos lineas en blanco
echo "" | tee -a RESULTADO.txt
echo "" | tee -a RESULTADO.txt

# anadimos usuarios con shell bash
echo "usuarios sin shell bash -------------------------------" | tee -a $ws/RESULTADO.txt
join -t: /etc/passwd shadow | grep bash | tee -a $ws/RESULTADO.txt