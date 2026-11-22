/* 1. Insertar el registro correspondiente al componente José Manuel Castilla Gil 
con DNI 31222333, de Jimena, presidente de la mesa A del colegio 1, 
que habla francés e inglés. */

// Primera forma
INSERT componente (nombre, dni, 
                   lugar_nacimiento, 
                   cargo, 
                   mesa_letra, 
                   mesa_colegio_idcolegio, 
                   idiomas) 
VALUES ('José Manuel Castilla Gil', 
        '31222333', 
        'Ubrique', 
        'PR', 
        'A', 
         1, 
        'en,fr');

// Segunda forma
INSERT componente VALUES ('31222333',
                          'José Manuel Castilla Gil',
                          null,
                          'PR',
                          'Jimena',
                          NULL,                                     
                          'fr,en',				    
                          'A',
                           1);

/* 2. Modificar el registro correspondiente al componente Cristóbal Quirós Sánchez de Medina indicando que
nació en Marbella y sabe alemán.*/

UPDATE componente SET lugar_nacimiento = 'Marbella', idiomas = 'de' WHERE nombre = 'Cristóbal Quirós Sánchez de Medina';

/* 3. Eliminar todos los registros de la tabla componente que no hablen ningún idioma.*/

DELETE FROM componente WHERE idiomas IS NULL OR idiomas = ''; 

/* 4. Consultar los nombres y el cargo de todos los componentes indicando colegio y mesa, ordenados por
colegio, mesa y cargo.*/

SELECT nombre,
       cargo,
       mesa_colegio_idcolegio,
       mesa_letra
FROM componente
ORDER BY mesa_colegio_idcolegio ASC, mesa_letra ASC, cargo ASC; // ORDER BY 3 ASC, 4 ASC, 2 ASC

/* 5. Consultar el nombre y la edad del componente de menor edad.*/

SELECT nombre,
       TIMESTAMPDIFF(YEAR,f_nacimiento,NOW()) AS edad
FROM componente
WHERE f_nacimiento = (SELECT MAX(f_nacimiento) FROM componente);

/* 6. Consultar los nombres de los componentes que no hayan nacido en Jimena.*/

SELECT nombre 
FROM componente
WHERE lugar_nacimiento != 'Jimena';       // lugar_nacimiento NOT LIKE 'Jimena'

/* 7. Consultar el dni y el nombre de los 3 primeros componentes que sean mujeres.*/

SELECT dni,
       nombre
FROM componente
WHERE sexo = 'M'
LIMIT 0,3; // LIMIT 3

/* 8. Consultar el nombre de los componentes que hayan nacido en verano, ordenados por dni.*/
SELECT nombre
FROM componente
WHERE RIGHT(f_nacimiento,5) >= '06-21' AND RIGHT(f_nacimiento,5) <= '09-21'
ORDER BY dni ASC;

// Con between !!
SELECT nombre
FROM componente
WHERE RIGHT(f_nacimiento,5) BETWEEN '06-21' AND '09-21'
ORDER BY dni ASC;

/* 9. Consultar el total de votos obtenido por el partido cuyo líder es Pascual Collado.*/

SELECT SUM(votos) 
FROM recuento 
WHERE partido_siglas = (
                       SELECT siglas FROM partido WHERE lider = 'Pascual Collado'
		       )
;

/* 10. Consultar el nombre y la fecha de nacimiento (de la forma dia/mes/año) de los componentes que nacieron
después de 1990 y sean vocales.*/

SELECT nombre,
       DATE_FORMAT(f_nacimiento,'%d/%m/%Y') AS 'fecha nacimiento'
FROM componente
WHERE YEAR(f_nacimiento) > 1990 AND cargo LIKE 'V_'; 

SELECT nombre,
       CONCAT(DAY(f_nacimiento),'/',MONTH(f_nacimiento),'/',YEAR(f_nacimiento)) AS 'fecha nacimiento'
FROM componente
WHERE YEAR(f_nacimiento) > 1990 AND cargo LIKE 'V_'; 

/* 11. Asignar el valor ‘Jimena’ en el campo lugar_nacimiento de la tabla componente en todos aquellos registros
en los que no tenga ningún valor.*/

UPDATE componente SET lugar_nacimiento = 'Jimena' WHERE lugar_nacimiento IS NULL;

/* 12. Consultar el total de componentes de las diferentes poblaciones de nacimiento, ordenadas
alfabéticamente. */

SELECT lugar_nacimiento,
       COUNT(*) AS componentes
FROM componente
GROUP BY lugar_nacimiento
ORDER BY lugar_nacimiento ASC;

/* 13. Consultar los colegios y el número de mesas que lo componen, ordenados por direccion.*/

SELECT idcolegio,
       direccion,
       (SELECT COUNT(*) FROM mesa WHERE colegio_idcolegio = idcolegio) AS 'Número de mesas'
FROM colegio
ORDER BY direccion;

/* 14. Indicar el partido y el líder del partido cuyo nombre de partido tenga la mayor longitud.*/

SELECT siglas,
       lider
FROM partido
WHERE LENGTH(siglas) = (SELECT MAX(LENGTH(siglas)) FROM partido);

/* 15. Extraer los datos de uno de los componentes elegido al azar de la forma que se muestra en el ejemplo:
“José Manuel Castilla Gil es Presidente y nació en Jimena”.*/

SELECT CONCAT(
	       nombre,
               ' es ',
               IF(cargo = 'PR','Presidente','Vocal') 
               ' y nació en ',
               lugar_nacimiento
	     )
FROM componente
ORDER BY RAND()
LIMIT 1;

SELECT CONCAT(
	       nombre,
               ' es ',
               CASE cargo 
                 WHEN 'PR' THEN 'Presidente'
                 WHEN 'V1' THEN 'Vocal Primero'
                 WHEN 'V2' then 'Vocal Segundo'
               END 
               ' y nació en ',
               lugar_nacimiento
	     )
FROM componente
ORDER BY RAND()
LIMIT 1;


