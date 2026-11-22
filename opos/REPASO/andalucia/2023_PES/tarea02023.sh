#
rem Comprimir /var/www/datos y copiarlo en /home/backups de backupserver.es
rem El usuario del servidor es master (se sabe su password) 

tar -czvf /root/backups/datos.tar.gz /var/wwww/datos 
scp /root/backups/datos.tar.gz master@backupserver.es:/home/backups


rem Lista ordenada con nombres de usuario que usen bash por defecto
grep bash /etc/passwd | cur -d: -f1 | sort > resultado.txt