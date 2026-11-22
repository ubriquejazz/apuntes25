/* 1. Listado alfabético de todos los bomberos de la provincia indicando parque al que pertenece.*/
SELECT CONCAT(bombero.apellidos, ', ',bombero.nombre as bombero,
       parque.nombre AS parque
FROM bombero JOIN parque ON bombero.parque_id = parque.id
ORDER BY 1;

/* 2. Listado de todos los parques de la provincia, ordenados descendentemente por número de coches. */
SELECT parque.nombre AS parque,
       COUNT(coche.id) AS 'número de coches'
FROM parque LEFT JOIN coche ON parque.id = coche.parque_id
GROUP BY coche.id
ORDER BY 2 DESC;

/* 3. Listado alfabético de bomberos por cada parque, indicando edad y parque. */
SELECT CONCAT(bombero.apellidos,', ',bombero.nombre) AS bombero,
       TIMESTAMPDIFF(YEAR,bombero.fecha_nacimiento,NOW()) AS edad,
       parque.nombre AS parque
FROM bombero JOIN parque ON bombero.parque_id = parque.id
ORDER BY parque.nombre, 1;

/* 4. Media de edad de los bomberos de la provincia, agrupados por parque descendentemente, indicando parque, localidad, número de bomberos y media de edad. */
SELECT parque.nombre AS parque,
       parque.poblacion AS localidad,
       COUNT(bombero.id) AS 'número de bomberos',
       AVG(TIMESTAMPDIFF(YEAR,bombero.fecha_nacimiento,NOW())) AS 'media edad'
FROM parque LEFT JOIN bombero ON parque.id = bombero.parque_id
GROUP BY parque.id
ORDER BY 4 DESC;

/* 5. Servicios prestados por cada parque, indicando el equipo que realizó el servicio (mostrando todos los nombres de los bomberos del equipo) y ordenado por parque al que pertenece. */
SELECT parque.nombre AS parque,
       servicio.fecha AS fecha,
	   servicio.hora AS hora,
       servicio.tipo_servicio AS 'tipo de servicio',
       servicio.urgencia AS 'nivel de urgencia',
       GROUP_CONCAT(bombero.apellidos,', ',bombero.nombre,'(',equipo.puesto,')' SEPARATOR ' - ') AS equipo
FROM servicio
     LEFT JOIN parque ON parque.id = servicio.parque_id
     JOIN equipo ON servicio.id = equipo.servicio_id
     JOIN bombero ON equipo.bombero_id = bombero.id
GROUP BY servicio.id;

/* 6. Número de servicios atendidos por cada parque durante el año actual (se considerará el 20..!!). */
SELECT parque.nombre AS parque,
       COUNT(servicio.id) AS servicios
FROM parque
     JOIN servicio ON servicio.parque_id = parque.id
WHERE YEAR(servicio.fecha) = 2015
GROUP BY parque.id;