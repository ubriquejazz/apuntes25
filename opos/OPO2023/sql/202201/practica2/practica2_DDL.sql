/* Práctica 2 DDL */
/* 1. Crear la base de datos spain */
CREATE DATABASE spain CHARSET utf8;

/* 2. Crear las tablas provincia y municipio */
USE spain
CREATE TABLE provincia (
    idprovincia TINYINT(2) UNSIGNED ZEROFILL,
    provincia VARCHAR(25) NOT NULL,
    PRIMARY KEY (idprovincia)
    );

CREATE TABLE municipio(
    idmunicipio SMALLINT(4) UNSIGNED,
    idprovincia TINYINT(2) UNSIGNED ZEROFILL,
    municipio VARCHAR(50) NOT NULL,
    PRIMARY KEY (idmunicipio),
    FOREIGN KEY (idprovincia) REFERENCES provincia (idprovincia)
	ON UPDATE CASCADE ON DELETE NO ACTION
    );

/* English version (Oracle Live) */
CREATE TABLE town(
    id INT PRIMARY KEY,
    idprovince INT,
    town VARCHAR2(50) NOT NULL
    );
    
ALTER TABLE town
    ADD CONSTRAINT provincia_fk FOREIGN KEY ( idprovince )
    REFERENCES provincia (id);

/* 3. Modificar la estructura de la tabla municipio */
ALTER TABLE municipio ADD habitantes INT UNSIGNED;

/* 4. Añadir un índice para el nombre de la provincia */
ALTER TABLE provincia ADD INDEX (provincia);

-- Algunos programas, como Wordpad, pueden usar ‘\r’ como terminador de línea. La orden para añadir los registros sería:
LOAD DATA LOCAL INFILE './data/provincia.txt' INTO TABLE provincia LINES TERMINATED BY '\n';

