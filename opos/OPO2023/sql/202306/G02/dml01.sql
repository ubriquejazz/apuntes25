-- Select socios que tengan algún pedido del libro cuyo título es CSS.
select id_libro from libros where titulo='CSS'; -- 3

SELECT nombre_socio FROM socios 
WHERE id_socio IN (SELECT id_socio FROM pedidos WHERE id_libro = 3);

-- Select 2 socios con mayor número de unidades solicitadas 
-- en los pedidos que han realizado.
SELECT id_socio, sum(unidades)
FROM pedidos 
GROUP BY id_socio
ORDER BY sum(unidades) DESC;

SELECT nombre_socio, telefono
FROM socios 
WHERE id_socio IN (SELECT id_socio 
    FROM pedidos 
    GROUP BY id_socio
    ORDER BY sum(unidades) DESC)
LIMIT 2;

SELECT p.id_socio, nombre_socio, telefono, sum(unidades)
FROM pedidos p JOIN socios s ON p.id_socio = s.id_socio
GROUP BY id_socio
ORDER BY sum(unidades) DESC
LIMIT 2;

-- Obtener los datos de los socios que no han solicitado aún el libro más demandado
SELECT id_libro FROM pedidos 
GROUP BY id_libro 
ORDER BY sum(unidades) DESC; -- libro mas demandado (2)

SELECT id_socio FROM pedidos WHERE id_libro = 2; -- (1,3) han solicitado

SELECT id_socio, nombre_socio FROM socios 
WHERE id_socio NOT IN (SELECT id_socio FROM pedidos WHERE id_libro = 2);

-- Hallar los datos de los socios y el tiempo que llevan sin pedir, 
-- de los socios sin ningún pedido en los últimos 15 anyos

SELECT DATE_ADD(fecha_pedido, INTERVAL 15 YEAR) fecha FROM pedidos;
SELECT DATEDIFF(current_date, DATE_ADD(fecha_pedido, INTERVAL 15 YEAR)) dias FROM pedidos;

SELECT nombre_socio, fecha_pedido,
    DATEDIFF(current_date, DATE_ADD(fecha_pedido, INTERVAL 15 YEAR)) retraso_dias 
FROM pedidos p JOIN socios ON socios.id_socio = p.id_socio
WHERE DATE_ADD(fecha_pedido, INTERVAL 15 YEAR) < current_date;

SELECT nombre_socio, fecha_pedido,
    DATEDIFF(current_date, DATE_ADD(fecha_pedido, INTERVAL 181 MONTH)) retraso_dias 
FROM pedidos p JOIN socios ON socios.id_socio = p.id_socio
WHERE DATE_ADD(fecha_pedido, INTERVAL 181 MONTH) < current_date;

-- Crear una vista con los datos de los socios y el importe total de sus pedidos 
-- Obtenemos éste multiplicando el número de unidades de cada pedido de un libro por su precio
select id_socio, l.titulo, p.unidades, l.precio * p.unidades gasto
from pedidos p join libros l on p.id_libro = l.id_libro
order by id_socio;

select id_socio, sum(l.precio * p.unidades) gasto
from pedidos p join libros l on p.id_libro = l.id_libro
group by id_socio;

CREATE VIEW RESUMEN_SOCIOS AS
    SELECT s.nombre_socio, sum(l.precio * p.unidades) gasto
    FROM pedidos p JOIN libros l ON p.id_libro = l.id_libro
        JOIN socios s ON p.id_socio = s.id_socio
    GROUP BY p.id_socio;

-- Select libros junto con el número de veces que han sido pedidos,
-- incluyendo aquellos libros que no se han pedido jamás.
SELECT l.titulo, ifnull(sum(unidades), 0) veces
FROM libros l LEFT JOIN pedidos p ON p.id_libro = l.id_libro
GROUP BY l.id_libro;

-- Con el ánimo de estimular las ventas y la lectura, aplicar una reducción del 5% al precio de los libros.
SET AUTOCOMMIT = 0;
select precio from libros;

UPDATE LIBROS SET precio = precio * 1.05;
select precio from libros;

ROLLBACK;
select precio from libros;

-- Añadir un índice ÚNICO en la tabla SOCIOS en la columna NOMBRE_SOCIO. 
CREATE FULLTEXT INDEX idx_nombre ON socios(nombre_socio);