/* Practica 1 DML */

/* 5 y 6. Insertar datos. No lo vamos a hacer con LOAD DATA, sino con INSERTs */
INSERT tabla1 VALUES(
    NULL,
    '31231234H',
    'Martín',
    'Buendía',
    'Parra',
    '1999-01-11',
    '11:00:00',
    'M',
    'Castellano,Inglés',
    'N',
    175,
    70300
    );

INSERT tabla1 (nombre,nif,apellido1,idiomas) VALUES ('Moisés','31409876A','Gallego',31);

INSERT tabla1 VALUES (null,'31234567H','José','García','De los Santos',null,null,'M',null,null,null,null);

INSERT tabla1 (nombre,apellido1,nif) VALUES ('Paz','Rey','31222333H');

/* ---------------------- Ejemplo general ------------------------------ */

SELECT CONCAT(apellido1,', ',nombre) AS persona,
       altura/100 AS 'altura en metros',
       YEAR(nacimiento) AS 'año de nacimiento',
       IF (fumador='S','fumador','') AS fumador
FROM tabla1
WHERE sexo = 'M' AND hora = '00:00:00' AND altura IS NOT NULL
ORDER BY 1
LIMIT 2;

/* ---------------------- Consultas solicitadas ------------------------ */

/* 7.a */
SELECT CONCAT(apellido1, ' ', apellido2, ', ', nombre) AS nombre 
FROM tabla1 
ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

/* 7.b */
SELECT CONCAT(apellido1, ' ', apellido2, ', ', nombre) AS nombre,
       TIMESTAMPDIFF(YEAR,nacimiento,NOW()) AS edad
FROM tabla1 
ORDER BY 1 ASC;

/ * 7.c */
SELECT TRUNCATE(AVG(altura/100), 2) AS "media de altura" 
FROM tabla1;

/* 7.d */
SELECT CONCAT(apellido1, ' ', apellido2, ', ', nombre) AS nombre,
       TIMESTAMPDIFF(YEAR,nacimiento,NOW()) AS edad
FROM tabla1 
ORDER BY nacimiento DESC
LIMIT 1;

/* 7.e */
SELECT COUNT(*) AS 'Número de fumadores'
FROM tabla1
WHERE fumador = 'S';

/* 7.f */
SELECT COUNT(*) AS 'Número de personas con inglés'
FROM tabla1
WHERE idiomas LIKE '%Ingles%';

/* 7.g */
SELECT AVG(peso) AS 'media de peso'
FROM tabla1;

/* 7.h */
SELECT apellido1, COUNT(*) AS 'cantidad'
FROM tabla1
GROUP BY apellido1
ORDER BY apellido1;

/* 7.i */
SELECT nif,
       MONTH(nacimiento) AS 'mes nacimiento'
FROM tabla1
WHERE altura = (SELECT MAX(altura) FROM tabla1);
