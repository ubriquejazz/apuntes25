
-- 8. Presentar todas las lineas de detalle de la factura 1, indicando 
--    numero de orden, nombre del articulo, cantidad, precio e importe (precio * cantidad)

SELECT detalle.id AS num, 
       codigo_articulo AS articulo,
       cantidad, precio, cantidad*precio AS importe 
FROM   detalle
WHERE  numero_factura = 1;

SELECT detalle.id AS num, 
       (SELECT nombre FROM articulo WHERE codigo = codigo_articulo) AS articulo,
       cantidad, precio, cantidad*precio AS importe 
FROM   detalle
WHERE  numero_factura = 1;

-- 9. Indicar la cantidad de facturas que tiene el cliente cuyo nif es nif1

SELECT COUNT(*) FROM factura 
WHERE id_cliente = (SELECT id FROM cliente WHERE nif = 'nif1'); 

-- 10. Presentar todas las facturas indicando numero de factura, fecha '%d/%m/%Y' y forma de pago. 
-- La fecha debe aparecer com dd/mm/aaaa y la forma de pago debe ser CONTADO O TARJETA en lugar de C o T

SELECT numero,
	DATE_FORMAT(fecha,'%d/%m/%Y') AS fecha, 
	IF (forma_pago='C','CONTADO','TARJETA') AS "pago"
FROM factura;

-- 11. Presentar todos los datos de los articulos, ordenados alfabaticamente,  
--     cuyo precio esta por debajo de la media de precios.

SELECT * FROM articulo 
WHERE precio < (SELECT AVG(precio) FROM articulo) 
ORDER BY nombre;

/* 12. Presentar el nombre de los articulos que no hayan superado el 10% del total de las unidades vendidas */

-- Paso 1: diez porciento del total de las unidades vendidas 
SELECT 0.1 * SUM(cantidad) INTO @a FROM detalle;

--  Paso 2: agrupar 
SELECT codigo_articulo, SUM(cantidad) FROM detalle GROUP BY codigo_articulo HAVING SUM(cantidad) < @a;

-- Paso 3
SELECT codigo_articulo
FROM detalle 
GROUP BY codigo_articulo 
HAVING COUNT(*) < (SELECT SUM(cantidad) FROM detalle) * 0.1;

-- Formato y alias
SELECT 
       (SELECT nombre FROM articulo WHERE codigo = codigo_articulo) as articulo
FROM 
       detalle 
GROUP BY 
       codigo_articulo 
HAVING 
       COUNT(*) < (SELECT SUM(cantidad) FROM detalle) * 0.1;

-- 13. Presentar la cantidad de facturas emitidas en el mes de febrero.

SELECT COUNT(*) FROM factura WHERE MONTH(fecha) = 2;
SELECT COUNT(*) FROM factura WHERE fecha LIKE '____-02-__';

/* 14. Presentar todos los datos de los articulos que contengan el texto 'BLA BLA'
 ordenados por precio descendente en primer lugar y alfabeticamente en segundo lugar
*/
SELECT * FROM articulo 
WHERE descripcion LIKE '%bla bla%'
ORDER BY precio DESC, nombre ASC; 

-- 15. Listar las 2 mejores poblaciones en cuanto a cantidad de clientes que provienen de ellas.

SELECT poblacion FROM cliente
GROUP BY poblacion
ORDER BY COUNT(*) DESC
LIMIT 3;

/* 16
Presentar el mayor y el menor precio a los que se ha vendido el articulo con codigo A4.
*/
SELECT MAX(precio), MIN(precio)  FROM detalle
WHERE codigo_articulo = 'A4' GROUP BY codigo_articulo;
 
/* 17. Listado de clientes (nombre, nif, tiempo en d�as desde la �ltima factura) que no tengan el valor NULL en el campo email
/*
SELECT nombre, 
       nif, 
       TIMESTAMPDIFF(DAY,(SELECT MAX(fecha) FROM factura WHERE id = id_cliente GROUP BY id_cliente),NOW())
FROM cliente
WHERE email IS NOT NULL;

/* 18. Poner a NULL el campo email de auqellos clientes cuyo email sea de hotmail salvo que la fecha de alta sea anterior a 2013
*/
UPDATE cliente SET email = NULL  
WHERE email LIKE '%@hotmail.%' AND YEAR(fecha_ingreso) >= 2013 

/* 19. Insertar el articulo Articulo8 con codigo A8 y un precio de 15,99 euros
/*
INSERT articulo (codigo, nombre, precio) VALUES ('A8','Articulo8',15.99); 

/* 20.
Borrar todos los clientes que no tengan ninguna factura.
/*
DELETE FROM cliente WHERE id NOT IN (SELECT DISTINCT id_cliente FROM factura);

