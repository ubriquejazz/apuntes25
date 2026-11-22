-- File: script102
-- Desc: Copias de seguridad (2/2)
-- Date: 2023.03.21
-- Tablas: COCHES; MODELOS; MARCAS;

-- Se corrompe la base de datos COCHES_PRUEBA o se produce accidentalmente alguna transacción no deseada.
-- En nuestro caso borramos la base de datos COCHES_PRUEBA. El objetivo es recuperar las tablas 
-- a la situación que tenían justo antes de producirse esa sentencia errónea de  borrado. Indicar proceso.   
-- Antes de proceder a recuperar la copia reiniciamos de nuevo el servidor para que se inicie un nuevo
-- el fichero binary log.
DROP DATABASE COCHES_PRUEBA;
sudo systemctl restart mariadb.service

-- Aparece un nuevo log (0003) que contiene el accidente
ll /var/lib/mysql/
    -rw-rw  1 mysql mysql       352 Mar 22 16:56 mysqld-bin.000001
    -rw-rw  1 mysql mysql       959 Mar 22 17:07 mysqld-bin.000002
    -rw-rw  1 mysql mysql       343 Mar 22 17:07 mysqld-bin.000003

-- Restauramos la ultima copia de seguridad realizada (punto 11.5.1 de la documentación del curso)
CREATE DATABASE coches_prueba;
sudo mysql -u root coches_prueba < coches_prueba_20230322.sql

-- Comprobamos que la base de datos se encuentra en el estado previo al momento de 
-- producirse el borrado accidental.
USE coches_prueba
SHOW TABLES
    +-------------------------+
    | Tables_in_coches_prueba |
    +-------------------------+
    | CONCESIONARIO           |
    +-------------------------+

-- Ejecutamos los binary log a partir de la última copia efectuada mediante la herramienta 
-- mysqlbinlog. Tenemos que determinar qué binary log es el que tiene los cambios realizados
-- entre la creación de la copia de seguridad y la recuperación de dicha copia. 
-- Habrá que analizar con cuidado qué parte del fichero log tenemos que relanzar.
sudo mysqlbinlog /var/lib/mysql/mysqld-bin.000003
