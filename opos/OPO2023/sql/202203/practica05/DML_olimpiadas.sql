-- Entrega 2
-- Autor: Juana (Solución)

/* Se piden las siguientes consultas:

1. Listado alfabético de modalidades en las que ha obtenido el primer puesto el instituto ‘Romero Vargas’ (modalidad).

2. Listado de alumnos que hayan participado en la modalidad 1 (alumno | instituto | género).

3. Listado de institutos que hayan quedado en segundo puesto (instituto | modalidad).

4. Listado alfabético de institutos (instituto | representante | localidad).

5. Cantidad de participantes en la modalidad ‘Informática’ (participantes).

6. Número de premios obtenidos por cada instituto ordenados descendentemente (instituto | número de premios).
   Deben aparecer todos los intitutos, aunque no hayan obtenido premio. */

/* 1 */

SELECT modalidad.nombre AS modalidad 
FROM modalidad 
     JOIN premiado ON premiado.modalidad_id = modalidad.id
     JOIN instituto ON instituto.id = premiado.instituto_id
WHERE instituto.nombre = "Romero Vargas" AND premiado.puesto = "1" 
ORDER BY modalidad.nombre ASC;

/* 2 */

SELECT alumno.nombre AS alumno, 
       instituto.nombre AS instituto, 
       alumno.genero AS "género" 
FROM alumno 
     JOIN participante ON participante.alumno_id = alumno.id AND alumno.instituto_id = participante.alumno_instituto_id 
     JOIN instituto ON instituto.id = alumno.instituto_id 
WHERE participante.modalidad_id = "1";

/* 3 */

SELECT instituto.nombre AS instituto, 
       modalidad.nombre AS modalidad 
FROM instituto 
     JOIN premiado ON premiado.instituto_id = instituto.id 
     JOIN modalidad ON modalidad.id = premiado.modalidad_id 
WHERE premiado.puesto = "2";

/* 4 */

SELECT instituto.nombre AS instituto, 
       instituto.representante AS representante, 
       localidad.nombre AS localidad 
FROM instituto 
     JOIN localidad ON localidad.id = instituto.localidad_id 
ORDER BY instituto.nombre ASC;

/* 5 */

SELECT COUNT(*) AS participantes 
FROM participante 
     JOIN modalidad ON modalidad.id = modalidad_id 
WHERE modalidad.nombre = "Informática";

/* 6 */

SELECT instituto.nombre AS instituto, 
       COUNT(premiado.instituto_id) AS "número de premios" 
FROM premiado 
     RIGHT JOIN instituto ON instituto.id = premiado.instituto_id 
GROUP BY instituto.id 
ORDER BY instituto.nombre DESC;

/* Se piden las siguientes consultas:
7. Nombre de instituto que más oros ha tenido (instituto).

8. Listado de alumnos que participen en más de una modalidad (alumno | modalidades). 
   La columna modalidades se presentará separadas por una coma.

9. Media de edad de los alumnos que participan en las diferentes modalidades (modalidad | media de edad).

10. Podium de la modalidad ‘Informática’ ordenado por puesto (instituto | localidad | puesto).

11. Listado alfabético de institutos que no hayan conseguido ningún premio (instituto).

12. Número de institutos por cada localidad (localidad | número de institutos).

13. Cantidad de alumnos que hayan nacido en el segundo semestre del año (de julio a septiembre) y que sean mujeres. */

/* 7 */
SELECT instituto.nombre AS instituto 
FROM instituto 
     JOIN premiado ON premiado.instituto_id = instituto.id 
WHERE premiado.puesto = "1" 
GROUP BY instituto.id 
ORDER BY COUNT(premiado.instituto_id) DESC 
LIMIT 1;

/* 8 */
SELECT alumno.nombre AS alumno, 
       GROUP_CONCAT(modalidad.nombre) AS modalidades 
FROM alumno 
     JOIN participante ON alumno.id = participante.alumno_id AND alumno.instituto_id = participante.alumno_instituto_id 
     JOIN modalidad ON modalidad.id = participante.modalidad_id 
GROUP BY participante.alumno_instituto_id, participante.alumno_id 
HAVING COUNT(modalidad.nombre) > 1;

/* 9 */
SELECT modalidad.nombre AS modalidad, 
       AVG(TIMESTAMPDIFF(YEAR,alumno.fecha_nacimiento,NOW())) AS "media de edad" 
FROM alumno 
     JOIN participante ON participante.alumno_instituto_id = alumno.instituto_id AND participante.alumno_id = alumno.id 
     JOIN modalidad ON participante.modalidad_id = modalidad.id 
GROUP BY modalidad.id;

/* 10 */
SELECT instituto.nombre AS instituto, 
       localidad.nombre AS localidad, 
       premiado.puesto AS puesto
FROM instituto 
     JOIN localidad ON localidad.id = instituto.localidad_id 
     JOIN premiado ON premiado.instituto_id = instituto.id 
     JOIN modalidad ON modalidad.id = premiado.modalidad_id 
WHERE modalidad.nombre = "Informática" 
ORDER BY premiado.puesto ASC;

/* 11 */
SELECT instituto.nombre AS instituto
FROM instituto 
     LEFT JOIN premiado ON premiado.instituto_id = instituto.id 
WHERE premiado.puesto IS NULL;

/* 12 */
SELECT localidad.nombre AS localidad, 
       COUNT(instituto.id) AS "número de institutos" 
FROM localidad 
       JOIN instituto ON instituto.localidad_id = localidad.id 
GROUP BY localidad.id;

/* 13 */
SELECT COUNT(id) AS cantidad 
FROM alumno 
WHERE MONTH(fecha_nacimiento) BETWEEN "07" AND "09" AND genero = "F";

/* Y se piden, también, las siguientes vistas:

A. medallero (modalidad, medalla, instituto). Contendrá todas las modalidades, los diferentes premios 
y el instituto que lo ha obtenido. El premio debe aparecer con el texto ‘Oro’, ‘Plata’ o ‘Bronce’.

B. participantes (dorsal, alumno, instituto, edad, género). Contendrá el listado total de alumnos. 
La columna “dorsal” se conseguirá concatenando las dos columnas que forman su clave primaria.
*/

/* A */
CREATE VIEW medallero (modalidad,medalla,instituto) AS 
SELECT modalidad.nombre, 
       CASE premiado.puesto 
          WHEN "1" THEN "Oro" 
          WHEN "2" THEN "Plata" 
          WHEN "3" THEN "Bronce" 
       END, 
       instituto.nombre 
FROM modalidad 
     JOIN premiado ON premiado.modalidad_id = modalidad.id 
     JOIN instituto ON instituto.id = premiado.instituto_id;

/* B */
CREATE VIEW participantes (dorsal,alumno,instituto,edad,género) AS 
SELECT CONCAT(alumno.id,alumno.instituto_id), 
       alumno.nombre, 
       instituto.nombre, 
       TIMESTAMPDIFF(YEAR,alumno.fecha_nacimiento,NOW()), 
       alumno.genero 
FROM alumno 
     JOIN instituto ON instituto.id = alumno.instituto_id;
