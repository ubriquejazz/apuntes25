-- Consultas sobre la BD series
-- ----------------------------

-- Autor: Juana

/* 1.	Listado alfabético de series (serie | sinopsis | año). */ 
SELECT serie.titulo AS serie,
       serie.sinopsis AS sinopsis,
       serie.anio AS 'año'
FROM serie
ORDER BY 1;

/* 2. Listado alfabético de series mostrando el número de temporadas (serie | temporadas). */

SELECT serie.titulo AS serie,        
       COUNT(temporada.ntemp) AS temporadas 
FROM serie JOIN temporada ON serie.id = temporada.serie_id 
GROUP BY serie.id 
ORDER BY serie.titulo;

/* 3. Listado alfabético de series mostrando el número de temporadas y si está o no finalizada. Si ha finalizado debe aparecer la palabra “SÍ” o nada en caso contrario (serie | temporadas | finalizada). */
SELECT serie.titulo AS serie, 
       COUNT(temporada.ntemp) AS temporadas,
       IF(serie.estado="terminada", "SI", "") AS "finalizada" 
FROM serie JOIN temporada ON temporada.serie_id = serie.id 
GROUP BY serie.id 
ORDER BY serie.titulo ASC;

/* 4. Listado de series según antigüedad en años desde la más antigua a la más moderna (serie | años transcurridos desde su inicio).  */
SELECT serie.titulo AS serie,
       YEAR(NOW()) - serie.anio AS 'año transcurridos desde su inicio' FROM serie
ORDER BY 2 DESC;

/* 5. Listado de usuarios que hayan visto algún capítulo pero no lo hayan valorado (usuario | serie | temporada | capítulo). */
SELECT usuario.nombre AS usuario,
       serie.titulo AS serie,
       temporada.nombre AS temporada,
       capitulo.titulo AS 'capítulo'
FROM serie
     JOIN temporada ON serie.id = temporada.serie_id
     JOIN capitulo ON capitulo.temporada_ntemp = temporada.ntemp 
                      AND
                      capitulo.serie_id = serie.id
     JOIN usuariovecapitulo ON usuariovecapitulo.serie_id = serie.id
                               AND
                               usuariovecapitulo.temporada_ntemp = temporada.ntemp
                               AND
                               usuariovecapitulo.capitulo_ncap = capitulo.ncap
     JOIN usuario ON usuariovecapitulo.usuario_id = usuario.id
WHERE usuariovecapitulo.nota IS NULL;


/* 6. Listado de capítulos donde aparezcan las palabras ‘niño’, ´día’ o ‘árbol’ (serie | capítulo | fecha). La fecha debe aparecer de la forma dd/mm/aaaa. */
SELECT serie.titulo AS serie, 
       capitulo.titulo AS capitulo,
       DATE_FORMAT(capitulo.fecha, "%d/%m/%Y") AS fecha
FROM serie
	 JOIN capitulo ON capitulo.serie_id = serie.id
WHERE capitulo.titulo LIKE '%niño%' OR capitulo.titulo LIKE '%dia%' OR capitulo.titulo LIKE '%arbol%';

/* 7. Listado de series seguidas por el usuario ‘000001’ ordenadas por antigüedad (serie | año).  */
SELECT serie.titulo AS serie, 
       serie.anio AS "año" 
FROM serie 
     JOIN usuariosigueserie ON serie.id = usuariosigueserie.serie_id
WHERE usuariosigueserie.usuario_id = "000001"
ORDER BY serie.anio;


/* 8. Serie mejor valorada (serie | media de valoración).  */
SELECT serie.titulo AS serie,
       AVG(usuariovecapitulo.nota) AS 'media de valoración'
FROM serie
JOIN usuariovecapitulo ON usuariovecapitulo.serie_id = serie.id
GROUP BY serie.id
ORDER BY 2 DESC
LIMIT 1;

