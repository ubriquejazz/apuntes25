CONSULTAS SOBRE LA BD gimnasio
------------------------------

1.	Listado alfabético de actividades que estén activas, indicando el precio de la misma y el nombre del monitor que la imparte (tipo, actividad, precio, monitor). 

2.	Listado de todas las actividades no activas indicando la cantidad de demandas que tiene, ordenadas descendentemente por número de demandas (actividad, número de demandas)

3.	Lista del horario de la actividad denominada ‘Actividad11’ (día de la semana, hora, sala). El día de la semana ha de expresarse de la forma ‘Lunes’, ‘Martes’, ‘Miércoles’, etc. 

4.	Listado alfabético de socios que no estén dados de baja indicando la cantidad que gasta mensualmente en actividades del gimnasio (socio, cantidad mensual). 

5.	Listado de socios que se dieron de baja (socio, teléfono y email).

6.	Listado de los socios que tienen clase a las 18:00 (socio y teléfono). No deben repetirse los datos.

7.	Listado alfabético de actividades ordenadas descendentemente por número de socios que la realizan, de solo aquellas que tengan más de 2 socios (actividad, cantidad de socios).

8.	Listado de monitores indicando su nombre, nif y las actividades que realiza separadas por una coma (monitor, nif, actividades).

Aclaraciones:
-	En la tabla actividad, la columna tarifa se refiere al precio mensual que debe pagar un socio por realizarla.
-	En la tabla actividad, si la columna monitor_idmonitor tiene el valor NULL se considera que la actividad no está activa, es decir, no se está impartiendo en estos momentos en el gimnasio. 
-	Puede que algún socio no participe en ninguna actividad.
-	Puede que una actividad no tenga ninguna demanda.
-	Puede que una actividad, aunque esté activa, no la realice ningún socio.
