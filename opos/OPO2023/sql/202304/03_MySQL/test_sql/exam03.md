
## Pregunta 1: 
Cuando ejecutamos varios procesos servidores en el mismo equipo:
Cada uno debe "escuchar" por un puerto distinto al de los otros.
Compartirán el fichero de configuración.
Se iniciarán y finalizarán simultáneamente.
## Pregunta 2: 
Para averiguar las bases de datos existentes y comenzar a trabajar con la base de datos mi_bd, ejecutaremos:
LIST DATABASES; USE mi_bd.
SHOW DATABASES; USE mi_bd.
LIST DATABASES; START mi_bd.
## Pregunta 3: 
Para establecer la contraseña para root ejecutaremos:
root PASSWORD = new_password.
PASSWORD FOR root = new_password.
SET PASSWORD FOR root = PASSWORD (`new_password´).
## Pregunta 4: 
Mysqldump permite:
Generar una copia de seguridad que podemos restaurar en distintos SGBDs.
Crear una copia de seguridad exclusiva para MySQL.
Ninguna de las respuestas anteriores es cierta.
## Pregunta 5: 
Los ÍNDICES que permiten valores duplicados son los:
De clave primaria.
Ordinarios.
Únicos.
## Pregunta 6: 
Para eliminar completamente una cuenta de usuario utilizaremos:
DELETE USER.
DROP USER.
REVOKE USER.
## Pregunta 7: 
Los privilegios que podemos administrar con GRANT se conceden a 4 niveles distintos:
De base de datos, de usuario, de tabla y de fila.
Global, de base de datos, de tabla y de columna.
General, de usuario, de tabla y de registro.
## Pregunta 8: 
Indicar la opción incorrecta en una arquitectura de replicación:
Un esclavo sólo debe tener un maestro.
Un maestro puede tener varios esclavos.
Un esclavo nunca puede ser maestro.
## Pregunta 9: 
Para eliminar los ficheros de log anteriores al 1 de agosto de 2008, utilizaremos la sentencia:
DELETE BINARY LOGS BEFORE `2008-08-01 00:01:00´
PURGE MASTER LOGS BEFORE `2008-08-01 00:01:00´
DELETE MASTER LOGS BEFORE `2008-08-01 00:01:00´
## Pregunta 10: 
Para lanzar el script de comandos SQL llamado mi_script.sql, ubicado en C:\, y cargarlo en nuestra base de datos, podemos hacerlo con:
Desde la ventana MS_DOS con: mysql -uroot < c:\mi_script.sql
Desde la ventana MySQL con: source c:\mi_script.sql
Las dos respuestas anteriores son correctas.
