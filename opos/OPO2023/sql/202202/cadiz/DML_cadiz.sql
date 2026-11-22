/* ---- CONSULTAS SOBRE LA BD cadiz ---- */

/*1. Listafo alfabético de todas los municipios indicando nombre de municipio, nombre de comarca y número de habitantes (municipio | comarca | poblacion).*/
SELECT municipio.nombre AS municipio,
       comarca.nombre AS comarca,
       municipio.poblacion AS poblacion
FROM municipio JOIN comarca ON municipio.comarca_id = comarca.id
ORDER BY municipio.nombre ASC;

/*2. Listado en orden descendente por población de aquellos municipios que cuenten con más de 30000 habitantes (municipio | habitantes).*/
SELECT nombre AS municipio,
       poblacion AS habitantes 
FROM municipio
WHERE poblacion > 30000
ORDER BY poblacion DESC;

/*3. Listado alfabético de municipios indicando el número de pedanías que tiene (municipio | nº de pedanías). Cuidado porque pueda hebar municipios sin pedanías.*/
SELECT municipio.nombre AS municipio,
       COUNT(pedania.id) AS pedanias
FROM municipio LEFT JOIN pedania ON municipio.id = pedania.municipio_id
GROUP BY municipio.nombre
ORDER BY municipio.nombre ASC;

/*4. Listado alfabético de pedanías indicando a qué municipio pertenece y a qué comarca (pedania | municipio | comarca).*/
SELECT pedania.nombre AS pedania,
       municipio.nombre AS municipio,
       comarca.nombre AS comarca
FROM comarca 
JOIN municipio ON municipio.comarca_id = comarca.id
JOIN pedania ON municipio.id = pedania.municipio_id
ORDER BY pedania.nombre;

/*5. Comparar la densisdad calculada con la terorica (optional)*/
SELECT nombre, densidad as teorica, 
    poblacion/superficie as calculada 
FROM municipio ORDER BY teorica;
