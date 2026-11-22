/* ---- CONSULTAS SOBRE LA BD gimnasio ---- */

/*1. Listado alfabético de actividades que estén activas, indicando el precio de la misma y el nombre del monitor que la imparte (actividad, precio, monitor).*/

SELECT actividad.nombre AS actividad,
       actividad.tarifa AS precio,
       monitor.nombre AS monitor
FROM actividad JOIN monitor ON actividad.monitor_id = monitor.id
WHERE actividad.activaSN = 'S'
ORDER BY actividad.nombre;

/*2. Listado de todas las actividades no activas indicando la cantidad de demandas que tiene, ordenadas descendentemente por número de demandas (actividad, número de demandas)*/

SELECT actividad.nombre AS actividad,
       COUNT(actividad_demanda_socio.actividad_id) AS demandas
FROM actividad LEFT JOIN actividad_demanda_socio ON actividad_demanda_socio.actividad_id = actividad.id
WHERE actividad.activaSN = 'N'
GROUP BY actividad.nombre
ORDER BY 2 DESC;

/*3. Lista del horario de la actividad denominada ‘Actividad1’ (día de la semana, hora, sala). El día de la semana ha de expresarse de la forma ‘Lunes’, ‘Martes’, ‘Miércoles’, etc.*/

SELECT CASE horario.dia 
	     WHEN 'L' THEN 'Lunes'
          WHEN 'M' THEN 'Marte'
          WHEN 'X' THEN 'Miércoles'
          WHEN 'J' THEN 'Jueves'
          WHEN 'V' THEN 'Viernes'
          WHEN 'S' THEN 'Sábado'
          WHEN 'D' THEN 'Domingo'
          END AS dia,
       horario.hora AS hora,
       horario.sala AS sala
FROM horario JOIN actividad ON actividad.id = horario.actividad_id
WHERE actividad.nombre = 'Actividad1';

/*4.	Listado alfabético de socios que no estén dados de baja indicando la cantidad que gasta mensualmente en actividades del gimnasio (socio, cantidad mensual).*/

SELECT socio.nombre as socio,
       SUM(actividad.tarifa) AS gasto_mensual
FROM socio
     JOIN actividad_realiza_socio ON actividad_realiza_socio.socio_id = socio.id
     JOIN actividad ON actividad.id = actividad_realiza_socio.actividad_id
WHERE socio.bajaSN = 'N'
GROUP BY socio.nombre
ORDER BY socio.nombre;

/*5.	Listado de socios que se dieron de baja (socio, teléfono y email).*/

SELECT socio.nombre AS socio,
       socio.telefono AS tlfno,
       socio.email AS email
FROM socio
WHERE bajaSN = 'S';

/*6.	Listado de los socios que tienen clase a las 18:00 (socio y teléfono). No deben repetirse los datos.*/

SELECT DISTINCT socio.nombre AS socio,
       socio.telefono AS tlfno
FROM socio
     JOIN actividad_realiza_socio ON socio.id = actividad_realiza_socio.socio_id
     JOIN actividad ON actividad.id = actividad_realiza_socio.actividad_id
     JOIN horario ON horario.actividad_id = actividad.id
WHERE horario.hora = '18:00:00';

/*7.	Listado alfabético de actividades ordenadas descendentemente por número de socios que la realizan, de solo aquellas que tengan más de 2 socios (actividad, cantidad de socios).*/

SELECT actividad.nombre AS actividad,
       COUNT(actividad_realiza_socio.socio_id) AS socios
FROM actividad LEFT JOIN actividad_realiza_socio ON actividad_realiza_socio.actividad_id = actividad.id
GROUP BY actividad.nombre
HAVING COUNT(actividad_realiza_socio.socio_id) > 2
ORDER BY 2 DESC;

/*8.	Listado de monitores indicando su nombre, nif y las actividades que realiza separadas por una coma (monitor, nif, actividades).*/

SELECT monitor.nombre AS monitor,
       monitor.nif AS nif,
       LISTAGG(actividad.nombre, ', ') WITHIN GROUP (ORDER BY actividad.nombre) AS actividades
FROM monitor 
JOIN actividad ON actividad.monitor_id = monitor.id
GROUP BY monitor.id;

/*Aclaraciones:
-	En la tabla actividad, la columna tarifa se refiere al precio mensual que debe pagar un socio por realizarla.
-	En la tabla actividad, si la columna monitor_id tiene el valor NULL se considera que la actividad no está activa, es decir, no se está impartiendo en estos momentos en el gimnasio. 
-	Puede que algún socio no participe en ninguna actividad.
-	Puede que una actividad no tenga ninguna demanda.
-	Puede que una actividad, aunque esté activa, no la realice ningún socio.
*/