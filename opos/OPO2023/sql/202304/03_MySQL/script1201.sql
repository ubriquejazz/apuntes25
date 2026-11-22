-- File: script102
-- Desc: Copias de seguridad (1/2)
-- Date: 2023.03.21
-- Tablas: COCHES; MODELOS; MARCAS;

-- Activa el binary log en el servidor MySQL 
sudo systemctl stop mariadb.service
sudo nano /etc/mysql/my.cnf
    [mysqld]
        log-bin
sudo systemctl start mariadb.service

-- Localizamos el directorio de datos (datadir)
sudo mysqladmin variables | grep datadir
    datadir  /var/lib/mysql/  

-- Vemos que existe ya un fichero log binario (00001)
ls -alt /var/lib/mysql/mysqld-bin.000001
    -rw-rw 1 mysql mysql 329 Mar 22 16:51 /var/lib/mysql/mysqld-bin.000001

-- Vamos a crear una base de datos llamada COCHES_PRUEBA que nos sirva para realizar 
-- inserciones y borrados a nuestro antojo, la cargamos con el script siguiente
sudo mysql -u root < coches_prueba.sql 

-- Crear mediante mysqldump la copia de seguridad completa de la base datos COCHES_PRUEBA 
-- del servidor (11.5.1 de la doccumentación del curso)
sudo mysqldump -opt COCHES_PRUEBA > coches_prueba_20230322.sql

-- Inmediatamente después de efectuada la copia reiniciamos el servidor mysql. 
-- Esto obliga a que se genere un nuevo fichero binary log
ls /var/lib/mysql/  /* solo mysqld-bin.000001 */
sudo systemctl restart mariadb.service
ls /var/lib/mysql/  /* aparece mysqld-bin.000002 */

-- Añadimos algunos cambios a nuestra base de datos de prueba para la comprobación
-- posterior. 
USE COCHES_PRUEBA
SELECT * FROM CONCESIONARIO;

-- Borramos los modelos C de CITROEN
DELETE FROM CONCESIONARIO WHERE marca="CITROEN" AND modelo LIKE "C%";

-- Creamos una tabla nueva CLIENTES en la base de datos COCHES_PRUEBA
CREATE TABLE CLIENTES (
	ID_CLIENTE VARCHAR(10) PRIMARY KEY,
	NOM_CLI VARCHAR(30),
	DIRECCION VARCHAR(30),
	LOCALIDAD VARCHAR(30)
);

-- Comprobamos los cambios en el log 0002
sudo mysqlbinlog /var/lib/mysql/mysqld-bin.000002
START TRANSACTION
/*!*/;
# at 371
#230322 16:57:48 server id 1  end_log_pos 515 CRC32 0x77914d70  Query   thread_id=31    exec_time=0   error_code=0
    use `coches_prueba`/*!*/;
SET TIMESTAMP=1679504268/*!*/;
SET @@session.pseudo_thread_id=31/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1, @@session.check_constraint_checks=1, @@session.sql_if_exists=0, @@session.explicit_defaults_for_timestamp=0/*!*/;
SET @@session.sql_mode=1411383296/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8 *//*!*/;
SET @@session.character_set_client=33,@@session.collation_connection=33,@@session.collation_server=45/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
    DELETE FROM CONCESIONARIO WHERE marca="CITROEN" AND modelo LIKE "C%"
/*!*/;
# at 515
#230322 16:57:48 server id 1  end_log_pos 546 CRC32 0x123573b1  Xid = 62
COMMIT/*!*/;
# at 546
#230322 16:57:53 server id 1  end_log_pos 588 CRC32 0x357affb2  GTID 0-1-2 ddl
/*!100001 SET @@session.gtid_seq_no=2*//*!*/;
# at 588
#230322 16:57:53 server id 1  end_log_pos 791 CRC32 0xc19d6d62  Query   thread_id=31    exec_time=0   error_code=0
SET TIMESTAMP=1679504273/*!*/;
CREATE TABLE CLIENTES (
    ID_CLIENTE VARCHAR(10) PRIMARY KEY,
    NOM_CLI VARCHAR(30),
    DIRECCION VARCHAR(30),
    LOCALIDAD VARCHAR(30)
    )
/*!*/;
DELIMITER ;
# End of log file

