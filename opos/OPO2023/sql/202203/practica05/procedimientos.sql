-- PRÁCTICA 5. Procedimientos sobre la BD olimpiadas --
-- Autor: Juana (solución)


/* P1. Listado alfabético de los participantes de las olimpiadas indicando 
nombre del participante, dorsal (compuesto por identificador de instituto e 
identificador del alumno), instituto al que pertenece y localidad de éste. */


CREATE PROCEDURE P1()
SELECT alumno.nombre AS participante,
       CONCAT(alumno.instituto_id,alumno.id) AS dorsal,
       instituto.nombre AS instituto,
       localidad.nombre AS localidad
FROM participante 
JOIN alumno ON alumno.instituto_id = participante.alumno_instituto_id AND 
               alumno.id = participante.alumno_id
JOIN instituto ON alumno.instituto_id = instituto.id
JOIN localidad ON localidad.id = instituto.localidad_id
ORDER BY alumno.nombre ASC;

/* P2. Listado número de Oros, 
número de Platas y número de Bronces del instituto cuyo 
parámetro se recibe. */

DELIMITER //
CREATE PROCEDURE P2(IN p_inst INT)
BEGIN
    DECLARE oro INT UNSIGNED DEFAULT 0;
    DECLARE plata INT UNSIGNED DEFAULT 0;
    DECLARE bronce INT UNSIGNED DEFAULT 0;
    SELECT COUNT(*) INTO oro FROM premiado WHERE puesto = 1 AND instituto_id = p_inst;
    SELECT COUNT(*) INTO plata FROM premiado WHERE puesto = 2 AND instituto_id = p_inst;
    SELECT COUNT(*) INTO bronce FROM premiado WHERE puesto = 3 AND instituto_id = p_inst;
    SELECT oro, plata, bronce;
END //
DELIMITER ;



/* P3. Listado de participantes de una determinada modalidad. 
El identificador de la modalidad será el parámetro de
entrada al procedimiento y la salida debe indicar dorsal 
y nombre del participante. El listado estará ordenado por
dorsal.*/

CREATE PROCEDURE P3(IN p_idmodalidad INT)
SELECT CONCAT(alumno.instituto_id,alumno.id) AS dorsal,
       alumno.nombre AS alumno
FROM alumno
JOIN participante ON alumno.id = participante.alumno_id AND
                     alumno.instituto_id = participante.alumno_instituto_id
WHERE participante.modalidad_id = p_idmodalidad
ORDER BY dorsal;

/* Versión 2 del P3 (supongamos que en lugar del identificador de modalidad, 
el parámetro fuera el nombre de la modalidad  !!! */

CREATE PROCEDURE P3_2(IN p_modalidad VARCHAR(45))
SELECT CONCAT(alumno.instituto_id,alumno.id) AS dorsal,
       alumno.nombre AS alumno
FROM alumno
JOIN participante ON alumno.id = participante.alumno_id AND
                     alumno.instituto_id = participante.alumno_instituto_id
JOIN modalidad ON participante.modalidad_id = modalidad.id
WHERE modalidad.nombre = p_modalidad
ORDER BY dorsal;


/* P4. Listado del porcentaje de participantes por cada modalidad, indicando 
modalidad y porcentaje sobre el total.*/

DELIMITER ££
CREATE PROCEDURE P4()
BEGIN
	DECLARE total_participantes INT UNSIGNED DEFAULT 0;
	SELECT COUNT(*) INTO total_participantes FROM participante;
	SELECT modalidad.nombre as Modalidad, 
               COUNT(*)*100/total_participantes AS porcentaje_participantes
    		FROM modalidad JOIN participante ON modalidad.id = participante.modalidad_id
    	GROUP BY modalidad.id;
END
££
DELIMITER ;


/* P5. Listado alfabético de localidades que NO han conseguido ninguna 
medalla en las Olimpiadas. */

CREATE PROCEDURE P5()
SELECT DISTINCT localidad.nombre
FROM localidad JOIN instituto ON localidad.id = instituto.localidad_id
WHERE instituto.id NOT IN (SELECT DISTINCT instituto_id FROM premiado);