/* 9. Listado de temporadas que consten de más de 20 capítulos (serie | temporada | número de capítulos).  */
SELECT serie.titulo AS serie,
       temporada.nombre AS temporada,
       COUNT(capitulo.ncap) AS 'número de capítulos'
FROM serie
     JOIN temporada ON temporada.serie_id  = serie.id
     JOIN capitulo ON capitulo.serie_id = serie.id AND
          capitulo.temporada_ntemp = temporada.ntemp
GROUP BY serie.id, temporada.ntemp
HAVING COUNT(capitulo.ncap) > 20;

/* 10.	Capítulos de la serie ‘Breaking Bad’ en su primera temporada (capítulo | mes en que se emitió).  */
SELECT capitulo.titulo AS capitulo,
       CASE (MONTH(capitulo.fecha)) 
           WHEN 1 THEN 'Enero'
           WHEN 2 THEN 'Febrero'
           WHEN 3 THEN 'Marzo'
           WHEN 4 THEN 'Abril'
           WHEN 5 THEN 'Mayo'
           WHEN 6 THEN 'Junio'
           WHEN 7 THEN 'Julio'
           WHEN 8 THEN 'Agosto'
           WHEN 9 THEN 'Septiembre'
           WHEN 10 THEN 'Octubre'
           WHEN 11 THEN 'Noviembre'
           WHEN 12 THEN 'Diciembre'
       END AS 'mes en que se emitió'
FROM capitulo 
       JOIN serie ON serie.id = capitulo.serie_id
WHERE serie.titulo = 'Breaking Bad' AND capitulo.temporada_ntemp = 1
ORDER BY capitulo.ncap;

/* 11. Número de semanas transcurridas entre el primer y el último capítulo de “Juego de tronos” (número de semanas en emisión).  */
SELECT TIMESTAMPDIFF(WEEK, min(capitulo.fecha),max(capitulo.fecha)) AS 'número de semanas en emisión'
FROM capitulo 
	JOIN serie ON serie.id = capitulo.serie_id 
WHERE serie.titulo = 'Juego de tronos';

/* 12.	Número de temporada por la que van las series no terminadas (serie | temporada).  */
SELECT serie.titulo AS serie, 
       MAX(temporada.ntemp) AS temporada 
FROM serie JOIN temporada ON temporada.serie_id = serie.id
WHERE serie.estado = 'activa'
GROUP BY serie.id;

/* 13. Listado de series ordenado descendentemente por número de seguidores (serie | número de seguidores | seguidores).  */
SELECT
    serie.titulo AS serie,
    COUNT(usuariosigueserie.usuario_id) AS 'número de seguidores',
    GROUP_CONCAT(usuario.nombre) AS seguidores
FROM
    serie
JOIN usuariosigueserie ON usuariosigueserie.serie_id=serie.id
JOIN usuario ON usuario.id = usuariosigueserie.usuario_id
GROUP BY serie.id
ORDER BY 2 DESC;

/* 14.	Listado alfabético de series que no sigue nadie (serie | sinopsis | año). */

SELECT serie.titulo AS serie,
       serie.sinopsis AS sinopsis,
       serie.anio AS 'año'
FROM serie
WHERE serie.id NOT IN (SELECT DISTINCT usuariosigueserie.serie_id FROM usuariosigueserie);

/* 15.	Listado de series que sigue el usuario ‘000001’ pero que aún no ha terminado de ver (serie). */

SELECT serie.titulo AS serie
FROM serie JOIN usuariosigueserie ON usuariosigueserie.serie_id = serie.id
WHERE usuariosigueserie.usuario_id = '000001' 
AND serie.id NOT IN
	(  SELECT serie.id
       FROM usuariovecapitulo 
       JOIN serie ON usuariovecapitulo.serie_id = serie.id
       WHERE usuariovecapitulo.usuario_id = '000001' AND serie.estado = 'terminada'
       GROUP BY serie.id
       HAVING COUNT(usuariovecapitulo.capitulo_ncap) = 
              (SELECT COUNT(*) FROM capitulo WHERE capitulo.serie_id = serie.id)
    );
