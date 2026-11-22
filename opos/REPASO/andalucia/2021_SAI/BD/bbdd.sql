/*
    Date: 2022-10-12
    Exam: SAI 2021
*/


22. En MySQL-MariaDB y en el PC, cree una base de datos llamada “BDC”. Entre en la base de datos
 creada para trabajar. Indique a continuación el/los comando/s para crear la BBDD indicada y entrar
 en ella para poder usarla en los siguientes apartados [0.2 ptos].
    
    CREATE DATABASE XXX; USE XXX;

23. Cree todas las tablas con todos sus atributos, pero no aplique restricción alguna, ni claves primarias,
 ni foráneas, ni condicionantes, etc. [0.2 ptos].

    CREATE TABLE A (
        A1 VARCHAR(15),
        A2 NUMERIC(5,3),
        A3 CHAR(1) -- hombre o mujer
    );

    CREATE TABLE R (
        R1 VARCHAR(15),
        A1 VARCHAR(15),
        B1 VARCHAR(15)
    );

24. Altere o modifique todas las tablas para añadir las claves primarias [0.2 ptos].
    
    ALTER TABLE A ADD PRIMARY KEY A1; 
    ALTER TABLE R ADD PRIMARY KEY R1; 

25. Altere o modifique las tablas para añadir las claves foráneas [0.2 ptos].

    ALTER TABLE R ADD CONSTRAINT fk_A1
        FOREIGN KEY A1 REFERENCES A(A1);
    ALTER TABLE R ADD CONSTRAINT fk_B1
        FOREIGN KEY B1 REFERENCES B(B1);

26. Altere o modifique todas las tablas para añadir el resto de restricciones del enunciado [0.4 ptos].
    
    ALTER TABLE A MODIFY COLUMN A1 NOT NULL;
    ALTER TABLE A MODIFY COLUMN A2 SET DEFAULT 2.4;
    ALTER TABLE A ADD CONSTRAINT chk_A3
        CHECK (A3 = 'H' OR A3 = 'M');

27. Inserte los datos ("sai", 3.123, 'H') y ("pga", 12.547, 'M') en la tabla A
    Inserte los datos ("INF", 35.325, 'M'), ("ECO", 27.223, 'M'), ("GAR", 'H') en la tabla B
    [0.2 ptos].

    INSERT A (A1, A2, A3) VALUES
       ("sai", 3.123, 'H'),
       ("pga", 12.547, 'M');

    INSERT B (B1, B2, B3) VALUES
        ("INF", 35.325, 'M'), 
        ("ECO", 27.223, 'M');
    
    INSERT B (B1, B3) VALUES ("GAR", 'H');

28. Inserte el dato ("sai", "ECO", “TOH”) en la tabla que relacione A y B
    Inserte el dato ("pga", "ECO", “TKK”) en la tabla que relacione A y B
    Inserte el dato ("sai", "GAR", “CBB”) en la tabla que relacione A y B
    [0.2 ptos].

    INSERT R (A1, B1, R1) VALUES
        ("sai", "ECO", “TOH”),
        ("pga", "ECO", “TKK”),
        ("sai", "GAR", “CBB”);

29. En una única consulta, busque los resultados de A3, R1, A2 y B2, cuyo B3 sea igual a 'M' [0.2 ptos].

30. Incremente en 10 todos los valores B2 de la tabla B, cuyo valor sea inferior a 90 [0.2 ptos].

1.- En MySQL-MariaDB y en el PC, cree una base de datos llamada “BDC”. Entre en la base de datos 
creada para trabajar. Indique a continuación el/los comando/s para crear la BBDD indicada y 
entrar en ella para poder usarla en los siguientes apartados

    CREATE DATABASE BDC;
    USE BDC; 

2.- Cree todas las tablas con todos sus atributos, pero no aplique restricción alguna, 
ni claves primarias, ni foráneas, ni condicionantes, etc.

CREATE TABLE A(
A1 CHARACTER(15),
A2 NUMERIC(5,3),
A3 CHARACTER(1));

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| A1    | char(15)     | YES  |     | NULL    |       |
| A2    | decimal(5,3) | YES  |     | NULL    |       |
| A3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+

CREATE TABLE B(
B1 CHARACTER(15),
B2 NUMERIC(5,3),
B3 CHARACTER(1));

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| B1    | char(15)     | YES  |     | NULL    |       |
| B2    | decimal(5,3) | YES  |     | NULL    |       |
| B3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+

CREATE TABLE R(
A1 CHARACTER(15),
B1 CHARACTER(15),
R1 CHARACTER(15));

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| A1    | char(15) | YES  |     | NULL    |       |
| B1    | char(15) | YES  |     | NULL    |       |
| R1    | char(15) | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+


3.- Altere o modifique todas las tablas para añadir las claves primarias
ALTER TABLE A
ADD PRIMARY KEY (A1);

ALTER TABLE B
ADD PRIMARY KEY (B1);

ALTER TABLE R
ADD PRIMARY KEY (A1,B1);

mysql> describe A;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| A1    | char(15)     | NO   | PRI | NULL    |       |
| A2    | decimal(5,3) | YES  |     | NULL    |       |
| A3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> DESCRIBE B;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| B1    | char(15)     | NO   | PRI | NULL    |       |
| B2    | decimal(5,3) | YES  |     | NULL    |       |
| B3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> DESCRIBE R;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| A1    | char(15) | NO   | PRI | NULL    |       |
| B1    | char(15) | NO   | PRI | NULL    |       |
| R1    | char(15) | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+

