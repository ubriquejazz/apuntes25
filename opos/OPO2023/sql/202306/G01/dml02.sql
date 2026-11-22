--
--
--

-- Recuperar los clientes a los que se les ha realizado algún análisis
-- del tipo 'SANGRE BÁSICO'.
SELECT id_ana FROM tipos_analisis 
WHERE desc_ana = "SANGRE BÁSICO"; -- 1

SELECT * FROM pacientes 
WHERE dni_pac IN (SELECT dni_pac FROM peticiones 
WHERE id_ana = 1);

-- Recuperar el tipo de analítica más solicitada.
select id_ana, count(*) from peticiones group by id_ana order by count(*) desc;

SELECT id_ana FROM peticiones 
GROUP BY id_ana ORDER BY count(*) DESC; -- 2, 3, 4, 1, 5

SELECT desc_ana FROM tipos_analisis WHERE id_ana IN (2, 3, 4, 1, 5)
LIMIT 1;

-- Recuperar los datos de los 2 doctores que mayor número de análisis nos han 
-- solicitado últimamente, indicando el número que ha solicitado cada uno.
SELECT dni_doc, count(id_pet)
FROM peticiones GROUP BY dni_doc ORDER BY count(id_pet);

SELECT p.dni_doc, count(id_pet), d.nombre_doc
FROM peticiones p JOIN doctores d ON p.dni_doc = d.dni_doc
GROUP BY p.dni_doc ORDER BY count(id_pet) DESC
LIMIT 2; 

-- Obtener los datos de los DOCTORES que nunca nos han pedido una analítica de nadie. 
SELECT dni_doc FROM peticiones;

SELECT nombre_doc FROM doctores 
WHERE dni_doc NOT IN (SELECT dni_doc FROM peticiones);

-- Hallar los datos de los PACIENTES que no se han realizado una analítica en los últimos ..
-- indicando el tiempo que ha transcurrido desde que se hicieron la última.
SELECT fecha_pet, DATEDIFF(current_date, DATE_ADD(fecha_pet, INTERVAL 15 YEAR)) dias
FROM peticiones;

SELECT dni_pac, fecha_pet, DATEDIFF(current_date, DATE_ADD(fecha_pet, INTERVAL 15 YEAR)) as dias
FROM peticiones 
WHERE  DATEDIFF(current_date, DATE_ADD(fecha_pet, INTERVAL 15 YEAR)) > 0;

SELECT p1.dni_pac, p2.nombre_pac, fecha_pet, DATEDIFF(current_date, DATE_ADD(fecha_pet, INTERVAL 15 YEAR)) as retraso_dias
FROM peticiones p1 JOIN pacientes p2 ON p1.dni_pac = p2.dni_pac
WHERE  DATEDIFF(current_date, DATE_ADD(fecha_pet, INTERVAL 15 YEAR)) > 0;

NOTA: He cambiado los 20 dias por 15 anos para tuviera sentido con la fecha actual (2023)

-- Crear una vista (DOCS_PETS) con los datos de los DOCTORES y el número de veces que 
-- nos ha solicitado una analítica, incluyendo también a los que nunca nos han pedido ninguna.
CREATE VIEW DOCS_PETS AS
    SELECT d.nombre_doc, count(id_pet)
    FROM doctores d LEFT JOIN peticiones p 
    ON d.dni_doc = p.dni_doc
    GROUP BY d.dni_doc;

--  Indicar las sentencias a utilizar y mostrar de la tabla PACIENTES:
-- el contenido actual 
SET AUTOCOMMIT = 0;

-- actualizar para que la aseguradora "CASER" pase a ser "MUTUA" 
UPDATE pacientes SET aseguradora = "MUTA"
WHERE aseguradora = "CASER";
+-----------+-----------------------------+-----------+-------------+
| 19887234W | GUTIÉRREZ CAMACHO, ANTONIO  | 646678986 | MUTA        |
| 22897576R | PÉREZ GARCÍA, CARLOS        | 646787987 | ASISA       |
| 33788976F | LÁZARO PEDRÓS , MARÍA       | 690343434 | ASISA       |
| 44787345H | TUSET BOADA, CARLOS         | 623758940 | MUTA        |
| 55524632J | RUIZ SEÑOR, RAFAEL          | 687565454 | SANITAS     |
| 71515623A | MARTÍNEZ HEREDIA, PACO      | 646234127 | SANITAS     |
| 79876867X | SERRA TORNER, LUISA         | 696340929 | DKV         |
+-----------+-----------------------------+-----------+-------------+

-- el contenido después de haber deshecho el cambio anterior y volver a la situación original
ROLLBACK;
+-----------+-----------------------------+-----------+-------------+
| 19887234W | GUTIÉRREZ CAMACHO, ANTONIO  | 646678986 | CASER       |
| 22897576R | PÉREZ GARCÍA, CARLOS        | 646787987 | ASISA       |
| 33788976F | LÁZARO PEDRÓS , MARÍA       | 690343434 | ASISA       |
| 44787345H | TUSET BOADA, CARLOS         | 623758940 | CASER       |
| 55524632J | RUIZ SEÑOR, RAFAEL          | 687565454 | SANITAS     |
| 71515623A | MARTÍNEZ HEREDIA, PACO      | 646234127 | SANITAS     |
| 79876867X | SERRA TORNER, LUISA         | 696340929 | DKV         |
+-----------+-----------------------------+-----------+-------------+

-- Añadir un índice ÚNICO en la tabla PACIENTES  en la columna NOMBRE_PAC.  
CREATE FULLTEXT INDEX idx_nombre ON pacientes(nombre_pac);