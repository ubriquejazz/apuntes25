/* CONSULTAS BD videoclub */
/* Autor: Juana */

/* 1. Consultar el código, nombre y fecha de ingreso en el videoclub de los socios con apellido López */
SELECT id, 
       nombre, 
       fecha_alta
FROM socio
WHERE nombre LIKE '%López%';

/* 2. ¿Cuantas personas se hicieron socias en el último trimestre de 2010? */

/* Primera forma */
SELECT COUNT(id)
FROM socio
WHERE LEFT(fecha_alta,7) BETWEEN '2010-10' AND '2010-12';

/* Segunda forma */
SELECT COUNT(*)
FROM socio
WHERE fecha_alta LIKE '2010-1_-%';

/* Tercera forma */
SELECT COUNT(*)
FROM socio
WHERE YEAR(fecha_alta) = 2010 AND
      MONTH(fecha_alta) >= 10 AND
      MONTH(fecha_alta) <= 12;

/* 3. Consultar los datos de los socios ordenados por la fecha de ingreso */
SELECT * 
FROM socio
ORDER BY fecha_alta;

/* 4. ¿Cuál es el precio medio de una película en el videoclub? */
SELECT AVG(precio) FROM pelicula;

/* 5. ¿Cuántas películas están por encima del precio medio? */
SELECT COUNT(*)
FROM pelicula
WHERE precio > (SELECT AVG(precio) FROM pelicula);

/* 6. Consultar los préstamos que han tenido una duración superior a dos días, visualizando el nombre
del socio y el título de la película.*/
SELECT socio.nombre AS socio,
       pelicula.nombre AS 'película'
FROM socio
JOIN alquiler ON alquiler.socio_id = socio.id
JOIN pelicula ON alquiler.pelicula_id = pelicula.id
WHERE TIMESTAMPDIFF(DAY,alquiler.fecha_alquiler,alquiler.fecha_devolucion) > 2 OR
      (alquiler.fecha_devolucion IS NULL AND TIMESTAMPDIFF(DAY,alquiler.fecha_alquiler,NOW()) > 2);

/* 7. Consultar el nombre de los socios que han alquilado la película “Desperado”. */
SELECT socio.nombre AS socio
FROM socio
JOIN alquiler ON alquiler.socio_id = socio.id
JOIN pelicula ON alquiler.pelicula_id = pelicula.id
WHERE pelicula.nombre = 'Desperado';


/* 8. Mostrar la lista de socios y la cantidad de películas que han alquilado. */
SELECT socio.nombre AS socio,
       COUNT(alquiler.socio_id) AS 'cantidad de películas alquiladas'
FROM socio
LEFT JOIN alquiler ON socio.id = alquiler.socio_id
GROUP BY socio.id;

SELECT socio.nombre AS socio,
       COUNT(alquiler.socio_id) AS 'cantidad de películas alquiladas'
FROM alquiler
RIGHT JOIN socio ON socio.id = alquiler.socio_id
GROUP BY socio.id;


/* 9. Mostrar el precio que ha pagado el socio número 1 al alquilar la película 4. */
SELECT pelicula.precio
FROM pelicula JOIN alquiler ON alquiler.pelicula_id = pelicula.id
WHERE alquiler.socio_id = 1 AND alquiler.pelicula_id = 4;

/* 10. Mostrar la lista de películas que no han sido alquiladas. */

SELECT pelicula.nombre
FROM pelicula
LEFT JOIN alquiler ON alquiler.pelicula_id = pelicula.id
GROUP BY pelicula.id
HAVING COUNT(alquiler.pelicula_id) = 0;


SELECT nombre FROM pelicula WHERE id NOT IN (SELECT DISTINCT pelicula_id FROM alquiler);


/* 11. Mostrar cuánto ha ganado el videoclub en el año 2010. */
SELECT SUM(pelicula.precio) AS 'ganado en 2010'
FROM alquiler
JOIN pelicula ON pelicula.id = alquiler.pelicula_id
WHERE YEAR(alquiler.fecha_alquiler) = 2010;


/* 12. Mostrar las películas que están actualmente alquiladas. ALQUILERES CON FECHA DE ALQUILER PERO SIN FECHA DE DEVOLUCIÓN*/
SELECT pelicula.nombre
FROM pelicula JOIN alquiler ON alquiler.pelicula_id = pelicula.id
WHERE alquiler.fecha_devolucion IS NULL;


/* 13. Mostrar el “top manta”, es decir, la lista de películas y las veces que han sido alquiladas  
ordenada descendentemente por este último dato. */
SELECT pelicula.nombre AS 'película',
       COUNT(alquiler.pelicula_id) AS 'veces alquilada'
FROM pelicula LEFT JOIN alquiler ON alquiler.pelicula_id = pelicula.id
GROUP BY pelicula.id
ORDER BY 2 DESC;



/* 14. Mostrar el nombre y el número de teléfono de los socios que tienen películas en su casa. */
SELECT socio.nombre AS nombre,
       socio.telefono AS 'teléfono'
FROM socio
     JOIN alquiler ON socio.id = alquiler.socio_id
WHERE alquiler.fecha_devolucion IS NULL;


/* 15. ¿Cuánto dinero ha gastado 'Teresa Sánchez López' en el videoclub? */
SELECT SUM(pelicula.precio) AS 'dinero gastado por Teresa Sánchez López'
FROM alquiler
     JOIN socio ON socio.id = alquiler.socio_id
     JOIN pelicula ON pelicula.id = alquiler.pelicula_id
WHERE socio.nombre = 'Teresa Sánchez López';


/* 16. Consultar los nombres y códigos de socios que han alquilado películas de suspense o acción
ordenados por código de socio
SELECT
    socio.idsocio AS codigo,
    socio.nombre AS nombre
FROM socio
     JOIN alquila ON socio.idsocio = alquila.socio_idsocio
     JOIN pelicula ON alquila.pelicula_idpelicula = pelicula.idpelicula
WHERE
    pelicula.tematica = 'Suspense' OR pelicula.tematica = 'Accion';

*/ 17. Consultar el nombre y código del socio junto con el dinero total gastado de aquellos socios que
han gastado más de 5 euros en el videoclub */
SELECT socio.nombre AS socio,
       SUM(pelicula.precio) AS 'total gastado'
FROM socio 
     JOIN alquiler ON alquiler.socio_id = socio.id
     JOIN pelicula ON alquiler.pelicula_id = pelicula.id
GROUP BY socio.id
HAVING SUM(pelicula.precio) > 5;


18. Mostrar las fechas en que ha sido alquilada la película “Desperado”.
SELECT alquiler.fecha_alquiler
FROM ALQUILER 
     JOIN pelicula ON alquiler.pelicula_id = pelicula.id
WHERE pelicula.nombre = 'Desperado'

19. Mostrar la lista de películas que ha alquilado el socio con DNI 27711498D.
SELECT pelicula.nombre
FROM pelicula 
     JOIN alquila ON pelicula.idpelicula = alquila.pelicula_idpelicula
     JOIN socio ON socio.idsocio = alquila.socio_idsocio
WHERE socio.nif = '27711498D';

20. ¿Cuál es la película española más alquilada? */
SELECT pelicula.nombre
FROM pelicula
     JOIN alquiler ON pelicula.id = alquiler.pelicula_id
WHERE pelicula.pais = 'España'
LIMIT 1

/* Comentario sobre la consulta 20: Con procedimientos almacenados resultará más completa y correcta */
















