
-- Control de transacciones:
-- el contenido actual 
SET AUTOCOMMIT = 0;

-- actualizar para que la aseguradora "CASER" pase a ser "MUTUA" 
UPDATE pruebas SET fecha = "2023-01-01";
select fecha from pruebas;
+------------+
| fecha      |
+------------+
| 2023-01-01 |
| 2023-01-01 |
| 2023-01-01 |
| 2023-01-01 |
| 2023-01-01 |
+------------+
-- el contenido después de haber deshecho el cambio anterior y volver a la situación original
ROLLBACK;
select fecha from pruebas;
+------------+
| fecha      |
+------------+
| 2023-02-22 |
| 2023-02-28 |
| 2023-03-27 |
| 2023-02-24 |
| 2023-03-26 |
+------------+

-- clientes con mas de un animal
select dni_cliente from animales 
group by dni_cliente
having count(*) > 1

select dni_cliente, nom_cliente, tel_cliente, dom_cliente
from clientes
where dni_cliente IN (
    select dni_cliente from animales 
    group by dni_cliente
    having count(*) > 1
);

-- nombres de los clientes y sus teléfonos mostrando también la 
-- suma de los importes de las visitas de sus animales. El encabezado debe
select nom_cliente, tel_cliente, sum(precio) "suma importes"
from visitas join animales join clientes
on visitas.id_animal = animales.id_animal 
and animales.dni_cliente = clientes.dni_cliente
group by visitas.id_animal;

-- Listar los nombres, raza y número de visitas realizadas por cada animal.
select a.nombre, a.raza, count(id_visita) visitas
from animales a left join visitas v 
on v.id_animal = a.id_animal
group by a.id_animal;

-- no han pasado por la clínica en los meses de febrero y marzo (o sea, que
-- no hay visitas registradas en este período)
select a.nombre perro, c.nom_cliente humano, c.tel_cliente
from visitas v join animales a join clientes c
on v.id_animal = a.id_animal and a.dni_cliente = c.dni_cliente
where MONTH(fecha) NOT IN (2,3);

-- animales se les practicó una prueba de ESTERILIZACION en los últimos 60 días, porque
select id_visita, fecha, DATEDIFF(current_date, fecha) as dias
from pruebas
where tipo_prueba = "ESTERILIZACION" AND
DATEDIFF(current_date, DATE_ADD(fecha, INTERVAL 60 DAY)) < 0; -- 2, 14

select c.nom_cliente, c.tel_cliente, DATEDIFF(current_date, p.fecha) as dias
from pruebas p join visitas v join animales a join clientes c
on p.id_visita = v.id_visita 
    and v.id_animal = a.id_animal
    and a.dni_cliente = c.dni_cliente
where tipo_prueba = "ESTERILIZACION" AND
DATEDIFF(current_date, DATE_ADD(p.fecha, INTERVAL 60 DAY)) < 0; 