4.- Altere o modifique las tablas para añadir las claves foráneas

ALTER TABLE R
ADD FOREIGN KEY (A1) REFERENCES A(A1) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (B1) REFERENCES B(B1) ON DELETE CASCADE ON UPDATE CASCADE;

5.- Altere o modifique todas las tablas para añadir el resto de restricciones del enunciado:
Los atributos A2, B2 son números con 3 decimales mayores o iguales a cero y no superiores a 99.999 
y tendrán el valor de 2.4 por defecto si no introduce ninguno. Los atributos A3 y B3 son un carácter 
cada uno y sus valores siempre serán o ‘H’ o ‘M’.

ALTER TABLE A
MODIFY COLUMN A2 DECIMAL(8,3) DEFAULT 2.4;

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| A1    | char(15)     | NO   | PRI | NULL    |       |
| A2    | decimal(8,3) | YES  |     | 2.400   |       |
| A3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

ALTER TABLE A
ADD CONSTRAINT C_A3 CHECK (A3 IN ('H','M'));

ALTER TABLE B
MODIFY COLUMN B2 DECIMAL(8,3) DEFAULT 2.4;

ALTER TABLE B
ADD CONSTRAINT C_B3 CHECK (B3 IN ('H','M'));

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| B1    | char(15)     | NO   | PRI | NULL    |       |
| B2    | decimal(8,3) | YES  |     | 2.400   |       |
| B3    | char(1)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+


TIPOS DE DATOS EN MYSQL:
https://desarrolloweb.com/articulos/1054.php

6.- Inserte los datos (“sai”, 3.123, ‘H’) y (“pga”, 12.547, ‘M’) en la tabla A
Inserte los datos (“INF”, 35.325, ‘M’), (“ECO”, 27.223, ‘M’), (“GAR”, ‘H’) en la tabla B

INSERT A VALUES
('sai',3.123,'H'),
('pga',12.547,'M');

+-----+--------+------+
| A1  | A2     | A3   |
+-----+--------+------+
| pga | 12.547 | M    |
| sai |  3.123 | H    |
+-----+--------+------+

mysql> INSERT A VALUES
    -> ('sai',3.123,'s');
ERROR 3819 (HY000): Check constraint 'C_A3' is violated.

INSERT B VALUES
('INF',35.325,'M'),
('ECO',27.223,'M'),
('GAR',NULL,'H');

+-----+--------+------+
| B1  | B2     | B3   |
+-----+--------+------+
| ECO | 27.223 | M    |
| GAR |   NULL | H    |
| INF | 35.325 | M    |
+-----+--------+------+

mysql> INSERT B VALUES ('AAA',232322232323233.232,'H');
ERROR 1264 (22003): Out of range value for column 'B2' at row 1

mysql> INSERT B VALUES ('ADA',2323.233333,'H');
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> SELECT * FROM B;
+-----+----------+------+
| B1  | B2       | B3   |
+-----+----------+------+
| AAA | 2323.230 | H    |
| ADA | 2323.233 | H    |
| ECO |   27.223 | M    |
| GAR |     NULL | H    |
| INF |   35.325 | M    |
+-----+----------+------+


7.- Inserte el dato (“sai”, “ECO”, “TOH”) en la tabla que relacione A y B
Inserte el dato (“pga”, “ECO”, “TKK”) en la tabla que relacione A y B
Inserte el dato (“sai”, “GAR”, “CBB”) en la tabla que relacione A y B

INSERT R VALUES
('sai','ECO','TOH'),
('pga','ECO','TKK'),
('sai','GAR','CBB');

+-----+-----+------+
| A1  | B1  | R1   |
+-----+-----+------+
| pga | ECO | TKK  |
| sai | ECO | TOH  |
| sai | GAR | CBB  |
+-----+-----+------+


8.- En una única consulta, busque los resultados de A3, R1, A2 y B2, cuyo B3 sea igual a ‘M’ 

SELECT A3, R1, A2, B2
FROM A, R, B
WHERE A.A1=R.A1
AND R.B1=B.B1
AND B3='M';

+------+------+--------+--------+
| A3   | R1   | A2     | B2     |
+------+------+--------+--------+
| M    | TKK  | 12.547 | 27.223 |
| H    | TOH  |  3.123 | 27.223 |
+------+------+--------+--------+

9.- Incremente en 10 todos los valores B2 de la tabla B, cuyo valor sea inferior a 90.

UPDATE B set B2=B2+10 where B2<90;

mysql> SELECT * FROM B;
+-----+----------+------+
| B1  | B2       | B3   |
+-----+----------+------+
| AAA | 2323.230 | H    |
| ADA | 2323.233 | H    |
| ECO |   27.223 | M    |
| GAR |     NULL | H    |
| INF |   35.325 | M    |
+-----+----------+------+
5 rows in set (0.00 sec)

mysql> UPDATE B set B2=B2+10 where B2<90;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM B;
+-----+----------+------+
| B1  | B2       | B3   |
+-----+----------+------+
| AAA | 2323.230 | H    |
| ADA | 2323.233 | H    |
| ECO |   37.223 | M    |
| GAR |     NULL | H    |
| INF |   45.325 | M    |
+-----+----------+------+
5 rows in set (0.00 sec)


Copie el archivo “bbdd.sql” en el USB que le habrá aportado el tribunal. No comprima el archivo. NO indique ningún tipo de dato personal ni en el archivo “bbdd.sql”, ni en los folios.

mysqldump -u franja -p bdc > bbdd.sql