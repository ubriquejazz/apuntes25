
# ASI2021

#### En MySQL-MariaDB y en el PC, cree una base de datos llamada “BDC”. 

Entre en la base de datos creada para trabajar. Indique a continuación el/los comando/s para crear la BBDD indicada y entrar en ella para poder usarla en los siguientes apartados

    CREATE DATABASE BDC;
    USE BDC; 

#### Cree todas las tablas con todos sus atributos...

pero no aplique restricción alguna, ni claves primarias, ni foráneas, ni condicionantes, etc.

    CREATE TABLE A(
        A1 CHARACTER(15),
        A2 NUMERIC(5,3),
        A3 CHARACTER(1)
    );

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


#### Altere o modifique todas las tablas para añadir las claves primarias

    ALTER TABLE A
    ADD PRIMARY KEY (A1);

    ALTER TABLE B
    ADD PRIMARY KEY (B1);

    ALTER TABLE R
    ADD PRIMARY KEY (A1,B1);

    +-------+----------+------+-----+---------+-------+
    | Field | Type     | Null | Key | Default | Extra |
    +-------+----------+------+-----+---------+-------+
    | A1    | char(15) | NO   | PRI | NULL    |       |
    | B1    | char(15) | NO   | PRI | NULL    |       |
    | R1    | char(15) | YES  |     | NULL    |       |
    +-------+----------+------+-----+---------+-------+

#### Altere o modifique las tablas para añadir las claves foráneas

    ALTER TABLE R
    ADD CONSTRAINT fk_A1 FOREIGN KEY (A1) REFERENCES A(A1) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT fk_A2 FOREIGN KEY (B1) REFERENCES B(B1) ON DELETE CASCADE ON UPDATE CASCADE;

#### Altere o modifique todas las tablas para añadir el resto de restricciones del enunciado:

Los atributos A2, B2 son números con 3 decimales mayores o iguales a cero y no superiores a 99.999 y tendrán el valor de 2.4 por defecto si no introduce ninguno. Los atributos A3 y B3 son un carácter cada uno y sus valores siempre serán o ‘H’ o ‘M’.

    ALTER TABLE A
    MODIFY COLUMN A2 DECIMAL(8,3) DEFAULT 2.4;

    ALTER TABLE A
    ADD CONSTRAINT C_A3 CHECK (A3 IN ('H','M'));

    ALTER TABLE B
    MODIFY COLUMN B2 DECIMAL(8,3) DEFAULT 2.4;

    ALTER TABLE B
    ADD CONSTRAINT C_B3 CHECK (B3 IN ('H','M'));

[TIPOS DE DATOS EN MYSQL](https://desarrolloweb.com/articulos/1054.php)

#### Inserte los datos (“sai”, 3.123, ‘H’) y (“pga”, 12.547, ‘M’) en la tabla A

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

#### Inserte datos en la tabla que relacione A y B

Inserte el dato (“sai”, “ECO”, “TOH”) en la tabla que relacione A y B
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

#### En una única consulta, busque los resultados de A3, R1, A2 y B2, cuyo B3 sea igual a ‘M’ 

    SELECT A3, R1, A2, B2
    FROM R
    JOIN A ON A.A1=R.A1 
    JOIN B ON B.B1=R.B1 
    WHERE B3='M';

    +------+------+--------+--------+
    | A3   | R1   | A2     | B2     |
    +------+------+--------+--------+
    | M    | TKK  | 12.547 | 27.223 |
    | H    | TOH  |  3.123 | 27.223 |
    +------+------+--------+--------+

#### Incremente en 10 todos los valores B2 de la tabla B, cuyo valor sea inferior a 90.

    +-----+----------+------+
    | B1  | B2       | B3   |
    +-----+----------+------+
    | AAA | 2323.230 | H    |
    | ADA | 2323.233 | H    |
    | ECO |   27.223 | M    |
    | GAR |     NULL | H    |
    | INF |   35.325 | M    |
    +-----+----------+------+

    UPDATE B set B2=B2+10 where B2<90;

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

