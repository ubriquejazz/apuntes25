## Privilegios especiales
ALL [PRIVILEGES]
    Permite agrupar todos los privilegios en uno solo.
USAGE
    Es un privilegio especial que significa “ausencia de privilegios”

## Privilegios aplicados a bases de datos, tablas y columnas
ALTER       Permite alterar tablas e índices (ALTER TABLE)
CREATE      Permite crear bases de datos y tablas (CREATE TABLE)

CREATE TEMPORARY TABLES
        Permite crear tablas temporales (CREATE TEMPORARY TABLE )
DELETE  Permite borrar regs de las tablas existentes (DELETE)
DROP    Permite eliminar bases de datos y tablas (DROP TABLE )
INDEX   Permite crear y eliminar índices asociados a tablas (CREATE INDEX y DROP INDEX)
INSERT  Permite insertar nuevos registros en tablas (INSERT)
SELECT  Permite consultar información de tablas (SELECT)
UPDATE  Permite modificar el contenido de registros existentes (UPDATE)

## Privilegios administrativos
FILE   
    L/E archivos en el servidor ( SELECT ... INTO OUTFILE y LOAD DATA INFILE )

PROCESS 
    Ver los procesos abiertos en el servidor (SHOW FULL PROCESSLIST )

RELOAD  
    Para que servidor cargue de nuevo las tablas del diccionario de datos (FLUSH)

REPLICATION CLIENT
    Permite al usuario preguntar donde esta el servidor esclavo o el maestro

REPLICATION SLAVE
    Para que el usuario pueda acceder al fichero binary log del maestro desde el esclavo

SHUTDOWN
    Permite cerrar el servidor (mysqladmin shutdown)

## Usuario@Host
    '%'                 'juan'
    juan, conectando desde cualquier host

    '%'                 ''
    Cualquier usuario, conectando desde cualquier host

    '%. mecd.es '       'juan'
    juan, conectando desde algún host del dominio mecd.es

    'x.y.%'             'juan'
    juan, conectando desde los host x.y.es, x.y.com, x.y.org, etc..

    '144.155.166.177'   'juan'
    juan, conectando desde el host con IP 144.155.166.177

    '144.155.166.%'     'juan'
    juan, conectando desde cualquier host de la subred 144.155.166