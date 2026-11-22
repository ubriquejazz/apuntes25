/*
  File: farmacos (ejercicio 3)
  Date: 202206 (sesion 24)
  Author: Juan Gago
*/

create database bdfarmacos;

use bdfarmacos;

CREATE TABLE ENFERMOS(
  CODE INTEGER NOT NULL PRIMARY KEY auto_increment,
  NOME CHARACTER(50),
  DIRE CHARACTER(50));

INSERT ENFERMOS(NOME, DIRE) VALUES
('Fran Martínez','Calle de Fran'),
('Paco de Haro','Calle de Paco'),
('Felipe Berenguel','Calle de Felipe'),
('Amalia Gallegos','Calle de Amalia'),
('Amalia Martínez','Calle de Fran'),
('Manuela Martínez','Calle de Amalia');

CREATE TABLE TIPOSFARMACO(
  TIPOF INTEGER NOT NULL PRIMARY KEY auto_increment,
  DESCRIPCION CHARACTER(50),
  CARCTERISTICAS CHARACTER(100));

INSERT TIPOSFARMACO(DESCRIPCION, CARCTERISTICAS) VALUES
('Analgésico','Características del tipo 1'),
('Antiestamínico','Características del tipo 2'),
('Dolor','Características del tipo 3'),
('Para machotes','Características del tipo 4'),
('Ni idea','Características del tipo 5');

CREATE TABLE FARMACOS(
  CODF INTEGER NOT NULL PRIMARY KEY auto_increment,
  NOMF VARCHAR(50) NOT NULL,
  TIPOF INTEGER NOT NULL REFERENCES TIPOSFARMACO(TIPOF) ON DELETE SET NULL ON UPDATE CASCADE,
  PRECIOUNIDAD REAL);

INSERT FARMACOS(NOMF, TIPOF, PRECIOUNIDAD) VALUES
('Couldina',1,8),
('Ibis',2,7),
('Loratadina',2,4),
('Frenadol',1,9),
('Nolotil',3,8),
('Testiculina',4,45),
('Meloinvento',5,12);

CREATE TABLE CONSUMO(
  CODE INTEGER NOT NULL REFERENCES ENFERMOS(CODE) ON DELETE CASCADE ON UPDATE CASCADE,
  CODF INTEGER NOT NULL REFERENCES FARMACOS(CODF) ON DELETE CASCADE ON UPDATE CASCADE,
  UNIDADES INTEGER NOT NULL,
  PRIMARY KEY(CODE,CODF));

INSERT CONSUMO VALUES
(1,1,1),
(1,2,3),
(2,3,3),
(2,6,10),
(3,5,3),
(3,6,3),
(4,1,1),
(5,2,15),
(2,4,13);

CONSULTAS:

-- a) Integridad referencial de FARMACOS y TIPOSFARMACO

CREATE TABLE FARMACOS(
  CODF INTEGER NOT NULL PRIMARY KEY auto_increment,
  NOMF VARCHAR(50) NOT NULL,
  TIPOF INTEGER NOT NULL,
  PRECIOUNIDAD REAL);

ALTER TABLE FARMACOS ADD FOREIGN KEY (TIPOF) REFERENCES TIPOSFARMACO(TIPOF) ON DELETE SET NULL ON UPDATE CASCADE;

-- b) Visualizar el nombre de aquellos fármacos de descripción "ANALGÉSICO", cuyas unidades consumidas por todos los enfermos sea mayor que 10. 
-- Visualizar también dichas unidades.

SELECT * FROM CONSUMO;

SELECT CODF, SUM(UNIDADES) 
  FROM CONSUMO C JOIN FARMACOS F ON C.CODF = F.CODF
  GROUP BY CODF HAVING SUM(UNIDADES)>10;

SELECT * FROM TIPOSFARMACO T
  WHERE T.DESCRIPCION = 'ANALGESICO';

