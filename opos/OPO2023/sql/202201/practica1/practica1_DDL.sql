/* Práctica 1 DDL */
/* 1. Crear la base de datos */
CREATE DATABASE practica1;

/* 2. Modificar la estructura de la BD */
ALTER DATABASE practica1 CHARSET utf8;

/* 3. Crear la tabla tabla1 */
USE practica1

CREATE TABLE tabla1(
    contador TINYINT UNSIGNED ZEROFILL AUTO_INCREMENT,
    nif CHAR(9),
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(15) NOT NULL,
    apellido2 VARCHAR(15),
    nacimiento DATE DEFAULT '1970-12-21',
    hora TIME DEFAULT '00:00:00',
    sexo ENUM('M','F') DEFAULT 'M',
    idiomas SET('Castellano','Frances','Ingles','Aleman','Chino'),
    fumador ENUM('S','N') DEFAULT 'N',
    PRIMARY KEY (nif),
    KEY (contador)
); 

/* 4. Modificar la estructura de la tabla */
ALTER TABLE tabla1 ADD altura SMALLINT UNSIGNED, ADD peso MEDIUMINT UNSIGNED;

# Algunos programas, como Wordpad, pueden usar ‘\r’ como terminador de línea. La orden para añadir los registros sería:
LOAD DATA LOCAL INFILE '/home/pi//tabla1.txt' INTO TABLE tabla1 LINES TERMINATED BY '\n';

