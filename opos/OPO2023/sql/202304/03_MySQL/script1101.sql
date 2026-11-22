-- File: script101 (tablas_concesionario.sql)
-- Desc: Administracion 1 
-- Date: 2023.03.14
-- Tablas: COCHES; MODELOS; MARCAS;
-- Users: Root,  gestor, vendedor

-- Acceder al servidor como root y crear la base de datos CONCESIONARIO. 
-- Crear las tablas mediante el script tablas_concesionario.sql
CREATE DATABASE CONCESIONARIO;
USE CONCESIONARIO

-- Crear un usuario con password llamado gestor con derechos totales 
-- sobre la base de datos CONCESIONARIO y con el permiso FILE para importar 
-- ficheros a tablas y exportar tablas a ficheros. 
CREATE USER gestor@localhost IDENTIFIED BY 'password';
-- DROP USER gestor@localhost;

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP 
    ON CONCESIONARIO.*
    TO gestor@localhost;

GRANT FILE ON *.* TO gestor@localhost;

-- Crear un usuario con password llamado vendedor únicamente con derechos 
-- de consulta (SELECT) sobre las tablas.
CREATE USER vendedor@localhost IDENTIFIED BY 'password';
GRANT USAGE ON CONCESIONARIO.* TO vendedor@localhost;

-- Mostrar que se han creado los usuarios y los permisos asignados a cada uno de ellos.
select User, Host, Drop_priv from mysql.user;

-- Establecer conexión con el usuario  gestor para acceder a la base de datos.
mysql -u gestor -p

-- Analizar las tablas existentes y realizar con este usuario los pasos necesarios 
-- para pasar la información desde el fichero CONCESIONARIO.TXT a las tablas MARCAS, 
-- MODELOS, COCHES, teniendo en cuenta que los campos llamados ID_ en cada tabla deben 
-- ser de tipo AUTO_INCREMENT.
INSERT INTO marcas(marca) VALUES('CITROEN');
INSERT INTO marcas(marca) VALUES('FORD');
INSERT INTO marcas(marca) VALUES('HONDA');
INSERT INTO marcas(marca) VALUES('MERCEDES');
INSERT INTO marcas(marca) VALUES('SAAB');
INSERT INTO marcas(marca) VALUES('SEAT');
INSERT INTO marcas(marca) VALUES('PEUGEOT');
INSERT INTO marcas(marca) VALUES('RENAULT');
INSERT INTO marcas(marca) VALUES('VOLKSWAGEN');
-- id_marca = 1 (CITROEN)
INSERT INTO modelos(id_marca, modelo) VALUES(1,'C2');
INSERT INTO modelos(id_marca, modelo) VALUES(1,'C3');
INSERT INTO modelos(id_marca, modelo) VALUES(1,'C4');
INSERT INTO modelos(id_marca, modelo) VALUES(1, 'PICASSA');
-- id_marca = 2 (FORD)
INSERT INTO modelos(id_marca, modelo) VALUES(2,'MONDEO');
INSERT INTO modelos(id_marca, modelo) VALUES(2, 'S-MAX');
-- id_marca = 3 (HONDA)
INSERT INTO modelos(id_marca, modelo) VALUES(3, 'ACCORD');
INSERT INTO modelos(id_marca, modelo) VALUES(3, 'CIVIC');
-- id_marca = 4 (MERCEDES)
INSERT INTO modelos(id_marca, modelo) VALUES(4, 'CLS');
-- id_marca = 5 (SAAB)
INSERT INTO modelos(id_marca, modelo) VALUES(5, '900');
-- id_marca = 6 (SEAT)
INSERT INTO modelos(id_marca, modelo) VALUES(6, 'IBIZA');
INSERT INTO modelos(id_marca, modelo) VALUES(6, 'LEON');
-- id_marca = 7 (PEUGEUT)
INSERT INTO modelos(id_marca, modelo) VALUES(7, '307');
INSERT INTO modelos(id_marca, modelo) VALUES(7, '308');
INSERT INTO modelos(id_marca, modelo) VALUES(7, '407');
INSERT INTO modelos(id_marca, modelo) VALUES(7, '408');
-- id_marca = 8 (RENAULT)
INSERT INTO modelos(id_marca, modelo) VALUES(8, 'MEGANE');
-- id_marca = 9 (VOLKSWAGEN)
INSERT INTO modelos(id_marca, modelo) VALUES(9, 'GOLF');
INSERT INTO modelos(id_marca, modelo) VALUES(9, 'PASSAT');
INSERT INTO modelos(id_marca, modelo) VALUES(9, 'TOUAREG');

INSERT INTO coches(id_mod, matricula, precio) VALUES
    (4, "CPG-2044", 12000),
    (4, "CPR-1762", 12500),
    (3, "FPP-1464", 13500),
    (3, "FDR-4563", 13000),
    (2, "BDF-8856", 8000),
    (2, "BPZ-7878", 7500),
    (1, "CDR-1515", 5000),
    (1, "BCC-3434", 4500),
    (5, "BTG-3267", 8000),
    (5, "BPP-6792", 8200),
    (6, "FDR-1564", 20000),
    (6, "FCE-9327", 21000),
    (8, "FCC-7764", 16000),
    (8, "FBC-4567", 14000),
    (7, "FFC-6768", 22000),
    (7, "FPB-2231", 23000),
    (9, "FDR-2265", 31000),
    (10, "FPG-1165", 21000),
    (12, "DVB-1119", 14500),
    (12, "DCR-5634", 13500),
    (11, "DPR-3434", 9500),
    (11, "DPP-8756", 10000),
    (13, "DGX-4598", 5500),
    (13, "DGG-2098", 5000),
    (14, "DPK-3859", 5500),
    (14, "DVK-4987", 6000),
    (15, "FFK-1513", 7500),
    (15, "FPP-3768", 8000),
    (16, "CPG-7879", 10000),
    (16, "CRC-9738", 9500),
    (17, "CQC-4298", 11000),
    (17, "FNZ-7688", 6000),
    (19, "FNR-3987", 16000),
    (19, "FQK-3987", 18000),
    (18, "FCJ-0909", 22500),
    (18, "FCK-3989", 21000),
    (20, "DGG-0937", 42000);

-- Generar los ficheros marcas.txt, modelos.txt y coches.txt como ficheros de texto 
-- de campos delimitados. El carácter delimitador será # y los campos de texto...
SELECT * INTO OUTFILE '/Users/juan/Repos/OPO2023/sql/202304/03_MySQL/dump/marcas.txt'
FIELDS TERMINATED BY '#' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
FROM marcas;

SELECT * INTO OUTFILE '/Users/juan/Repos/OPO2023/sql/202304/03_MySQL/dump/modelos.txt'
FIELDS TERMINATED BY '#' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
FROM modelos;

SELECT * INTO OUTFILE '/Users/juan/Repos/OPO2023/sql/202304/03_MySQL/dump/coches.txt'
FIELDS TERMINATED BY '#' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
FROM coches;