SELECT NOMF AS 'NOBRE FARMACO', SUM(UNIDADES) AS 'UNIDADES CONSUMIDAS'
  FROM CONSUMO C 
  JOIN FARMACOS F ON C.CODF = F.CODF
  JOIN TIPOSFARMACO T ON F.TIPOF = T.TIPOF
  WHERE T.DESCRIPCION = 'ANALGESICO';
  GROUP BY CODF HAVING SUM(UNIDADES)>10;

+----------------+---------------------+
| NOMBRE FÁRMACO | UNIDADES CONSUMIDAS |
+----------------+---------------------+
| Frenadol       |                  13 |
+----------------+---------------------+

-- c) Visualizar el nombre del fármaco, su descripción y el precio de aquellos cuyo precio es el más caro entre los de su tipo.
SELECT MAX(PRECIOUNIDAD) FROM FARMACOS; -- el más caro de todos

SELECT MAX(PRECIOUNIDAD) FROM FARMACOS 
WHERE F.TIPOF = FARMACOS.TIPOF; --  el más caro entre los de su tipo.

SELECT NOMF, DESCRIPCION, PRECIOUNIDAD
FROM FARMACOS F JOIN TIPOSFARMACOS T ON T.TIPOF = F.TIPOF
WHERE PRECIOUNIDAD = (SELECT);

+-------------+----------------+--------------+
| NOMF        | DESCRIPCION    | PRECIOUNIDAD |
+-------------+----------------+--------------+
| Ibis        | Antiestamínico |            7 |
| Frenadol    | Analgésico     |            9 |
| Nolotil     | Dolor          |            8 |
| Testiculina | Para machotes  |           45 |
| Meloinvento | Ni idea        |           12 |
+-------------+----------------+--------------+

-- d) El administrador de la BD ha decidido mantener un campo IMPORTETOTAL en la tabla ENFERMOS que ...

ALTER TABLE ENFERMOS ADD (INPORTETOTAL) REAL;

SELECT C.CODE, SUM(UNIDADES*PRECIOUNIDAD)
FROM CONSUMO C, FARMACOS F
WHERE C.CODF = F.CODF
GROUP BY C.CODE;

UPDATE ENFERMOS E SET IMPORTETOTAL = 
(
  SELECT SUM(UNIDADES*PRECIOUNIDAD)
  FROM CONSUMO C, FARMACOS F
  WHERE C.CODF = F.CODF
  AND E.CODE = C.CODE
  GROUP BY C.CODE
);

select * from enfermos;
+------+------------------+-----------------+--------------+
| CODE | NOME             | DIRE            | IMPORTETOTAL |
+------+------------------+-----------------+--------------+
|    1 | Fran Martínez    | Calle de Fran   |           29 |
|    2 | Paco de Haro     | Calle de Paco   |          579 |
|    3 | Felipe Berenguel | Calle de Felipe |          159 |
|    4 | Amalia Gallegos  | Calle de Amalia |            8 |
|    5 | Amalia Martínez  | Calle de Fran   |          105 |
|    6 | Manuela Martínez | Calle de Amalia |         NULL |
+------+------------------+-----------------+--------------+

CREATE TRIGGER ActualizarImporteTotal
AFTER INSERT ON CONSUMO
FOR EACH ROW
BEGIN
  UPDATE ENFERMOS SET IMPORTETOTAL = IMPORTETOTAL + 
    (NEW.UNIDADES * (SELECT PRECIOUNIDAD FROM FARMACOS F WHERE F.CODF=NEW.CODF))
  WHERE CODE=NEW.CODE;
END;

INSERT CONSUMO VALUES
(1,5,10);

select * from enfermos;
+------+------------------+-----------------+--------------+
| CODE | NOME             | DIRE            | IMPORTETOTAL |
+------+------------------+-----------------+--------------+
|    1 | Fran Martínez    | Calle de Fran   |          109 |
|    2 | Paco de Haro     | Calle de Paco   |          579 |
|    3 | Felipe Berenguel | Calle de Felipe |          159 |
|    4 | Amalia Gallegos  | Calle de Amalia |            8 |
|    5 | Amalia Martínez  | Calle de Fran   |          105 |
|    6 | Manuela Martínez | Calle de Amalia |         NULL |
+------+------------------+-----------------+--------------+
